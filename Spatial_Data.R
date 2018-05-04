#The HW is "For the homework this week, represent spatial data using either ggmap
# or leaflet (but encourage you to try leaflet with either a dataset we
# used in our presentation or follow an example online that uses leaflet
# - http://hautahi.com/rmaps) and talk about what you can learn from the map.” 


# What I did here is following hautahi's example:

library(rgdal)
library(leaflet)
port <- readOGR(dsn = "./data", layer = "Police_Districts_Portland")
crime <- readOGR(dsn = "./data", layer = "NIJ_Nov2016_Crime")


par(mfrow=c(1,2))
# Make two plots in one graph

plot(port); title(main = list("Portland Police Districts (Polygon Object)", cex=0.8))
plot(crime); title(main = list("November 2016 Crime Reports (Points Object)", cex=0.8))

# Those two graphs shows the map of portland polica districts and the crime reports at the year
# of 2016, then we may need to see the summary of the crime '

summary(crime)

# The next duty is map the crimets that occur outside the city by using a R functions, in
# both of clipped and non-clipped.

crime_clp <- crime[port, ] # "Clip" crime to stay in same area

par(mfrow=c(1,2))
plot(port); points(crime); title(main = list("Original Crime Data", cex=0.8))
plot(port); points(crime_clp); title(main = list("Clipped Crime Data", cex=0.8))

# The last work we did is plotting the spatial data with leaflet:
# First let we create a dataset called crime_egg

crime_agg <- aggregate(x=crime["CATEGORY"],by=port,FUN=length) # Aggregate by district
summary(crime_agg)
crime_agg <- spTransform(crime_agg, CRS("+init=epsg:4326")) 
qpal <- colorBin("Reds", crime_agg$CATEGORY, bins=5)

leaflet(crime_agg) %>%
  addPolygons(stroke = TRUE,opacity = 1,fillOpacity = 0.5, smoothFactor = 0.5,
              color="black",fillColor = ~qpal(CATEGORY),weight = 1) %>%
  addLegend(values=~CATEGORY,pal=qpal,title="Crime Count")

# Comments:
# 1. I understand how to use a package that named leaflet, which is a useful tool to mapping 
# events to a map
# 2. The package "rgdal", is a tool for geospatial data abstraction, which provides a trong toolbox 
# of that.

