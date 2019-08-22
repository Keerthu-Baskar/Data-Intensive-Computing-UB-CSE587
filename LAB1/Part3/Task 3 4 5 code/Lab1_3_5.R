library("ggmap")
library("maptools")
library(ggplot2)
library(usmap)
#install.packages(gridExtra)
require(gridExtra)

#Fu Tweets Data,Heat Map_us.csv files
newdata1<-as.data.frame(read.csv(file.choose()))



fi<-subset(newdata1, grepl("\\bInfluenza\\b", text, ignore.case = TRUE))
fi2<-subset(newdata1, grepl("\\bcold\\b", text, ignore.case = TRUE))

finalcollectedtweets<-as.data.frame(unique(rbind(fi,fi2)))

twts_states_fil <- tolower(finalcollectedtweets$states_col)
twts_table_fil <- as.data.frame(table(twts_states_fil, exclude=NA))
names(twts_table_fil) <- c("state", "tweets_fil")

us_map_fil<-plot_usmap("state", data = twts_table_fil, values = "tweets_fil") +
  ggplot2::scale_fill_gradient("Twitter Level",low = "yellow", high = "red",na.value="yellow")+
  theme(legend.position = "bottom", plot.title = element_text(hjust=0.5, size=12, face="bold"))+
  ggtitle("Twitter Data WITH FEWER KEY WORDS")

us_map_fil
heatmp_cd_fil<-as.data.frame(read.csv(file.choose()))
fi_cd_1<-subset(heatmp_cd_fil, grepl("\\bInfluenza\\b", WEBSITE, ignore.case = TRUE))
fi2_cd_2<-subset(heatmp_cd_fil, grepl("\\bcold\\b", WEBSITE, ignore.case = TRUE))
finalcollectedtweets_cdc<-as.data.frame(unique(rbind(fi_cd_1,fi2_cd_2)))
finalcollectedtweets_cdc$level<-as.integer(gsub("[^0-9\\.]", "", finalcollectedtweets_cdc$ACTIVITY.LEVEL))
twotable_fil <- data.frame(state = tolower(finalcollectedtweets_cdc$STATENAME), data=finalcollectedtweets_cdc$level)
cdc_map_fi<-plot_usmap("state", data = twotable_fil, values = "data") +
  ggplot2::scale_fill_gradient("ILI Activity level",low = "yellow", high = "red",na.value="yellow")+
  theme(legend.position = "bottom", plot.title = element_text(hjust=0.5, size=12, face="bold"))+
  ggtitle("CDC MAP WITH FEWER KEY WORDS")
grid.arrange(us_map_fil,cdc_map_fi, ncol=2)