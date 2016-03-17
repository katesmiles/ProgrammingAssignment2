## Script to cache the inverse of a matrix:
## Notes from assignment: Matrix inversion is usually a costly computation and there may be some 
## benefit to caching the inverse of a matrix rather than computing it repeatedly.
## This script contains two functions that can be used to 
      ##1) create a special "matrix" object that can cache its inverse - function called makeCacheMatrix
      ##2) computes the inverse of the special "matrix" returned by makeCacheMatrix above - function called cacheSolve
            ##If the inverse has already been calculated (and the matrix has not changed), 
            ##then this second function (cacheSolve) should retrieve the inverse from the cache.
##Note: For this assignment, assume that the matrix supplied is always invertible.

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
      inv <- NULL
      set <- function(y) {
            x <<- y
            inv <<- NULL
      }
      get <- function() x
      setInverse <- function(inverse) inv<<- inverse
      getInverse <- function() inv
      list(set = set,
           get = get,
           setInverse = setInverse,
           getInverse = getInverse)
}


## This function computes the inverse of the special "matrix" created by makeCacheMatrix.

cacheSolve <- function(x, ...) {
      ## Returns a matrix that is the inverse of 'x'
      inv <- x$getInverse()
      if (!is.null(inv)) {
            message("retrieving cached data")
            return(inv)
      }
      mat <- x$get()
      inv <- solve(mat, ...)
      x$setInverse(inv)
      inv
}