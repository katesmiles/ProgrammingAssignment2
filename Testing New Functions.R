
##Setting working directory.
setwd("~/RProgramming/ProgrammingAssignment2")

##Sourcing functions
source("cachematrix.R")

##Creating matrix to test the functions.
test_matrix <- makeCacheMatrix(matrix(1:4, 2, 2))

##Calling the test matrix
test_matrix$get()

##Creating the inverse of the test matrix.
test_matrix$getInverse()
cacheSolve(test_matrix)

##Runing cachSolve function now that inverse has been cached.
cacheSolve(test_matrix)
test_matrix$getInverse()

##Setting new values of test matrix.
test_matrix$set(matrix(c(4, 4, 2, 1), 2, 2))
test_matrix$get()
test_matrix$getInverse()
cacheSolve(test_matrix)
cacheSolve(test_matrix)
test_matrix$getInverse()