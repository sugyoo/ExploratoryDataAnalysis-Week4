NEI<-readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SCC.sub <- SCC[grepl("Coal" , SCC$Short.Name), ]
NEI2 <- NEI[NEI$SCC %in% SCC.sub$SCC, ]
#NEI2

png("plot4.png", width=640, height=480)
#gg4 <- ggplot(NEI2, aes(x = factor(year), y = Emissions, color =type)) +
gg <- ggplot(NEI2, aes(x = factor(year), y = Emissions/1000, fill =type)) +
# geom_line() +
  geom_bar(stat= "identity")+ #, width = .2) + 
  xlab("Year") +
  ylab("Total PM2.5 Emission in tons") +
  ggtitle("Coal combustion-related sources")
print(gg)
dev.off()

