# Takes a number in csv format
# Produces latex code for the matrix

#values = """
#1,-1,0,0,1,|,3
#1,1,0,-3,0,|,6
#2,-1,0,0,-1,|,5
#-1,2,0,-2,-1,|,-1
#"""

values = """
H
T
"""

matrix = True # If False: determinant


def TrimStartEnd(val):
    s = list(val)
    s[0] = ""
    s[-1] = "\n"
    out = "".join(s)
    return out

values = TrimStartEnd(values)
values = values.replace(",", " & ")
values = values.replace("\n", " \\\\ \n")
values = values.replace("|", "\\bigm|")
if matrix:
    values = '\\begin{bmatrix} \n' + values
    values = values + '\\end{bmatrix}'
else:
    values = '\\begin{vmatrix} \n' + values
    values = values + '\\end{vmatrix}'


print(values)
