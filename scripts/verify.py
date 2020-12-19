import sys

CHARSET = "123456789 =-ABCDEFGHI+.)JKLMNOPQR-$*/STUVWXYZ0,("

class Issue:
    """ class Issue 
    
    A generic class for handling the tracking and pretty-printing of issues in
    the FORTRAN source program. """
    
    def __init__(self, fp, ln, cols, statement, details, dangerous=False, 
            suggestions=[]):
        self.fp = fp
        self.ln = ln
        self.cols = cols
        self.statement = statement
        self.details = details
        self.dangerous = dangerous
        self.suggestions = suggestions
        
    def __str__(self):
        gutter = " {} | ".format(self.ln)
        spacer = " "*(len(gutter) - 2) + "| "
    
        return "{}: {} ({}::{}:{})\n".format(
            "error" if self.dangerous else "warning",
            " ".join(self.details),
            self.fp, self.ln, self.cols[0]
        ) + spacer + "\n" + "{}{}\n".format(
            gutter, self.statement
        ) + spacer + "{}{} {}\n".format(
            " "*(self.cols[0] - 1),
            "^"*len(self.cols),
            self.details[1]
        ) + "\n".join(
            " "*(len(gutter) - 2) + "= help: " + suggestion 
                for suggestion in self.suggestions
        )

if __name__ == "__main__":
    if len(sys.argv) < 2:
        exit("usage: python {} <fortran program>".format(sys.argv[0]))

    # read list of statements...
    fp = sys.argv[1]
    with open(fp, "r") as fh:
        statements = fh.read().strip().split("\n")

    issues = []

    labels = {} # {label: declaration line}
    sequencing = -1 # track sequence numbering
    for ln, statement in enumerate(statements):
        ln = ln + 1

        # first, check for illegal (ie. non-Hollerith) characters in source 
        # file, as these are likely to cause errors
        for column, c in enumerate(list(statement)):
            if c not in CHARSET:
                issues.append(
                    Issue(fp, ln, [column + 1], statement, 
                        ["statement contains", "illegal character"], 
                        dangerous=True)
                )
        
        # we should also check for lines that exceed the 80-column limit
        if len(statement.strip()) > 80:
            overflow = list(range(81, len(statement.strip()) + 1))
        
            issues.append(
                Issue(fp, ln, overflow, statement, 
                    ["statement exceeds 80 column limit", ""])
            )
        
        # all other parsing rules do not apply to comments
        if (statement.startswith("C")):
            continue

        # extract the different fields from the statement
        label, continuation, expression, sequence = \
            statement[0:5], statement[5:6], statement[6:72], statement[72:80]

        # verify that label is valid
        for column, c in enumerate(list(label)):
            if c not in " 0123456789":
                issues.append(
                    Issue(fp, ln, [column + 1], statement, 
                        ["label field contains", "illegal character"], 
                        dangerous=True)
                )

        if label.strip() and label.strip().isdigit():
            # check for duplicate/badly ordered label declarations
            if int(label) in labels.keys():
                issues.append(
                    Issue(fp, ln, [1, 2, 3, 4, 5], statement, 
                        ["duplicate label", "already defined on line {}".format(
                            labels[int(label)]
                        )], dangerous=True)
                )
            elif len(labels.keys()) >= 1 and int(label) < max(labels.keys()):
                issues.append(
                    Issue(fp, ln, [1, 2, 3, 4, 5], statement, 
                        ["badly ordered labels", "previous was {}".format(
                            max(labels.keys())
                        )]
                    )
                )
                
            labels[int(label)] = ln

        # verify that continuation is valid
        if continuation.strip() and continuation.strip() not in "*!23456789":
            issues.append(
                Issue(fp, ln, [6], statement, 
                    ["continuation field contains", "illegal character"])
            )
        
        # verify that sequence is valid
        for column, c in enumerate(list(sequence.strip())):
            if c not in "0123456789":
                issues.append(
                    Issue(fp, ln, [73 + column], statement, 
                        ["sequence field contains", "illegal character"])
                )
        
        if sequence and sequence.startswith(" "):
            issues.append(
                Issue(fp, ln, [73, 74, 75, 76, 77, 78, 79, 80], statement, 
                    ["consider left-justifying sequence field", ""])
            )
		
        if sequence and sequence.strip().isdigit():
            if int(sequence.strip()) <= sequencing:
                issues.append(
                    Issue(fp, ln, [73, 74, 75, 76, 77, 78, 79, 80], statement,
                        ["decreasing sequence number", ""])
                )
            
            sequencing = int(sequence)
        
    if len(issues) <= 0:
        print("No suggestions!")
    else:
        for issue in issues:
            print(str(issue))
