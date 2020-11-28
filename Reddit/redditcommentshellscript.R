library(tidyverse)
library(RedditExtractoR)

links <- reddit_urls(
  search_terms = "al qaeda",
  cn_threshold = 20,
  page_threshold = 4
)
 
max_url <- links %>% filter(num_comments == max(num_comments))

content <- reddit_content(max_url$URL[1], wait_time = 2)

# content <- reddit_content("https://www.reddit.com/r/Python/comments/k2pyeb/recording_terminal_sessions_with_python/")
write.csv(content$comment, file = "test.csv", row.names = FALSE)