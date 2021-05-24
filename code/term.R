term <- function(dff_adj){
  
  term <-
    dff_adj %>% group_by(country) %>% grep("tannins"| "Tannins"| "Smoke"| "Smokey" | "Smoke"| "smoke" | "smokey"| "smoke"| "ash"| "Ash", description)
  
  term
  
}