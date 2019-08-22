library(ggplot2)
library(reshape2)
#select the public_data_52weeks.csv
po<-read.csv(file.choose())
weeknew<-paste0(po$YEAR,po$WEEK)
#View(weeknew)
df<-data.frame(weeknew,po$H3N2v,po$A..2009.H1N1.,po$A..H3.,po$A..Subtyping.not.Performed.,po$B,po$BVic,po$BYam)

melting_data_new<-melt(df,id.vars="weeknew")
#View(melting_data_new)

ggplot(data=melting_data_new, aes(x=weeknew, y=value, fill=variable))+
  geom_bar(stat="identity")+
  theme(axis.text.x = element_text(angle=65,vjust=0.1), legend.title = element_blank(), plot.title = element_text(hjust=0.5))+ 
  xlab("Week")+ ylab("Number of positive Specimens")+
  scale_fill_manual(values=c("yellow","orange2","red1","darkorchid4","darkgreen","olivedrab1","forestgreen"),labels=c(" H3N2v", " A (H1N1)pdm09", " A (H3N2)", " A (Subtyping not performed)"," B (lineage not performed)"," B (Victoria Lineage)"," B(Yamagata Lineage)"))+
  ggtitle("Influenza Positive Tests Reported to CDC by U.S. Public Health Laboratories,\n National Summary, 2018 entire year")


