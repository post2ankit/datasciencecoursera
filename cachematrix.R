makeCacheMatrix <- function(x = matrix()){
  ## Initialize the inv variable to Null
  inv <- NULL
  ## Define the set function, which initializes the original matrix variable
  set <- function(y){
    x <<- y
    inv <<- NULL
  }
  ## Defines the get function, which returns the original matrix
  get <- function() x
  ## Defines the get Inv Matrix function, which returns the inversed matrix
  getInvMatrix <- function() inv
  ## Defines the set Inv Matrix function, which defines the inversed matrix
  setInvMatrix <- function(invMatrix) inv <<- invMatrix
  list(set = set, get = get, setInvMatrix = setInvMatrix, getInvMatrix= getInvMatrix)
}

cacheSolve <- function (x, ...){
  inverse <- x$getInvMatrix()
  ## Check if the inverse matrix value is already available or not
  if (!is.null(inverse)){
    ## If inverse matrix value is available, just return that cached instance value only
    message("returning cached value of inversed matrix !!!")
    return(inverse)
  }
  ## If inverse matrix value is not available, calculate the inverse
  inverse <- solve(x$get())
  ## Sets the inverse matrix function so that it can be reused later
  x$setInvMatrix(inverse)
  return(inverse)
} 