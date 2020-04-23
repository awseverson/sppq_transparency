##Reproduces Figure 1 in SPPQ Article##

#Clear

rm(list=ls())
dev.off()
options(scipen=999)

library(readstata13)
library(foreign)
library(ggplot2)
library(reshape2)
library(ggthemes)
library(gridExtra)

#Set WD and Subset Data from STATA
cat("\014")

d <- read.dta13("ggplot.dta")
df1 <- subset(d, d$year>=1978, select = c(welfpc, tran, med,  bias, div, year, id))

#Plot Mean + CIS of Variables Over Time

trans = melt(df1, measure.vars = c("tran"), id="year" )
head(trans)
p1 = ggplot(trans,aes(x=year,y=value)) + stat_summary(fun.data ="mean_cl_boot", geom = "smooth")+ggtitle("Transparency Index, 1978-2000")+theme_economist()+scale_colour_economist() + labs(x = "Year") + labs(y="Transparency Score")

welfare = melt(df1, measure.vars = c("welfpc"), id="year" )
head(welfare)
p2 = ggplot(welfare,aes(x=year,y=value)) + stat_summary(fun.data ="mean_cl_boot", mult=1, geom = "smooth")+ggtitle("Welfare Expenditures, 1978-2000")+theme_economist()+scale_colour_economist() + labs(x="Year") + labs(y="Welfare Expenditures/Capita")

media = melt(df1, measure.vars = c("med"), id="year" )
head(media)
p3 = ggplot(media,aes(x=year,y=value)) + stat_summary(fun.data ="mean_cl_boot", mult=1, geom = "smooth")+ggtitle("Media Market Penetration, 1978-2000")+theme_economist()+scale_colour_economist() + labs(x="Year") + labs(y="Media Market Penetration")

bias = melt(df1, measure.vars = c("bias"), id="year" )
head(bias)
p4 = ggplot(bias,aes(x=year,y=value)) + stat_summary(fun.data ="mean_cl_boot", mult=1, geom = "smooth")+ggtitle("Class Bias in Turnout, 1978-2000")+theme_economist()+scale_colour_economist() + labs(x="Year") + labs(y="Class Bias in Voter Turnout")

grid.arrange(p2, p1, p3, p4, ncol=2)

