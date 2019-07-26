library("tidyverse")
log_tib = read_csv("events_log.csv", col_types = 'cccccicii')
log_tib_sep = log_tib %>% separate(timestamp, c('Day', 'Time'), sep = 8)

# Question 1a
 
num_visitPage = log_tib_sep %>% group_by(session_id) %>% filter(action == 'visitPage') %>% group_by(Day) %>% count()
num_notvisitPage = log_tib_sep %>% group_by(session_id) %>% filter(action != 'visitPage') %>% group_by(Day) %>% count()
num_notvisitPage = num_notvisitPage[-1,]

num_visitPage$Proportion = num_visitPage$n/num_notvisitPage$n

# Question 1b
num_vp_group = log_tib_sep %>% group_by(session_id) %>% filter(action == 'visitPage') %>% group_by(Day,group) %>% count()
num_nvp_group = log_tib_sep %>% group_by(session_id) %>% filter(action != 'visitPage') %>% group_by(Day,group) %>% count()
num_nvp_group = num_nvp_group[-1,]

