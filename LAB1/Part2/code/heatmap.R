library("ggmap")
library("maptools")
library(ggplot2)
library("usmap")
#use heatmap_us.csv data
heatmp<-as.data.frame(read.csv(file.choose()))
heatmp$level<-as.integer(gsub("[^0-9\\.]", "", heatmp$ACTIVITY.LEVEL))
twotable <- data.frame(state = tolower(heatmp$STATENAME), data=heatmp$level)
#View(crimes)
plot_usmap("state", data = twotable, values = "data") +
  ggplot2::scale_fill_gradient("ILI Activity level",low = "yellow", high = "red",na.value="yellow")+
  theme(legend.position = "bottom", plot.title = element_text(hjust=0.5, size=12, face="bold"))+
  ggtitle("A weekly influenza surveillance report prepared by the influenza division \n influenza-like illness(ILI) Activity level indicator determined by data reported to ILINet \n 2018-2019 Influenza season week 8 ending Feb 23, 2019")


