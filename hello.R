

# This R script demostrates how to call .c programms from R
# Craig Chao, 2014/11


sub_dir <- "R/hello/"

# Wrapper function to invoke "helloA" at the shell.
helloA <- function() {
  system(paste(getwd(), sub_dir, "helloA",sep="/"))
}
#source('wrappers.R')
helloA()


# Wrapper function to invoke helloB with a named argument
dyn.load(paste(getwd(), sub_dir, "helloB.so",sep="/"))
helloB <- function() {
  result <- .C("helloB", greeting="")
  return(result$greeting)
}
helloB()
greeting <- helloB()
greeting


# Wrapper function to invoke helloC with two arguments
dyn.load(paste(getwd(), sub_dir, "helloC.so",sep="/"))
helloC <- function(greeting) {
  if (!is.character(greeting)) {
    stop("Argument 'greeting' must be of type 'character'.")
  }
  result <- .C("helloC",
               greeting=greeting,
               count=as.integer(1))
  return(result$count)
}
helloC("C: Hello World!")
greeting <- helloC("C: Hello World!")
greeting


# wrapper function to invoke helloA1
dyn.load(paste(getwd(), sub_dir, "helloA1.so",sep="/"))
helloA1 <- function() {
  result <- .Call("helloA1")  #arg is the function name
}

#source('wrappers.R')
greeting <- helloA1()
greeting
class(greeting)



# wrapper function to return a greeting.
dyn.load(paste(getwd(), sub_dir, "helloB1.so",sep="/"))
helloB1 <- function() {
  result <- .Call("helloB1")
  return(result)
}
#source('wrappers.R')
greeting <- helloB1()
greeting
class(greeting)




# wrapper function to invoke helloC1 
dyn.load(paste(getwd(), sub_dir, "helloC1.so",sep="/"))
helloC1 <- function(greeting) {
  result <- .Call("helloC1", greeting)
  return(result)
}
#source('wrappers.R')
greeting <- c("Hello World!", "Bonjour tout le monde!", "Привет мир!")
greeting
helloC1(greeting)






















