setwd("C:/Users/TOURE/Mes documents/REPOSITORIES/LQAS_raw_data/LQAS_level1/")

library(tidyverse)
library(dplyr)
library(sf)
library(flextable)
library(stringr)
library(stringi)
library(lubridate)
library(readxl)
library(ggplot2)


#read_all_files
list_of_files <- list.files(paste0("C:/Users/TOURE/Mes documents/REPOSITORIES/LQAS_raw_data/LQAS_level1/"), recursive = T, full.names = T)
#lapply()

A <- lapply(list_of_files, function(x){read_csv(x)}) |> 
  bind_rows() |> 
  filter(response != "NA")
# c <- A[!(is.na(AC$response))]
LQAS_fin<-A |> 
  mutate(start_date = as_date(start_date),
         year = year(start_date)) |> 
  select(country, province, district , response , vaccine.type , roundNumber, numbercluster , start_date, end_date, year, male_sampled, female_sampled, total_sampled, male_vaccinated, female_vaccinated , total_vaccinated, total_missed, status , performance, r_non_compliance=r_Non_Compliance, r_house_not_visited=r_House_not_visited, r_childabsent, r_child_was_asleep=r_Child_was_asleep, r_child_is_a_visitor=r_Child_is_a_visitor, r_vaccinated_but_not_FM=r_Vaccinated_but_not_FM, other_r, prct_care_giver_informed_SIA = percent_care_Giver_Informed_SIA, prct_non_compliance=prct_Non_Compliance, prct_house_not_visited=prct_House_not_visited, prct_childabsent, prct_child_was_asleep=prct_Child_was_asleep, prct_child_is_a_visitor=prct_Child_is_a_visitor, prct_vaccinated_but_not_FM=prct_Vaccinated_but_not_FM, prct_security, prct_childnotborn, prct_other_r) |>
  filter(start_date > as_date(2019-10-1),
         year>2019,
         district != "NA") |> 
  arrange(start_date)
write_csv(LQAS_fin,"C:/Users/TOURE/Mes documents/REPOSITORIES/LQAS_raw_data/AFRO_LQAS_data.csv")


# write_csv(LQAS_fin,"C:/Users/TOURE/Mes documents/REPOSITORIES/LQAS_raw_data/AFRO_LQAS.csv")

# A <- read_csv("C:/Users/TOURE/Mes documents/REPOSITORIES/LQAS_raw_data/AFRO_LQAS.csv")
# B <- A |> 
#   mutate(start_date = as_date(start_date)) |> 
#   mutate(year = year(start_date)) |> 
#   filter(year > 2019) |> 
#   select(country, province, district , response , vaccine.type , roundNumber, numbercluster , start_date, end_date, year, male_sampled, female_sampled, total_sampled, male_vaccinated, female_vaccinated , total_vaccinated, total_missed, status , performance, r_Non_Compliance, r_House_not_visited, r_childabsent, r_Child_was_asleep, r_Child_is_a_visitor, r_Vaccinated_but_not_FM, other_r, percent_care_Giver_Informed_SIA) |> 
#   arrange(start_date)
# B$end_date <- ymd(B$end_date)
# year(B$end_date[year(B$end_date) == 2028]) <- 2023
# year(B$end_date[year(B$end_date) == 2025]) <- 2024








# these_ac["entree"][these_ac["Anonymat"] == "2025-06-13"] <- "2024-06-13"




