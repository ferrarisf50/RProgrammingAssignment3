##setwd("c:/users/tangp05/desktop")
##source("best.R")
best <- function(state, outcome) {
## Read outcome data
   

table1 <- read.csv("outcome-of-care-measures.csv", header=TRUE, colClasses = "character")
     

## Check that state and outcome are valid
    
    if (outcome=="heart attack")  outcome1 <-11 
      else if (outcome=="heart failure") outcome1 <- 17 
      else if (outcome=="pneumonia") outcome1 <- 23
        else stop("invalid outcome") 
    
     state1 <- as.vector(unique(table1$State))
    if (state %in% state1) {
      
      

      table1 <- subset(table1,table1$State==state,select=c(2,outcome1))

      table1[,2] <- suppressWarnings(as.numeric(table1[,2]))
      table1 <- na.omit(table1)
      table1 <- table1[order(table1$Hospital.Name),]
      min1 <- which.min(table1[,2])
      table1[min1,1]
     
       


     }
     else stop("invalid state")
    
        

## Return hospital name in that state with lowest 30-day death
## rate
}



##best("TX", "heart attack")


##best("TX", "heart failure")

##best("MD", "heart attack")

##best("MD", "pneumonia")

##best("BB", "heart attack")

##best("NY", "hert attack")


