NEI<-readRDS("summarySCC_PM25.rds")

maryland<-NEI[(NEI$fips =="24510"),]
marylandByYear<-aggregate(Emissions~year, maryland,sum)
png("plot2.png", width=640, height=480)
bp<-barplot(height=marylandByYear$Emissions/1000, names.arg=marylandByYear$year, 
            xlab = "Years", ylab = "Total PM2.5 Emissions in tone", main="Total PM2.5 Emission in Baltimore")

print(bp)
dev.off()
