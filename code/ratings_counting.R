
#count how many times when rotten tomatoes rated it 80% that audiences rates it >85%
ratings_counting <- function(movies){
  library(tidyverse)
  
  # right <- movies %>% filter(`Rotten Tomatoes %` > 80 & `Audience  score %` >85) %>% count()
  # number_of_movies <- count()
  # right_freq <- right/number_of_movies
  # 
  # 
  # right
  
  right <- movies %>% filter(`Rotten Tomatoes %` > 80 & `Audience  score %` >85) 
  #number_of_movies <- movies %>% count(film)
  right_freq <- (right/74) *100
  
  right_freq
  
  
}