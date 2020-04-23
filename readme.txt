TRANSPARENCY, CLASS BIAS, AND REDISTRIBUTION: EVIDENCE FROM THE AMERICAN STATES

Data by Alexander Severson

This file describes the contents necessary to replicate the work in my article as well as the installation of particular STATA commands to execute the code. The primary data file is a STATA 13 file called transparency.dta and is the cleaned form of my data for replication purposes. There is a secondary data file, ggplot.dta, which is a reduced and cleaned form of the primary data file to be used in conjunction with the. R script to recreate Figure 1.  The software code is saved in two files: 

1. transparency_welfare.do, which is STATA code to estimate all the presented panel data models presented in the paper, create output tables, and to draw the marginal effect plot in the paper. 

2. series_graph.R, which uses the R command ggplot2 to generate the series graph in the paper. 

The dataset containing all generated variables from the executed .do file is a STATA 13 file saved as transparency_allvars.dta.

The codebook for the paper is the linked file, codebook.pdf. 

There are two non-native STATA packages which should be installed before executing the file transparency_welfare.do. 

1. cpigen, which is a STATA package available through SSC which adds US Consumer Price Index series to the dataset in memory, using year (and optionally month or quarter) variables. One can install the cpigen package with the command: 

ssc install cpigen

2. clustergen, which is a STATA package which generates summary or grouping variables from a hierarchical cluster analysis. clustergen is a Stata .ado file used to calculate within- and between-cluster operationalizations of a level-1 variable in clustered data (namely, panel,  time-series cross-sectional, and multilevel data). The virtue of this program is that it creates these transformations for all variables by issuing a single command, as opposed to doing separate transformations the long way for each variable.   The command is not available for download through SSC and should be installed through using the following STATA command: 

net from https://home.gwu.edu/~bartels/stata 

On the webpage, click on the blue link called clustergen. A new window will pop up. Simply click on the link on the right side of the page that says “click here to install.” This program assumes that your cluster identification variable is called “id.” If your cluster variable is called, e.g., “countryid,” simply issue the following command before using clustergen: gen id=countryid. 
For more information on the clustergen command, see: 

https://cpb-us-east-1-juc1ugur1qwqqqo4.stackpathdns.com/blogs.gwu.edu/dist/1/170/files/2016/10/online_appendix_cluster_confounding-oku125.pdf
