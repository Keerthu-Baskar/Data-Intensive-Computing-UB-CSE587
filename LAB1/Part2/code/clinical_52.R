library(ggplot2)
library(reshape2)
#select clinical_52weeks.csv
clinical52<-read.csv(file.choose(),sep=",")[,0:10]
weekdata52<-paste0(clinical52$YEAR,clinical52$WEEK)
forbarg<-data.frame(weekdata52,clinical52$TOTAL.A,clinical52$TOTAL.B)
melting_data_forbarg<-melt(forbarg,id.vars="weekdata52")
#View(melting_data_forbarg)
col152<-data.frame(weekdata52,clinical52$PERCENT.POSITIVE)
col1_melt52<-melt(col152,id.vars="weekdata52")
col252<-data.frame(weekdata52,clinical52$PERCENT.A)
col2_melt52<-melt(col252,id.vars="weekdata52")
col352<-data.frame(weekdata52,clinical52$PERCENT.B)
col3_melt52<-melt(col352,id.vars="weekdata52")

ggplot()+
  geom_bar(data=melting_data_forbarg, aes(x=factor(weekdata52), y=value, fill=variable), stat="identity")+
  theme(axis.text.x = element_text(angle=65,vjust=.5),legend.title = element_blank(), plot.title = element_text(hjust=0.5))+
  scale_fill_manual(values=c("yellow2","forestgreen"), labels=c(" A", " B"))+
  xlab("Week")+ ylab("Number of positive Specimens")+
  ggtitle("Influenza Positive Tests Reported to CDC by U.S. Clinical Laboratories,\n National Summary, 2018 entire year")+
  
  
  geom_line(data=col1_melt52,aes(x=factor(weekdata52),y=value*35*12, colour=variable), group=1)+
  geom_line(data=col2_melt52,aes(x=factor(weekdata52),y=value*35*12, colour=variable), group=1)+
  geom_line(data=col3_melt52,aes(x=factor(weekdata52),y=value*35*12, colour=variable), group=1)+
  scale_y_continuous(sec.axis = sec_axis(~./5, name="Percent positive"))+
  scale_colour_manual(values=c("red2","blue","forestgreen"),labels=c(" % Positive"," % Positive Flu A", " % Positive Flu B"))



