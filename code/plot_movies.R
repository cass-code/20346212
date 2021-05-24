plot_movies <- function(movies, xaxis_size = 5, xaxis_rows = 3){
  library(tayloRswift)
  
  g <-
    movies %>% 
    ggplot() +
    geom_point(aes(x = `Audience  score %` , y = `Rotten Tomatoes %`, color =`Rotten Tomatoes %` ), size = 4, alpha = 0.8) +
  

    scale_fill_taylor(palette = "lover", guide = "none") +
    theme_bw() +
    scale_x_discrete(guide = guide_axis(n.dodge = xaxis_rows)) +
    labs(title = "Movie ratings", subtitle = "Rotten Tomatoes and Audience Scores", caption = "Movie Ratings", x = "Audience Score", y = "Rotten Tomatoes Score") +
    theme(legend.position = "top", legend.title = element_blank()) +
    theme(plot.title = element_text(size = 14),
          plot.subtitle = element_text(size = 12),
          axis.text.x = element_text(size = xaxis_size)) +
    guides(color = F)
  # If you wanted to make the x-axis vertical:
  # theme(axis.text.x=element_text(angle = 90, hjust = 1))
  
  g
  
  
}

