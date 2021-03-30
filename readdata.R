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



#DelPonte Lab
delponte = gsheet2tbl("https://docs.google.com/spreadsheets/d/1R6UXFcsbVgpPYyvfkPvZ81rqkyk4U_9aS7qV8TKPsxQ/edit?usp=sharing")
delponte_all <- delponte %>%
  filter(labcode != 0) %>%
  mutate(id = case_when(
    is.na(py_binomial) ~ "No",
    TRUE ~ "Yes"
  )) %>%
  mutate(wheat = case_when(
    host_binomial == "Triticum aestivum" ~ "Wheat",
    TRUE ~ "Non-wheat"
  )) %>% 
  mutate(lab = "DelPonte-Lab")

delponte_all = delponte_all %>% 
  dplyr::select(lab, labcode, year, lat, lon, country, state_province, county_municipality, collector, host_binomial, py_binomial, py_lineage, wheat)


#Kamoun lab
kamoun = gsheet2tbl("https://docs.google.com/spreadsheets/d/13PyoQobtdE3xessW14rHud45MlXUOsMOgKDWG81kxCc/edit#gid=1082341206")
kamoun_all = kamoun %>%
  filter(labcode != 0) %>%
  mutate(id = case_when(
    is.na(py_binomial) ~ "No",
    TRUE ~ "Yes"
  )) %>%
  mutate(wheat = case_when(
    host_binomial == "Triticum aestivum" ~ "Wheat",
    TRUE ~ "Non-wheat"
  )) %>% 
  mutate(lab = "Kamoun-Lab")

kamoun_all <- kamoun_all %>% 
  dplyr::select(lab, labcode, year, lat, lon, country, state_province, county_municipality, collector, host_binomial, py_binomial, py_lineage, wheat)


#Raw data
wb_all = bind_rows(delponte_all, kamoun_all)

sd <- SharedData$new(wb_all)

wb_all2 <- wb_all %>% 
  select(lab, labcode, year, country, collector, host_binomial,
         py_binomial, py_lineage, wheat)
  
sd2 <- SharedData$new(wb_all2)
