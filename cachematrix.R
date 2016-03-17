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

makeCacheMatrix <- function(z = matrix()) {
      invrs <- NULL
      set <- function(y) { 
      		## use the new <<- operator to assign a value to an object stored in an environment other than the 	current env. 
            z <<- y
            invrs <<- NULL
      }
      get <- function() z
      setinv <- function(inverse) invrs<<- inverse
      getinv <- function() invrs
      list(set = set,
           get = get,
           setinv = setinv,
           getinv = getinv)
}


## This function computes the inverse of the special "matrix" created by makeCacheMatrix. It returns the inverse of the original matrix in makeCacheMatrix (above)

cacheSolve <- function(z, ...) {
      ## Returns a matrix that is the inverse of 'z'
      invrs <- z$getinv()
      if (!is.null(invrs)) { ## R returns from the cache and does not compute the inverse if the inverse has already been computed. So, the first time I run cacheSolve the message below does not return; the second time I call the function, it does
            message("retrieving cached data - inverse previously computed")
            return(invrs)
      }
      ## if inverse has not yet been calculated, the function calculates the inverse.
      mtx <- z$get()
      invrs <- solve(mtx, ...)
      z$setinv(invrs)
      invrs
}