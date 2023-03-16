## This function creates a special "matrix", which is a list containing a function to set the value of the matrix, get the value of the matrix, set  the inverse, get the inverse

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) m <<- solve
  getsolve <- function() m
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}


## This function calculates the inverse of the special "matrix" created with the above function

cacheSolve <- function(x, ...) {
  m <- x$getsolve()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  mat<-x$get()
  m <- solve(mat)
  x$setsolve(m)
  m
}

        ## Return a matrix that is the inverse of 'x'
