library(reshape2)
library(ggplot2)
#select the weekly.csv data
pediatric<-read.csv(file.choose(),sep=",")[,c(2,3,5)]
#pediatric<-read.csv("D:/keer/CSE587/LAB1/pediatric/Weekly.csv",sep=",")[,c(2,3,5)]
#View(pediatric)
pediatric_melt<-melt(pediatric,id.vars="WEEK.NUMBER")
#View(pediatric_graph)

label_x <- c("2015-40", "2015-48", "2015-52", "2016-06", "2016-12","2016-18", "2016-24", "2016-30", "2016-36", "2016-42", "2016-48","2017-02", "2017-08","2017-14", "2017-20", "2017-28", "2017-32", "2017-38", "2017-44", "2017-50", "2018-04", "2018-10", "2018-18", "2018-22", "2018-28", "2018-34", "2018-40", "2018-48", "2018-52", "2019-06" )


pedatric_graph<-ggplot(data = pediatric_melt)+
  labs(x="Week of Death",y="No.of Deaths")+
  theme(axis.text.x = element_text(size=6, angle=90), legend.title = element_blank(), plot.title = element_text(hjust=0.5), legend.position = "bottom", legend.background = element_rect(linetype = "solid", size=0.2, color="black"))+
  geom_col(color="black", data = pediatric_melt,aes(x=factor(WEEK.NUMBER),y=value, fill=variable))+
  scale_x_discrete(breaks=c("2015-40", "2015-48", "2015-52", "2016-06", "2016-12","2016-18", "2016-24", "2016-30", "2016-36", "2016-42", "2016-48","2017-02", "2017-08","2017-14", "2017-20", "2017-28", "2017-32", "2017-38", "2017-44", "2017-50", "2018-04", "2018-10", "2018-18", "2018-22", "2018-28", "2018-34", "2018-40", "2018-48", "2018-52", "2019-06"  ), labels=c("2015-40", "2015-48", "2015-52", "2016-06", "2016-12","2016-18", "2016-24", "2016-30", "2016-36", "2016-42", "2016-48","2017-02", "2017-08","2017-14", "2017-20", "2017-28", "2017-32", "2017-38", "2017-44", "2017-50", "2018-04", "2018-10", "2018-18", "2018-22", "2018-28", "2018-34", "2018-40", "2018-48", "2018-52", "2019-06" ))+
scale_fill_manual(values=c("forestgreen","cyan"), labels=c(" Death reported previous week   ", " Death reported current week"))+
  ggtitle("Number of Influenza - Associated Pediatric Deaths by Week of Death: 2015-2016 season to present")


pedatric_graph + annotate(geom="text", x=25, y=21, label="2015-2016 \n number of deaths\n reported = 95",size=3,color="black")+ 
  annotate(geom="text", x=75, y=21, label="2016-2017 \n number of deaths\n reported = 110",size=3, color="black")+ 
  annotate(geom="text", x=125, y=21, label="2017-2018 \n number of deaths\n reported = 185",size=3, color="black")+
  annotate(geom="text", x=175, y=21, label="2018-2019 \n number of deaths\n reported = 64",size=3, color="black")+
  annotate(geom="text", x=150, y=23, label=".",size=1, color="black")



