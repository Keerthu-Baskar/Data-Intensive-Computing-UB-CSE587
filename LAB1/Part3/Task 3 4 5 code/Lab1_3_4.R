library("ggmap")
library("maptools")
library(ggplot2)
library(usmap)
#install.packages(gridExtra)
require(gridExtra)

final_data<-as.data.frame(read.csv(file.choose()))
heatmp_cp<-as.data.frame(read.csv(file.choose()))
twts_states <- tolower(final_data$states_col)
twts_table <- as.data.frame(table(twts_states, exclude=NA))
names(twts_table) <- c("state", "tweets")
us_map<-plot_usmap("state", data = twts_table, values = "tweets") +
  ggplot2::scale_fill_gradient("Twitter Level",low = "yellow", high = "red",na.value="yellow")+
  theme(legend.position = "bottom", plot.title = element_text(hjust=0.5, size=12, face="bold"))+
  ggtitle("Twitter Data")

#use heatmap_us.csv data

heatmp_cp$level<-as.integer(gsub("[^0-9\\.]", "", heatmp_cp$ACTIVITY.LEVEL))
twotable_co <- data.frame(state = tolower(heatmp_cp$STATENAME), data=heatmp_cp$level)
cdc_map<-plot_usmap("state", data = twotable_co, values = "data") +
  ggplot2::scale_fill_gradient("ILI Activity level",low = "yellow", high = "red",na.value="yellow")+
  theme(legend.position = "bottom", plot.title = element_text(hjust=0.5, size=12, face="bold"))+
  ggtitle("CDC MAP")
grid.arrange(us_map,cdc_map, ncol=2)