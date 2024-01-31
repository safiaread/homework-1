if (!require("pacman")) install.packages("pacman")
pacman::p_load(tidyverse, ggplot2, dplyr, lubridate, stringr, readxl, data.table, gdata)
data <- readRDS("data/output/full_ma_data.rds")
data <- data %>%
subset(year > 2009)
# n_obs(data)
# table(data$plan_types)
head(data)
unique(data$plan_type) # 26
nrow(data)
summary(data)

mini_data <- data[1:50,]
summary(mini_data)
plan_mdata <- subset(mini_data, select = c(plan_type, year, snp, eghp, plan_name))
count(unique(data$plan_type))


library(tidyverse)

#sandbox
mini_data %>%
subset(select = c(plan_type, year))%>%
group_by(plan_type, year)%>%
count()%>%
pivot_wider(names_from = year, values_from = n)

#q3
data %>%
subset(select = c(plan_type, year))%>%
group_by(plan_type, year)%>%
count()%>%
pivot_wider(names_from = year, values_from = n)

#q4
q4 <- data %>%
subset(snp == "No" & eghp == "No", select = c(plan_type, year))%>%
group_by(plan_type, year)%>%
count()%>%
pivot_wider(names_from = year, values_from = n)

service <- readRDS("/Users/safiaread/Desktop/homework_1/data/output/contract_service_area.rds")
head(service)

head(q4)
q4 %>%
  inner_join(service, by=c("contractid", "fips", "year"))

#rm(list = c("remove large data sets"))
#save.image("submission/hw1_workspace.Rdata"))