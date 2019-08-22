library(ggplot2)
library(reshape2)
#select the Public_data.csv data
public<-read.csv(file.choose(),sep=",")[,0:8]
#public<-read.csv("D:/keer/CSE587/LAB1/FluViewPhase2Data/Public_data.csv",sep=",")[,0:8]
melting_data<-melt(public,id.vars="Week")

plottingG<-ggplot(data=melting_data)+
  geom_col(data=melting_data,aes(x=factor(Week),y=value,fill=variable))+
  theme(axis.text.x = element_text(angle=65,vjust=.5), legend.title = element_blank(), plot.title = element_text(hjust=0.5))+ 
  xlab("Week")+ ylab("Number of positive Specimens")+
  scale_fill_manual(values=c("yellow","orange2","red1","darkorchid4","darkgreen","olivedrab1","forestgreen"),labels=c(" A (Subtyping not performed)", " A (H1N1)pdm09", " A (H3N2)", " H3N2v"," B (lineage not performed)"," B (Victoria Lineage)"," B(Yamagata Lineage)"))+
  ggtitle("Influenza Positive Tests Reported to CDC by U.S. Public Health Laboratories,\n National Summary, 2018-2019 Season")
  
plottingG



