## The function makeCacheMatrix creates a special “matrix” object that can
## cache its inverse.
## The function cacheSolve computes the inverse of the special “matrix”
## returned by makeCacheMatrix above. If the inverse has already been
## calculated (and the matrix has not changed), then the cachesolve
## should retrieve the inverse from the cache. Computing the inverse of a square
## matrix can be done with the solve function in R. For example, if X is a
## square invertible matrix, then solve(X) returns its inverse.

## The first function, makeCacheMatrix creates a special "matrix", which is
## really a list containing a function to
## 1. set the value of the matrix
## 2. get the value of the matrix
## 3. set the value of the inverse
## 4. get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function(y) {
      x <<- y
      i <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) i <<- inverse
    getinverse <- function() i
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}

## This function computes the inverse of the special "matrix" created by
## makeCacheMatrix above. If the inverse has already been calculated
## (and the matrix has not changed), cacheSolve should retrieve the
## inverse from the cache and skip the computation.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  i = x$getinverse()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data,...)
  x$setinverse(i)
  i
}
