library(dplyr)
library(tidyr)
library(ggplot2)

## Read data sources in to R Dataframes
epaRawDF <- readRDS("summarySCC_PM25.rds")
sourceClassCode <- readRDS("Source_Classification_Code.rds") 

## Create combined dataframe with common source code SCC:

## SCCDF <- mutate(sourceClassCode, EmSource=paste(SCC.Level.One, SCC.Level.Three, sep = " "))
SCCDF <- select(sourceClassCode, SCC, SCC.Level.Two)

CombinedDF <- merge(epaRawDF, SCCDF, by.x = "SCC")

## find observations for Coal Combustion sources and form new dataframe         

VehicleDF <- mutate(CombinedDF, VehicleYes=grepl("\\bVehicle\\b", SCC.Level.Two))

## find mean for year 1999
C1999DF <- filter(VehicleDF, fips=="24510", year=="1999", VehicleYes)
mean1999 <- mean(C1999DF$Emissions)

## find mean for year 2002
C2002DF <- filter(VehicleDF, fips=="24510", year=="2002", VehicleYes)
mean2002 <- mean(C2002DF$Emissions)        

## find mean for year 1999
C2005DF <- filter(VehicleDF, fips=="24510", year=="2005", VehicleYes)
mean2005 <- mean(C2005DF$Emissions)

## find mean for year 2002
C2008DF <- filter(VehicleDF, fips=="24510", year=="2008", VehicleYes)
mean2008 <- mean(C2008DF$Emissions)          

## create a dataframe to plot the data
plotDF <- data.frame(
        year= c("1999", "2002", "2005", "2008"),
        Emissions= c(mean1999, mean2002,mean2005,mean2008)
)

myGraph <- ggplot(data = plotDF, aes(x=year, y=Emissions,group=1, shape=year, colour=year))+
        labs(title = "Comparison of total motor vehicle emissions in Baltimore City")+ 
        geom_point()+
        geom_line(color="red")


## create the plot file for plotting the results.         
## png(filename="plot5.png", width = 480, height = 480, units = "px")
myGraph
## dev.off()
