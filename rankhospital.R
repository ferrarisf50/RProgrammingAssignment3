##source("rankhospital.R")
##setwd("c:/users/ferrarisf50/desktop/RProgrammingAssignment3")

rankhospital <- function(state, outcome, num = "best") {
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
      table1 <- table1[order(table1[,2],table1[,1]),]
      if (num=="best") 
      {      
                   ##min1 <- which.min(table1[,2])
                       ##table1[min1,1] 
                         table1[1,1] 
      }
      else if (num=="worst")
      {
                     max1 <- which.max(table1[,2])
                     table1[max1,1] 
      }
      else if (num<=nrow(table1))
      {
                     table1[num,1]
      }
      else return(NA)
      
    
    
    
    }
    else stop("invalid state")
      



## Return hospital name in that state with the given rank
## 30-day death rate
}



# table1 <- read.csv("outcome-of-care-measures.csv", header=TRUE, colClasses = "character")
# table1 <- subset(table1,table1$State=="TX",select=c(2,17))
# 
# table1[,2] <- suppressWarnings(as.numeric(table1[,2]))
# table1 <- na.omit(table1)
# table1 <- table1[order(table1[,2],table1[,1]),]
# table1[1,1]

