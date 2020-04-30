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

## Find information for Baltimore City
## find mean for year 1999
C1999DF <- filter(VehicleDF, fips=="24510", year=="1999", VehicleYes)
Bmean1999 <- mean(C1999DF$Emissions)

## find mean for year 2002
C2002DF <- filter(VehicleDF, fips=="24510", year=="2002", VehicleYes)
Bmean2002 <- mean(C2002DF$Emissions)        

## find mean for year 1999
C2005DF <- filter(VehicleDF, fips=="24510", year=="2005", VehicleYes)
Bmean2005 <- mean(C2005DF$Emissions)

## find mean for year 2002
C2008DF <- filter(VehicleDF, fips=="24510", year=="2008", VehicleYes)
Bmean2008 <- mean(C2008DF$Emissions)          

## Find information for Los Angeles County
## find mean for year 1999
C1999DF <- filter(VehicleDF, fips=="06037", year=="1999", VehicleYes)
Lmean1999 <- mean(C1999DF$Emissions)

## find mean for year 2002
C2002DF <- filter(VehicleDF, fips=="06037", year=="2002", VehicleYes)
Lmean2002 <- mean(C2002DF$Emissions)        

## find mean for year 1999
C2005DF <- filter(VehicleDF, fips=="06037", year=="2005", VehicleYes)
Lmean2005 <- mean(C2005DF$Emissions)

## find mean for year 2002
C2008DF <- filter(VehicleDF, fips=="06037", year=="2008", VehicleYes)
Lmean2008 <- mean(C2008DF$Emissions)  



## create a dataframe to plot the data

plotDF <- data.frame(
        city=c(rep("Baltimore",4),rep("Los Angeles",4)),
        year= rep(c("1999", "2002", "2005", "2008"),2),
        Emissions= c(Bmean1999, Bmean2002,Bmean2005,Bmean2008,Lmean1999, Lmean2002,Lmean2005,Lmean2008)
        )

myGraph <- ggplot(plotDF, aes(x=year, y=Emissions, group=city, color=city)) +
        labs(title = "Comparison of total motor vehicle emissions in Baltimore and LA")+ 
        geom_line(aes(linetype=city, colour=city))+
        geom_point(aes(shape=year))+
        scale_linetype_manual(values=c("twodash", "dotted"))

## create the plot file for plotting the results.         
        png(filename="plot6.png", width = 480, height = 480, units = "px")
        myGraph
        dev.off()












