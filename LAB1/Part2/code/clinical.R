library(ggplot2)
library(reshape2)
#select clinical_data..csv 4 times
clinical<-read.csv(file.choose(),sep=",")[,0:3]
col1<-read.csv(file.choose(),sep=",")[,c(1,4)]
col2<-read.csv(file.choose(),sep=",")[,c(1,5)]
col3<-read.csv(file.choose(),sep=",")[,c(1,7)]
melting_clinical<-melt(clinical,id.vars="Week")
col1_melt<-melt(col1,id.vars="Week")
col2_melt<-melt(col2,id.vars="Week")
col3_melt<-melt(col3,id.vars="Week")
#View(melting_clinical)
#View(melting_clinical_line)

plottingClinical<-ggplot(data=melting_clinical)+
  geom_col(data=melting_clinical,aes(x=factor(Week),y=value,fill=variable))+
  theme(axis.text.x = element_text(angle=65,vjust=.5),legend.title = element_blank(), plot.title = element_text(hjust=0.5))+
  scale_fill_manual(values=c("yellow2","forestgreen"), labels=c(" A", " B"))+
  xlab("Week")+ ylab("Number of positive Specimens")+
  ggtitle("Influenza Positive Tests Reported to CDC by U.S. Clinical Laboratories,\n National Summary, 2018-2019 Season")+

  geom_line(data=col1_melt,aes(x=factor(Week),y=value*35*12, colour=variable), group=1)+
  geom_line(data=col2_melt,aes(x=factor(Week),y=value*35*12, colour=variable), group=1)+
  geom_line(data=col3_melt,aes(x=factor(Week),y=value*35*12, colour=variable), group=1)+
  scale_y_continuous(sec.axis = sec_axis(~./5, name="Percent positive"))+
  scale_colour_manual(values=c("forestgreen","blue","red2"), labels=c(" % Positive"," % Positive Flu A", " % Positive Flu B"))
  
 
plottingClinical

