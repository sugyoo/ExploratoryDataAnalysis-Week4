#install.packages("ggplot2")
#library(ggplot2)

NEI<-readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


maryland<-NEI[(NEI$fips =="24510"),]
maryland<-maryland[(maryland$type =="ON-ROAD"),]
marylandByYear<-aggregate(Emissions~year+type, maryland,sum)
marylandByYear$zip="BALTIMORE"

ny<-NEI[(NEI$fips =="06037"),]
ny<-ny[(ny$type =="ON-ROAD"),]
ny<-aggregate(Emissions~year+type, ny,sum)
ny$zip="Newyork"

#marylandByYear
#ny
#comp <- rbind(marylandByYear,ny)
comp <- as.data.frame(rbind(marylandByYear, ny))
#comp
png("plot6.png", width=640, height=480)

#gg6<-ggplot(data=comp, aes(x=comp$year, y=comp$Emissions)) + geom_bar(aes(fill=year)) + guides(fill=F) + 
#  ggtitle('Total Emissions of Motor Vehicle Sources\nLos Angeles County, California vs. Baltimore City, Maryland') + 
#  ylab(expression('PM'[2.5])) + xlab('Year') + theme(legend.position='none') + facet_grid(. ~ comp$zip) + 
#  geom_text(aes(label=round(Emissions,0), size=1, hjust=0.5, vjust=-1))

gg6<-ggplot(comp, aes(x=factor(year), y=Emissions, fill=zip,label = round(Emissions,2))) +
    geom_bar(stat="identity", width = .8) +  
    facet_grid(zip~., scales="free") +
  xlab("Year") +
  ylab("Total PM2.5 Emission in tons") +
    ggtitle(expression("Motor vehicle emission variation in Baltimore and Los Angeles in tons"))
    #+ geom_label(aes(fill = zip),colour = "white", fontface = "bold")
  
  
  
print(gg6)
dev.off()


gg6<-ggplot(comp, aes(comp$year, comp$Emissions, fill=year))+ 
  geom_bar(stat= "identity")+ #, width = .2) + 
  xlab("Year") +
  ylab("Total PM2.5 Emission in tons") +
  ggtitle("Coal combustion-related sources")
