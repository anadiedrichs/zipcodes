# run once
# install.packages("maps")
library(maps)
data(world.cities)

head(world.cities)

library(dplyr)
dataset <- world.cities %>%
           select(name, country.etc,capital) 

write.csv(dataset,file="cities-countries.csv")

# download zipcodes info, source from https://stackoverflow.com/questions/50845838/map-zip-codes-to-their-respective-city-and-state-in-r

ZipCodeSourceFile = "http://download.geonames.org/export/zip/US.zip"
temp <- tempfile()
download.file(ZipCodeSourceFile , temp)
ZipCodes <- read.table(unz(temp, "US.txt"), sep="\t")
unlink(temp)
names(ZipCodes) = c("CountryCode", "zip", "PlaceName", 
                    "AdminName1", "AdminCode1", "AdminName2", "AdminCode2", 
                    "AdminName3", "AdminCode3", "latitude", "longitude", "accuracy")
head(ZipCodes)