
#count how many times when rotten tomatoes rated it 80% that audiences rates it >85%
ratings_plot <- function(movies){
  library(tidyverse)

  g <-
    movies %>%
    ggplot() +
    geom_point(aes(film, y = `Rotten Tomatoes %`, color = `Rotten Tomatoes %`), size = 5, alpha = 0.7) +
    theme_bw() + guides(color = F) +
    scale_fill_brewer(palette="Dark2") +
    scale_x_discrete(guide = guide_axis(n.dodge = 2)) +
    #labs(title = "Top Median Reviews per Winery: South Africa", subtitle = "Top wineries for Lauren and Susan", caption = "Data source: WineMag.com", x = "", y = "Median Winery review for wines over $20") +
    theme(legend.position = "top", legend.title = element_blank()) +
    theme(plot.title = element_text(size = 14),
          plot.subtitle = element_text(size = 12))
  
  g

}