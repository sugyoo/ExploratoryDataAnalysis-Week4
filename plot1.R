NEI<-readRDS("summarySCC_PM25.rds")

total<-aggregate(Emissions~year, NEI, sum)
png("plot1.png", width=640, height=480)
gg<-barplot(height=total$Emissions/1000, names.arg=total$year, 
            xlab = "Years", ylab = "Total PM2.5 Emissions in tone", main="Total PM2.5")

      head(NEI)     
      head(total)
print(gg)
dev.off()
