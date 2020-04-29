library(ggplot2)
## Read data sources in to R Dataframes
        epaRawDF <- readRDS("summarySCC_PM25.rds")
##        sourceClassCode <- readRDS("Source_Classification_Code.rds") 
        
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
        # ResultsDF <- data.frame(
        #         year = c(1999, 2003, 2005, 2008),
        #         PointEmission = c(y1999MeanEmPoint, y2002MeanEmPoint, y2005MeanEmPoint, y2008MeanEmPoint),
        #         NonPointEmission = c(y1999MeanEmNonPoint, y2002MeanEmNonPoint, y2005MeanEmNonPoint, y2008MeanEmNonPoint),
        #         OnRoadEmission = c(y1999MeanEmOnRoad, y2002MeanEmOnRoad, y2005MeanEmOnRoad, y2008MeanEmOnRoad),
        #         NonRoadEmission = c(y1999MeanEmNonRoad, y2002MeanEmNonRoad, y2005MeanEmNonRoad, y2008MeanEmNonRoad)
        # )
        # y1999Mean <- c(y1999MeanEmPoint, y1999MeanEmNonPoint,y1999MeanEmOnRoad, y1999MeanEmNonRoad)
        # y2008Mean <- c(y2008MeanEmPoint, y2008MeanEmNonPoint,y2008MeanEmOnRoad, y2008MeanEmNonRoad)
        # d0 <- data.frame(type=c("POINT","NONPOINT", "ON-ROAD", "NON-ROAD", "POINT","NONPOINT", "ON-ROAD", "NON-ROAD"), 
        #                  year=c(1,1,1,1,2,2,2,2),
        #                  mean=c(y1999Mean,y2008Mean) )
        # ResultsDF2 <- data.frame(
        #         year = c(1999, 2008),
        #         PointEmission = c(y1999MeanEmPoint, y2008MeanEmPoint),
        #         NonPointEmission = c(y1999MeanEmNonPoint, y2008MeanEmNonPoint),
        #         OnRoadEmission = c(y1999MeanEmOnRoad, y2008MeanEmOnRoad),
        #         NonRoadEmission = c(y1999MeanEmNonRoad, y2008MeanEmNonRoad)
        # )

        
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
        
        myGr <- ggplot(data = df1, aes(x=year, y=Emissions, group=type, shape=type, colour=type))+geom_line()+geom_point()
        myGr
        
        
        tList <- c("PointEmission", "NonPointEmission", "OnRoadEmission", "NonRoadEmission")
        qplot(year, mean, data=d0, col=type)  ## works ok but has issues with x scale
        segments(1, y1999MeanEmNonPoint, 2, y2008MeanEmNonPoint ) ## works for base plot
        g <- ggplot(ResultsDF2, aes(year,PointEmission, NonPointEmission, OnRoadEmission, NonRoadEmission, colour=factor(tList)))
        g+ geom_line(data=ResultsDF2, aes(year, PointEmission), color="steelblue")+ 
                geom_point(data=ResultsDF2, aes(year, PointEmission))+
                geom_line(data=ResultsDF2, aes(year, NonPointEmission), color="red")+ 
                geom_point(data=ResultsDF2, aes(year, NonPointEmission))+
                geom_line(data=ResultsDF2, aes(year, OnRoadEmission), color="green")+ 
                geom_point(data=ResultsDF2, aes(year, OnRoadEmission))+
                geom_line(data=ResultsDF2, aes(year, NonRoadEmission), color="pink")+ 
                geom_point(data=ResultsDF2, aes(year, NonRoadEmission))+
                labs(title = "Comparison of emissions in Baltimore")+
                labs(y="Emissions in tons")
        ## + labs(shape="abc")
                ##theme(legend.position = "right")
                ##theme(legend.text =c("POINT", "NON-POINT", "ON-ROAD", "NON-ROAD"))
        
    
        
        
        
## NON-ROAD NONPOINT  ON-ROAD    POINT         