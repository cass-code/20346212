freq <- function(movies){
  
  right <- movies %>% filter(`Rotten Tomatoes %` > 80 & `Audience  score %` >85) %>% count()
  
  right
  
}