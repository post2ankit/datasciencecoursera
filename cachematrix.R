makeCacheMatrix <- function(x = matrix()){
  inv <- NULL
  set <- function(y){
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  getInvMatrix <- function() inv
  setInvMatrix <- function(invMatrix) inv <<- invMatrix
  list(set = set, get = get, setInvMatrix = setInvMatrix, getInvMatrix= getInvMatrix)
}

cacheSolve <- function (x, ...){
  inverse <- x$getInvMatrix
  if (!is.null(inverse)){
    return(inverse)
  }
  inverse <- solve(x$get)
  x$setInvMatrix(inverse)
  return(inverse)
} 