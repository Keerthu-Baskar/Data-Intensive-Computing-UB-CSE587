library(ggplot2)
library(reshape2)
#select clinical_ny_data.csv
clinicalny<-read.csv(file.choose(),sep=",")[,0:10]
weekdatany<-paste0(clinicalny$YEAR,clinicalny$WEEK)
forbargNY<-data.frame(weekdatany,clinicalny$TOTAL.A,clinicalny$TOTAL.B)
melting_data_forbargNY<-melt(forbargNY,id.vars="weekdatany")
#View(melting_data_forbargNY)
col152NY<-data.frame(weekdatany,clinicalny$PERCENT.POSITIVE)
col1_meltNY<-melt(col152NY,id.vars="weekdatany")
col252NY<-data.frame(weekdatany,clinicalny$PERCENT.A)
col2_meltNY<-melt(col252NY,id.vars="weekdatany")
col352NY<-data.frame(weekdatany,clinicalny$PERCENT.B)
col3_meltNY<-melt(col352NY,id.vars="weekdatany")

ggplot()+
  geom_bar(data=melting_data_forbargNY, aes(x=factor(weekdatany), y=value, fill=variable), stat="identity")+
  theme(axis.text.x = element_text(angle=65,vjust=.5),legend.title = element_blank(), plot.title = element_text(hjust=0.5))+
  scale_fill_manual(values=c("yellow2","forestgreen"), labels=c(" A", " B"))+
  xlab("Week")+ ylab("Number of positive Specimens")+
  ggtitle("Influenza Positive Tests Reported to CDC by U.S. Clinical Laboratories,\n National Summary, New York data")+
  
  
  geom_line(data=col1_meltNY,aes(x=factor(weekdatany),y=value*35*12, colour=variable), group=1)+
  geom_line(data=col2_meltNY,aes(x=factor(weekdatany),y=value*35*12, colour=variable), group=1)+
  geom_line(data=col3_meltNY,aes(x=factor(weekdatany),y=value*35*12, colour=variable), group=1)+
  scale_y_continuous(sec.axis = sec_axis(~./5, name="Percent positive"))+
  scale_colour_manual(values=c("red2","blue","forestgreen"),labels=c(" % Positive"," % Positive Flu A", " % Positive Flu B"))



