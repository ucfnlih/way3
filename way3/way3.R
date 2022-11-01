520+520
5200+5200
library(tidyverse)
listfile2<-dir_info("allfiles/") %>%
  filter(str_detect(path, "wc2.1_5m_tmax_ACCESS-CM2_ssp585_2081-2100.tif")) %>%
  dplyr::select(path)%>%
  pull()
worldclimtemp1 <- listfile1 %>%
  terra::rast()
worldclimtemp2 <- listfile2 %>%
  terra::rast()
ssp126 <- c("ssp126a","ssp126b","ssp126c","ssp126d","ssp126e","ssp126f","ssp126g","ssp126h","ssp126i","ssp126j","ssp126k","ssp126l")
ssp585 <- c("ssp585a","ssp585b","ssp585c","ssp585d","ssp585e","ssp585f","ssp585g","ssp585h","ssp585i","ssp585j","ssp585k","ssp585l")
names(worldclimtemp1) <- ssp126
names(worldclimtemp2) <- ssp585
worldclimtemp1
worldclimtemp2
AUcitytemp1<- terra::extract(worldclimtemp1, samples)
AUcitytemp2<- terra::extract(worldclimtemp2, samples)
Aucitytemp1 <- AUcitytemp1 %>% 
  as_tibble()%>% 
  add_column(Site = site, .before = "ssp126a")
Aucitytemp2 <- AUcitytemp2 %>% 
  as_tibble()%>% 
  add_column(Site = site, .before = "ssp585a")
Aucitytemp1_ssp_select<-Aucitytemp1[,c(3:14)]
Aucitytemp1_ssp_max<-pmax(Aucitytemp1_ssp_select$ssp126a,Aucitytemp1_ssp_select$ssp126b,Aucitytemp1_ssp_select$ssp126c,Aucitytemp1_ssp_select$ssp126d,Aucitytemp1_ssp_select$ssp126e,Aucitytemp1_ssp_select$ssp126f,Aucitytemp1_ssp_select$ssp126g,Aucitytemp1_ssp_select$ssp126h,Aucitytemp1_ssp_select$ssp126i,Aucitytemp1_ssp_select$ssp126j,Aucitytemp1_ssp_select$ssp126k,Aucitytemp1_ssp_select$ssp126l)
Aucitytemp1_ssp_select<-Aucitytemp1[,c(3:14)]

