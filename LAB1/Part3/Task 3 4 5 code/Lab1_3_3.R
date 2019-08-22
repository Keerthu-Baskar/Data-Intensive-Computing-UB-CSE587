library("ggmap")
library("maptools")
library(ggplot2)
library(usmap)


final_data<-as.data.frame(read.csv(file.choose()))

twts_states <- tolower(final_data$states_col)
twts_table <- as.data.frame(table(twts_states, exclude=NA))
names(twts_table) <- c("state", "tweets")
us_map<-plot_usmap("state", data = twts_table, values = "tweets") +
  ggplot2::scale_fill_gradient("Twitter Level",low = "yellow", high = "red",na.value="yellow")+
  theme(legend.position = "bottom", plot.title = element_text(hjust=0.5, size=12, face="bold"))+
  ggtitle("Twitter Data")

us_map
