##source("rankall.R")
##setwd("c:/users/ferrarisf50/desktop/RProgrammingAssignment3")

rankall <- function(outcome, num = "best") {
  ## Read outcome data
  
  table1 <- read.csv("outcome-of-care-measures.csv", header=TRUE, colClasses = "character")
  
  ## Check that state and outcome are valid
  
  if (outcome=="heart attack")  outcome1 <-11 
  else if (outcome=="heart failure") outcome1 <- 17 
  else if (outcome=="pneumonia") outcome1 <- 23
  else stop("invalid outcome") 
  
  ## For each state, find the hospital of the given rank
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
 
  
  
  

  
  
  
  
  
    
    table1 <- subset(table1,select=c(2,outcome1,7))
    
    table1[,2] <- suppressWarnings(as.numeric(table1[,2]))
    table1 <- na.omit(table1)
     group <- split(table1,table1$State)
  table2 <- sapply(group, function(x) { 
    table3 <- x[order(x[,2],x[,1]),]
    if(num == "best") {num <- 1}
    else if(num == "worst"){num <-nrow(table3)}
    table3[num,1]
    
    })
  
  ## Return hospital name in that state with the given rank
  ## 30-day death rate
  
  table4 <- data.frame(hospital = table2)
  table4$state <- row.names(table4)
  
 
  table4
    
    
    
 
  
  
  
  
}

# head(rankall("heart attack", 20), 10)
# tail(rankall("pneumonia", "worst"), 3)
# tail(rankall("heart failure"), 10)

