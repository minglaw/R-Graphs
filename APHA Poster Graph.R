#always load ggplot2!!!
require(ggplot2)

#setting up a summarized data.frame
Rank <- c(seq(1,7,1))
Category <- c("Snacks","Beverages","Tobacco","Grocery","Deli","Dairy","Produce")
Percent <- c(.39,.28,.12,.11,.061,.03,.012)
Value <- c("39%","28%","12%","11%","6.1%","3.0%","1.2%")
data <- data.frame(Rank,Category,Percent,Value)
data$Category <- factor(data$Category)

#starting ggplotting
c <- ggplot(data,aes(x=factor(Category),y=Percent),fill=Category)
c + geom_bar(stat="identity") + labs(title="Average Sales by Product Category \nFeb 2013 to Aug 2013 (5 Stores)",x="PRODUCT CATEGORY",y="% OF QUANTITY SOLD")+ theme_bw() + theme(axis.title.y = element_text(size = rel(1.5)),axis.title.x=element_text(size=rel(1.5)),plot.title = element_text(size=rel(1.5)),axis.text.x=element_text(size=rel(1.5)),axis.text.y=element_text(size=rel(1.5))) + stat_bin(geom="text", aes(label=Value, vjust=-.5)) + ylim(0,0.43)

#saving the ggplot - if no plot is specified it defaults to the last plot
ggsave(file="bargraph.png",scale=1,width=11.42,height=8.25,units="in")

