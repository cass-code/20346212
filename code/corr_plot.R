corr_plot <- function(movies, xaxis_size = 5, xaxis_rows = 3){
  library(tayloRswift)
  
  g <-
    movies %>% 
    ggplot() +
    geom_point(aes(x = `Audience  score %` , y = `Worldwide Gross`, color = `Worldwide Gross` ), size = 4, alpha = 0.8) +
    
    scale_fill_taylor(palette = "lover", guide = "none") +
    theme_bw() +
    scale_x_discrete(guide = guide_axis(n.dodge = xaxis_rows)) +
    labs(title = "Worldwide Grossing and Audience Scores", subtitle = "Investigating the relationship", caption = "Correlation", x = "Audience Score", y = "Worldwide grossing") +
    theme(legend.position = "top", legend.title = element_blank()) +
    theme(plot.title = element_text(size = 14),
          plot.subtitle = element_text(size = 12),
          axis.text.x = element_text(size = xaxis_size)) +
    guides(color = F)
  # If you wanted to make the x-axis vertical:
  # theme(axis.text.x=element_text(angle = 90, hjust = 1))
  
  g
  
  
}

