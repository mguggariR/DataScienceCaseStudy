## Read data sources in to R Dataframes
        epaRawDF <- readRDS("summarySCC_PM25.rds")

## Calcualte mean emissions from all sources in Baltimore for each of the 1999, 2002, 2005, and 2008 years      
y1999MeanEmissions <- mean(epaRawDF[epaRawDF$year=="1999" & epaRawDF$fips=="24510", "Emissions"], na.rm = TRUE)
y2002MeanEmissions <- mean(epaRawDF[epaRawDF$year=="2002" & epaRawDF$fips=="24510", "Emissions"], na.rm = TRUE)
y2005MeanEmissions <- mean(epaRawDF[epaRawDF$year=="2005" & epaRawDF$fips=="24510", "Emissions"], na.rm = TRUE)
y2008MeanEmissions <- mean(epaRawDF[epaRawDF$year=="2008" & epaRawDF$fips=="24510", "Emissions"], na.rm = TRUE)

## Create a data frame with results.         
yearlyEmission <- data.frame(years=c(1999, 2002, 2005, 2008), 
                             emissions= c(y1999MeanEmissions, y2002MeanEmissions, y2005MeanEmissions, y2008MeanEmissions))

## create the plot file for plotting the results.         
        png(filename="plot2.png", width = 480, height = 480, units = "px")
        plot(yearlyEmission$years, yearlyEmission$emissions, 
             type="l", pch=20, 
             main="PM2.5 emissions from all sources in Baltimore from 1999-2008", 
             xlab="Years", ylab="Mean Emissions in tons")
        dev.off()