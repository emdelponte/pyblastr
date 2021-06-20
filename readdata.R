library(gsheet)
library(tidyverse)
library(crosstalk)
library(DT)
library(ggthemes)
library(janitor)
library(cowplot)
library(plotly)
library(flexdashboard)
library(tidyverse)
library(crosstalk)
library(plotly)
library(viridis)
library(leaflet.providers)
library(leaflet)

Sys.setlocale("LC_ALL", "pt_BR.UTF-8")



#Ascari et al 202?
ascari = gsheet2tbl("https://docs.google.com/spreadsheets/d/1R6UXFcsbVgpPYyvfkPvZ81rqkyk4U_9aS7qV8TKPsxQ/edit#gid=532754791")
ascari_all <- ascari %>%
  filter(labcode != 0) %>%
  mutate(id = case_when(
    is.na(py_binomial) ~ "No",
    TRUE ~ "Yes"
  )) %>%
  mutate(wheat = case_when(
    host_binomial == "Triticum aestivum" ~ "Wheat",
    TRUE ~ "Non-wheat"
  ))

ascari_all = ascari_all %>% 
  dplyr::select(labcode, year, lat, lon, country, state_province, county_municipality, source, host_binomial, py_binomial, py_lineage, wheat)



#BioTrigo
biotrigo = gsheet2tbl("https://docs.google.com/spreadsheets/d/1R6UXFcsbVgpPYyvfkPvZ81rqkyk4U_9aS7qV8TKPsxQ/edit#gid=1498154130")
biotrigo_all = biotrigo %>%
  filter(labcode != 0) %>%
  mutate(id = case_when(
    is.na(py_binomial) ~ "No",
    TRUE ~ "Yes"
  )) %>%
  mutate(wheat = case_when(
    host_binomial == "Triticum aestivum" ~ "Wheat",
    TRUE ~ "Non-wheat"
  ))

biotrigo_all <- biotrigo_all %>%
  dplyr::select(labcode, year, lat, lon, country, state_province, county_municipality, source, host_binomial, py_binomial, py_lineage, wheat)



#Tembo et al 2021
tembo = gsheet2tbl("https://docs.google.com/spreadsheets/d/1R6UXFcsbVgpPYyvfkPvZ81rqkyk4U_9aS7qV8TKPsxQ/edit#gid=1727645447")
tembo_all = tembo %>%
  filter(labcode != 0) %>%
  mutate(id = case_when(
    is.na(py_binomial) ~ "No",
    TRUE ~ "Yes"
  )) %>%
  mutate(wheat = case_when(
    host_binomial == "Triticum aestivum" ~ "Wheat",
    TRUE ~ "Non-wheat"
  ))

tembo_all <- tembo_all %>% 
  dplyr::select(labcode, year, lat, lon, country, state_province, county_municipality, source, host_binomial, py_binomial, py_lineage, wheat)



# #Croll 2021 
# croll = gsheet2tbl("https://docs.google.com/spreadsheets/d/1R6UXFcsbVgpPYyvfkPvZ81rqkyk4U_9aS7qV8TKPsxQ/edit#gid=106318963")
# croll_all = croll %>%
#   filter(labcode != 0) %>%
#   mutate(id = case_when(
#     is.na(py_binomial) ~ "No",
#     TRUE ~ "Yes"
#   )) %>%
#   mutate(wheat = case_when(
#     host_binomial == "Triticum aestivum" ~ "Wheat",
#     TRUE ~ "Non-wheat"
#   ))
# 
# croll_all <- croll_all %>% 
#   dplyr::select(labcode, year, lat, lon, country, state_province, county_municipality, source, host_binomial, py_binomial, py_lineage, wheat)
# 




# #Rahnama et al 202?
# Rahnama = gsheet2tbl("https://docs.google.com/spreadsheets/d/1R6UXFcsbVgpPYyvfkPvZ81rqkyk4U_9aS7qV8TKPsxQ/edit#gid=2126271613")
# Rahnama_all = Rahnama %>%
#   filter(labcode != 0) %>%
#   mutate(id = case_when(
#     is.na(py_binomial) ~ "No",
#     TRUE ~ "Yes"
#   )) %>%
#   mutate(wheat = case_when(
#     host_binomial == "Triticum aestivum" ~ "Wheat",
#     TRUE ~ "Non-wheat"
#   ))
# 
# Rahnama_all <- Rahnama_all %>% 
#   dplyr::select(labcode, year, lat, lon, country, state_province, county_municipality, source, host_binomial, py_binomial, py_lineage, wheat)




# #Castroaugudin et al 2016
# Castroaugudin = gsheet2tbl("https://docs.google.com/spreadsheets/d/1R6UXFcsbVgpPYyvfkPvZ81rqkyk4U_9aS7qV8TKPsxQ/edit#gid=1870344414")
# Castroaugudin_all = Castroaugudin %>%
#   filter(labcode != 0) %>%
#   mutate(id = case_when(
#     is.na(py_binomial) ~ "No",
#     TRUE ~ "Yes"
#   )) %>%
#   mutate(wheat = case_when(
#     host_binomial == "Triticum aestivum" ~ "Wheat",
#     TRUE ~ "Non-wheat"
#   ))
# 
# Castroaugudin_all <- Castroaugudin_all %>% 
#   dplyr::select(labcode, year, lat, lon, country, state_province, county_municipality, source, host_binomial, py_binomial, py_lineage, wheat)






#Raw data
wb_all = bind_rows(ascari_all, biotrigo_all, tembo_all)





sd <- SharedData$new(wb_all)

wb_all2 <- wb_all %>% 
  select(labcode, year, country, source, host_binomial, py_binomial, py_lineage, wheat)
  
sd2 <- SharedData$new(wb_all2)
