profitability <- function(movies){
  
  profit <- movies %>% group_by(`Lead Studio`) %>% summarise(mean(Profitability, na.rm = TRUE))
  
}