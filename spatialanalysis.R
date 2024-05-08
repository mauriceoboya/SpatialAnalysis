library(sf)
library(ggplot2)
library(leaflet)


kenya_adm0 <- st_read("/home/fibonacci/Downloads/ken_adm_iebc_20191031_shp/ken_admbnda_adm0_iebc_20191031.shp")
kenya_adm1 <- st_read("/home/fibonacci/Downloads/ken_adm_iebc_20191031_shp/ken_admbnda_adm1_iebc_20191031.shp")
kenya_adm2 <- st_read("/home/fibonacci/Downloads/ken_adm_iebc_20191031_shp/ken_admbnda_adm2_iebc_20191031.shp")

plot(kenya_adm0$geometry)
plot(kenya_adm1$geometry, add = TRUE)
plot(kenya_adm2$geometry, add = TRUE)

ggplot() +
  geom_sf(data = kenya_adm0) +
  geom_sf(data = kenya_adm1) +
  geom_sf(data = kenya_adm2)

nairobi_adm2 <- kenya_adm2[kenya_adm2$ADM1_EN == "Kakamega", ]

# Create a leaflet map
m <- leaflet() %>%
  addProviderTiles("CartoDB.Positron") %>%
  addPolygons(data = nairobi_adm2, 
              fillColor = "lightblue", 
              color = "black", 
              weight = 1, 
              opacity = 1, 
              fillOpacity = 0.7,
              label = ~ADM2_EN)

m
