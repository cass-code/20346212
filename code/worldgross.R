worldgross <- function(movies){
  
  numbers <- movies %>% group_by(`Lead Studio`) %>% summarise(mean(`Worldwide Gross`, na.rm = TRUE))
  
}