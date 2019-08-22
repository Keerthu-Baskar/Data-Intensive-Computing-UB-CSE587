
#select the mortality.csv data
my_data_mortality <-read.csv(file.choose())
my_data_mortality$Year.Week <- paste(my_data_mortality$Year,"(",my_data_mortality$Week,")")
my_data_mortality$Year.Week<-gsub(" ","",my_data_mortality$Year.Week)
#View(my_data_mortality$Year.Week)

x_axis_data <- as.character(my_data_mortality$Year.Week)
x_axis_data <- factor(x_axis_data, levels=unique(x_axis_data))
plot(factor(x_axis_data), my_data_mortality$Expected,main = "Pneumonia and Influenza Mortality from the 
National Center for Health Statistics Mortality Surveillance System\n Data through the week ending February 16,2019, as of February 28,2019" ,cex.main=1.2, xlim = c(263,480),ylim=c(4,12), 
     xlab="MMWR Week", ylab="% of All Deaths Due to P & I", cex.axis= 0.5)+
  
  scale_x_discrete(breaks=c("2014(40)", "2014(50)", "2015(10)", "2015(20)", "2015(30)", "2015(40)", "2015(50)", "2016(10)", 
                            "2016(20)", 
                            "2016(30)", "2016(40)", "2016(50)", "2017(10)", "2017(20)", "2017(30)", "2017(40)", "2017(50)", "2018(10)", "2018(20)", "2018(30)", "2018(40)", 
                            "2018(50)"), labels=c("40", "50", "10", "20", "30", "40",
                                                  "50", "10", "20", "3'", "40", "50", "10", "20",
                                                  "30", "40", "50", "10", "20", 
                                                  "30", "40", "50"))




lines(x_axis_data, my_data_mortality$Expected,col="black", lwd=2)
lines(x_axis_data, my_data_mortality$Threshold,col="black", lwd=2)
lines(x_axis_data, my_data_mortality$Percent.of.Deaths.Due.to.Pneumonia.and.Influenza, col="red", lwd=2)
#https://www.r-graph-gallery.com/119-add-a-legend-to-a-plot/
legend(270,12.5, 
       legend = c("Epidemic Threshold", "Seasonal Baseline"), 
       col = c(rgb(1,0,0), 
               rgb(0,0,0)), 
       lty=c(1,1),
       lwd=2,
       bty = "n",
       text.col = "black", 
       horiz = T , 
      inset = c(0.1, 0.1))