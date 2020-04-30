library(ggplot2)
## Read data sources in to R Dataframes
        epaRawDF <- readRDS("summarySCC_PM25.rds")

## Calcualte mean emissions from type "POINT" for each of the 1999, 2002, 2005, and 2008 years      
        y1999MeanEmPoint <- mean(epaRawDF[epaRawDF$year=="1999" & epaRawDF$fips=="24510"& epaRawDF$type=="POINT", "Emissions"], na.rm = TRUE)
        y2002MeanEmPoint <- mean(epaRawDF[epaRawDF$year=="2002" & epaRawDF$fips=="24510"& epaRawDF$type=="POINT", "Emissions"], na.rm = TRUE)        
        y2005MeanEmPoint <- mean(epaRawDF[epaRawDF$year=="2005" & epaRawDF$fips=="24510"& epaRawDF$type=="POINT", "Emissions"], na.rm = TRUE)
        y2008MeanEmPoint <- mean(epaRawDF[epaRawDF$year=="2008" & epaRawDF$fips=="24510"& epaRawDF$type=="POINT", "Emissions"], na.rm = TRUE)
        

## Calcualte mean emissions from type "NONPOINT" for each of the 1999, 2002, 2005, and 2008 years   
        y1999MeanEmNonPoint <- mean(epaRawDF[epaRawDF$year=="1999" & epaRawDF$fips=="24510"& epaRawDF$type=="NONPOINT", "Emissions"], na.rm = TRUE)
        y2002MeanEmNonPoint <- mean(epaRawDF[epaRawDF$year=="2002" & epaRawDF$fips=="24510"& epaRawDF$type=="NONPOINT", "Emissions"], na.rm = TRUE)        
        y2005MeanEmNonPoint <- mean(epaRawDF[epaRawDF$year=="2005" & epaRawDF$fips=="24510"& epaRawDF$type=="NONPOINT", "Emissions"], na.rm = TRUE)
        y2008MeanEmNonPoint <- mean(epaRawDF[epaRawDF$year=="2008" & epaRawDF$fips=="24510"& epaRawDF$type=="NONPOINT", "Emissions"], na.rm = TRUE)
        
## Calcualte mean emissions from type "ON-ROAD" for each of the 1999, 2002, 2005, and 2008 years      
        y1999MeanEmOnRoad <- mean(epaRawDF[epaRawDF$year=="1999" & epaRawDF$fips=="24510"& epaRawDF$type=="ON-ROAD", "Emissions"], na.rm = TRUE)
        y2002MeanEmOnRoad <- mean(epaRawDF[epaRawDF$year=="2002" & epaRawDF$fips=="24510"& epaRawDF$type=="ON-ROAD", "Emissions"], na.rm = TRUE)        
        y2005MeanEmOnRoad <- mean(epaRawDF[epaRawDF$year=="2005" & epaRawDF$fips=="24510"& epaRawDF$type=="ON-ROAD", "Emissions"], na.rm = TRUE)
        y2008MeanEmOnRoad <- mean(epaRawDF[epaRawDF$year=="2008" & epaRawDF$fips=="24510"& epaRawDF$type=="ON-ROAD", "Emissions"], na.rm = TRUE)
        
## Calcualte mean emissions from type "NON-ROAD" for each of the 1999, 2002, 2005, and 2008 years      
        y1999MeanEmNonRoad <- mean(epaRawDF[epaRawDF$year=="1999" & epaRawDF$fips=="24510"& epaRawDF$type=="NON-ROAD", "Emissions"], na.rm = TRUE)
        y2002MeanEmNonRoad <- mean(epaRawDF[epaRawDF$year=="2002" & epaRawDF$fips=="24510"& epaRawDF$type=="NON-ROAD", "Emissions"], na.rm = TRUE)        
        y2005MeanEmNonRoad <- mean(epaRawDF[epaRawDF$year=="2005" & epaRawDF$fips=="24510"& epaRawDF$type=="NON-ROAD", "Emissions"], na.rm = TRUE)
        y2008MeanEmNonRoad <- mean(epaRawDF[epaRawDF$year=="2008" & epaRawDF$fips=="24510"& epaRawDF$type=="NON-ROAD", "Emissions"], na.rm = TRUE)
        
## Create a dataframe to help ggplot2 to plot efficiently

        myTypes <- c("POINT", "POINT","NON-POINT", "NON-POINT", "ON-ROAD", "ON-ROAD", "NON-ROAD", "NON-ROAD")
        myYears <- c(1999, 2008, 1999, 2008, 1999, 2008,1999, 2008)
        EmPoints <- c(y1999MeanEmPoint, y2008MeanEmPoint, 
                      y1999MeanEmNonPoint, y2008MeanEmNonPoint,
                      y1999MeanEmOnRoad, y2008MeanEmOnRoad,
                      y1999MeanEmNonRoad, y2008MeanEmNonRoad)      
        
        df1 <- data.frame(
                type=factor(myTypes),
                year= factor(myYears), levels=c(1999, 2008),
                Emissions = EmPoints
        )
        
        myGr <- ggplot(data = df1, aes(x=year, y=Emissions, group=type, shape=type, colour=type))+
                geom_line()+
                geom_point()+
                labs(title = "Comparison of emissions in Baltimore City by type from 1999 to 2008")
        
## create the plot file for plotting the results.         
        png(filename="plot3.png", width = 480, height = 480, units = "px")
        myGr
        dev.off()        
