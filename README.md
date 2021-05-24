# Purpose

This folder is my solution to the data science test. This README
documents my answers to and thoughts of the test.

For all my operations I created functions, placed them in the code
folders for every question and then sourced them. (I got this structure
from the mock assessment solution).

The idea is that each Question’s folder works on a standalone basis -
with the root folder collating it all and detailing what happens in each
question.

### Getting started

I used the fmxdat package to make a new project. When I copied my path
location, I had to use an addin to convert the backslashes to forward
ones so that R could read it properly. Then I created 3 different
templates for questions 1, 2, and 3; each with their own R project and
folders.

``` r
CHOSEN_LOCATION <- "C:/Users/Cassandra/OneDrive/Documents/2021 Academics/Data Science/"
fmxdat::make_project(FilePath = glue::glue("{CHOSEN_LOCATION}Test/"), 
                     ProjNam = "20346212")

Texevier::create_template(directory = glue::glue("{CHOSEN_LOCATION}Test/20346212/"), template_name = "Question1")
Texevier::create_template(directory = glue::glue("{CHOSEN_LOCATION}Test/20346212/"), template_name = "Question2")
Texevier::create_template(directory = glue::glue("{CHOSEN_LOCATION}Test/20346212/"), template_name = "Question3")
```

## Code used for Figures and Tables

``` r
gc()
```

    ##          used (Mb) gc trigger (Mb) max used (Mb)
    ## Ncells 405396 21.7     838802 44.8   638942 34.2
    ## Vcells 736874  5.7    8388608 64.0  1633950 12.5

``` r
# I am loading in the libraries I need:
library(knitr)
```

    ## Warning: package 'knitr' was built under R version 4.0.5

``` r
library(pacman)
p_load(tidyverse, lubridate)

# Here I am sourcing my functions (stored in a separate code folder) for Question 1 using walk:

list.files('Question1/code/', full.names = T, recursive = T) %>% as.list() %>% walk(~source(.))
```

### Data

I downloaded the zipped folder from my email, extracted all, and then
put the data files in their respective question folders.

``` r
#Data loading:
    movies <- read_csv("C:/Users/Cassandra/OneDrive/Documents/2021 Academics/Data Science/Test/20346212/Question1/data/Movies/Movies.csv")
```

    ## 
    ## -- Column specification --------------------------------------------------------
    ## cols(
    ##   Film = col_character(),
    ##   Genre = col_character(),
    ##   `Lead Studio` = col_character(),
    ##   `Audience  score %` = col_double(),
    ##   Profitability = col_double(),
    ##   `Rotten Tomatoes %` = col_double(),
    ##   `Worldwide Gross` = col_double(),
    ##   Year = col_double()
    ## )

## Question 1

If we look at the audience scores compared to Rotten Tomatoes, we see
that my friend’s statement only holds for 2 movies out of the 74. I
built a function to filter out movies which had a Rotten tomatoes score
of greater than 80 and where audience ratings were greater than 85 and
then to count those number of movies.

``` r
 right <- freq(movies)

 kable(right)
```

|   n |
|----:|
|   2 |

In general we can see that the audience and Rotten Tomatoes tend to
score in the same range for the same movie:

``` r
g <-plot_movies(movies, xaxis_size = 5, xaxis_rows = 3)
g
```

    ## Warning: Removed 1 rows containing missing values (geom_point).

![](README_files/figure-markdown_github/unnamed-chunk-5-1.png)

### Profitability

I wrote a function to calculate the average profitability and average
worldwide gross of the studios and then sourced it. If we calculate the
average profitability of all the studios, we see that Disney has the
highest average.The table is not very pretty but it keeps breaking when
I adjust the code so it will have to do for now.

``` r
profit <-  profitability(movies)

kable(profit)
```

| Lead Studio           | mean(Profitability, na.rm = TRUE) |
|:----------------------|----------------------------------:|
| 20th Century Fox      |                          2.532310 |
| CBS                   |                          2.202571 |
| Disney                |                          7.406009 |
| Fox                   |                          4.511522 |
| Independent           |                          6.582046 |
| Lionsgate             |                          1.806509 |
| New Line              |                          2.071000 |
| Paramount             |                          2.594000 |
| Sony                  |                          4.836326 |
| Summit                |                          6.377962 |
| The Weinstein Company |                          1.221114 |
| Universal             |                          4.435962 |
| Warner Bros.          |                          3.210305 |
| NA                    |                          3.307180 |

I also wrote a function to look at the average world grossings, which
shows:

``` r
gross <- worldgross(movies)
kable(gross)
```

| Lead Studio           | mean(`Worldwide Gross`, na.rm = TRUE) |
|:----------------------|--------------------------------------:|
| 20th Century Fox      |                              78.37900 |
| CBS                   |                              77.09000 |
| Disney                |                             288.65751 |
| Fox                   |                             120.42805 |
| Independent           |                              81.41819 |
| Lionsgate             |                              76.29606 |
| New Line              |                              20.71000 |
| Paramount             |                              80.30316 |
| Sony                  |                             100.78001 |
| Summit                |                             248.45260 |
| The Weinstein Company |                              23.27300 |
| Universal             |                             168.93889 |
| Warner Bros.          |                             173.43266 |
| NA                    |                              92.60105 |

### Correlation

Using the Spearman’s corrlation test we can see that the correlation
between world wide gross and audience score is in fact 29% which is far
below 80%.

``` r
corr <- cor.test(x=movies$`Audience  score %`, y=movies$`Worldwide Gross`, method = 'spearman', exact = FALSE)
print(corr)
```

    ## 
    ##  Spearman's rank correlation rho
    ## 
    ## data:  movies$`Audience  score %` and movies$`Worldwide Gross`
    ## S = 45945, p-value = 0.01243
    ## alternative hypothesis: true rho is not equal to 0
    ## sample estimates:
    ##       rho 
    ## 0.2912333

# Question 3 Solution

To be honest I spent too much time debugging my code because nothing for
any of the three questions was working so here is the my pitiful showing
for question 3: Ideally I would have bound all the data into 1 data
frame but it’s not working. So all calculations would be repeated for
each data set.

``` r
#First I need to replace the characters in photos in order to be able to work with the variable
photo1 <- tweets_bbc %>% select(photos) %>%  mutate(photos = replace(photos, photos == '[]', 0)) %>%  mutate(photos = replace(photos, photos != 0, 1))
```

Once this has been done for all three, I would sum the number of 1’s in
the video and photo columns, and divide these by the total number of
tweets. Then I would use ggplot to graph three line graphs to show how
these changed and compared over time for the three different outlets.
