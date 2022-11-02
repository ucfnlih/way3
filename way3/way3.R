library(sf)
library(tidyverse)
library(here)
library(janitor)
library(countrycode)
library(usethis)
shape <- st_read("C:/Users/WD/Desktop/GIS/WEEK4_HW/WEEK4_Homework/World_Countries_(Generalized)/World_Countries__Generalized_.shp")
HDI <- read_csv(here::here("HDR21-22_Composite_indices_complete_time_series.csv"),
                locale = locale(encoding = "latin1"),
                na = " ", skip=0)
## Column names
HDIcols<- HDI %>%
  clean_names()%>%
  select(iso3, country, gii_2019, gii_2010)%>%
  mutate(difference=gii_2019-gii_2010)%>%
  mutate(iso_code=countrycode(country, origin = 'country.name', destination = 'iso2c'))%>%
  mutate(iso_code2=countrycode(iso3, origin ='iso3c', destination = 'iso2c'))
Join_HDI <- shape %>% 
  clean_names() %>%
  left_join(., 
            HDIcols,
            by = c("iso" = "iso_code"))

