library(googlesheets)
library(dplyr)
library(ggplot2)

ddata <- gs_url("https://docs.google.com/spreadsheets/d/1phoNhmy4aVb7QHYV9uHH7l9hKRRZcAdOY8eK1sqPzFo/edit?usp=sharing") %>% gs_read()
names(ddata) <- c("time", "session", "nickname", "score")

ddata %>% filter(!is.na(score)) %>% group_by(session) %>% ggplot(aes(x=session)) + geom_histogram(stat="count")

ddata %>% filter(!is.na(score)) %>% group_by(session) %>% ggplot(aes(x=session, y=score)) + geom_boxplot() + ylim(0,10)

ddata %>% filter(!is.na(score)) %>% group_by(nickname) %>% ggplot(aes(x=factor(nickname), y=score)) + geom_boxplot() + ylim(0, 10)
