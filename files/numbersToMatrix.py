# Takes a number in csv format
# Produces latex code for the matrix

#values = """
#1,-1,0,0,1,|,3
#1,1,0,-3,0,|,6
#2,-1,0,0,-1,|,5
#-1,2,0,-2,-1,|,-1
#"""

values = """
V(a_1X_1),Cov(a_1X_1, a_2,X_2),x,Cov(a_1X_1,a_nX_n)
Cov(a_2X_1),V(a_2X_2), a_2,X_2),x,Cov(a_1X_1,a_nX_n)
x
Cov(a_nX_n,a_1X_1),Cov(a_nX_n,a_2,X_2),x,V(a_nX_n)
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
