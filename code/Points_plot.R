Points_plot <- function(dff_adj, Title, Subtitle,
                                                 xaxis_size = 10,
                                                 xaxis_rows = 1){
  
  library(tayloRswift)
  library(tidyverse)# will need this library for Taylor Swift album colour palettes

    # This removes the ugly summarise warning...
  options(dplyr.summarise.inform=F)
 
  points1 <- dff_adj %>% 
             count(country) %>% 
             rename(number_of_ratings = n)
            
  #view(points1)
  
  median <- dff_adj %>% group_by(country) %>% summarise_at(vars(points), ~median(.)) %>% 
    rename(median = points)
  view(median)

  
  points2 <- left_join(points1, median)
  view(points2)
  
  
 g <- points2 %>%  ggplot() +
   geom_bar(aes(x=country, y=number_of_ratings, fill = country), stat = "identity") + 
   geom_text(aes(country, y = number_of_ratings, label = median), vjust = 0) +
 
    scale_fill_taylor(palette = "lover", guide = "none") +
    scale_x_discrete(guide = guide_axis(n.dodge = xaxis_rows)) +
    labs(title = Title, subtitle = Subtitle, caption = "Data source: World Wine", x = "", y = "Number of ratings") +
    theme(legend.position = "top", legend.title = element_blank()) +
    theme(plot.title = element_text(size = 14),
    plot.subtitle = element_text(size = 12), axis.text.x = element_text(size = xaxis_size)) +
    guides(fill = F)
  
  g
 
}