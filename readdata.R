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
  mutate(Source = "Ascari et al. (unpublished)")

delponte_all = delponte_all %>% 
  dplyr::select(Source, labcode, year, lat, lon, country, state_province, county_municipality, collector, host_binomial, py_binomial, py_lineage, wheat)


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
  mutate(Source = "Kamoun-Lab")

kamoun_all <- kamoun_all %>% 
  dplyr::select(Source, labcode, year, lat, lon, country, state_province, county_municipality, collector, host_binomial, py_binomial, py_lineage, wheat)


#Farman lab
farman = gsheet2tbl("https://docs.google.com/spreadsheets/d/1Ax1QWcVsNBxrRGXLxhwlvjwZtDjixdsuyVC51-0bgs0/edit?usp=sharing")
farman_all = farman %>%
  filter(labcode != 0) %>%
  mutate(id = case_when(
    is.na(py_binomial) ~ "No",
    TRUE ~ "Yes"
  )) %>%
  mutate(wheat = case_when(
    host_binomial == "Triticum aestivum" ~ "Wheat",
    TRUE ~ "Non-wheat"
  )) %>% 
  mutate(Source = "Farman-Lab")

farman_all <- farman_all %>% 
  dplyr::select(Source, labcode, year, lat, lon, country, state_province, county_municipality, collector, host_binomial, py_binomial, py_lineage, wheat)



#BioTrigo 
biotrigo = gsheet2tbl("https://docs.google.com/spreadsheets/d/18Ifv9rKzHM4do5foH3ZPsmXkZBGqnAORpFoXt0gdWjg/edit?usp=sharing")
biotrigo_all = biotrigo %>%
  filter(labcode != 0) %>%
  mutate(id = case_when(
    is.na(py_binomial) ~ "No",
    TRUE ~ "Yes"
  )) %>%
  mutate(wheat = case_when(
    host_binomial == "Triticum aestivum" ~ "Wheat",
    TRUE ~ "Non-wheat"
  )) %>% 
  mutate(Source = "BioTrigo Genetica")

biotrigo_all <- biotrigo_all %>% 
  dplyr::select(Source, labcode, year, lat, lon, country, state_province, county_municipality, collector, host_binomial, py_binomial, py_lineage, wheat)


#Croll lab 
croll = gsheet2tbl("https://docs.google.com/spreadsheets/d/1uJGZSdtZJc0mHlFB7yoSeWTs2zMVzlSrOaCNCRp1Il0/edit?usp=sharing")
croll_all = croll %>%
  filter(labcode != 0) %>%
  mutate(id = case_when(
    is.na(py_binomial) ~ "No",
    TRUE ~ "Yes"
  )) %>%
  mutate(wheat = case_when(
    host_binomial == "Triticum aestivum" ~ "Wheat",
    TRUE ~ "Non-wheat"
  )) %>% 
  mutate(Source = "https://doi.org/10.5281/zenodo.4655959")

croll_all <- croll_all %>% 
  dplyr::select(Source, labcode, year, lat, lon, country, state_province, county_municipality, host_binomial, py_binomial, py_lineage, wheat)






#Raw data
wb_all = bind_rows(delponte_all, kamoun_all, farman_all, biotrigo_all, croll_all)






sd <- SharedData$new(wb_all)

wb_all2 <- wb_all %>% 
  select(lab, labcode, year, country, collector, host_binomial,
         py_binomial, py_lineage, wheat)
  
sd2 <- SharedData$new(wb_all2)
