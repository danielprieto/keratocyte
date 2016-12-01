#Analysis of keratocyte migration
# script author: Daniel Prieto (dprieto@fcien.edu.uy)
# date 2016-02-15
###############################################
### read data from csv files in data directory
###############################################

a <- read.csv("./data/mig_glass.xls" , header = T, sep = "\t")# loads data from dataset a
a.dist <- abs(a[1:7, 3])# keeps only distance data
b <- read.csv("./data/mig_collagen.xls" , header = T, sep = "\t")# loads data from dataset b
b.dist <- abs(b[1:7, 3])# keeps only distance data
c <- read.csv("./data/mig_polyl.xls" , header = T, sep = "\t")# loads data from dataset c
c.dist <- abs(c[1:7, 3])# keeps only distance data

###############################################
### merge data into a data frame
###############################################

migdata <- cbind(glass = a.dist, collagen = b.dist, polyl = c.dist)

###############################################
### gets data summary
###############################################

stats1 <- as.table(summary(migdata))

###############################################
### exports summary stats to file stats_migdata.txt in current directory
###############################################

write.table(stats1, file = "./data/stats_migdata.txt", quote = F)

###############################################
### make the boxplots
###############################################

par(mar=c(5,6,4,2))# just fixing margins for labels
pdf(file = "./data/distance.pdf", useDingbats=F) # writes plot to distance.pdf
boxplot(migdata, horizontal = T, xlab = expression(paste("migrated distance (", mu, "m)" )),  border = T, las = 1)# makes the boxplot
dev.off()# closes de pdf device

###############################################
### now analyze velocity data
###############################################

v1 <- read.csv("./data/vel_glass.xls", header = T, sep = "\t")# loads data from dataset 1
v1 <- v1[1:7, 3]# keeps only velocity data
v2 <- read.csv("./data/vel_collagen.xls", header = T, sep = "\t")# loads data from dataset 2
v2 <- v2[1:7, 3]# keeps only velocity data
v3 <- read.csv("./data/vel_polyl.xls", header = T, sep = "\t")# loads data from dataset 3
v3 <- v3[1:7, 3]# keeps only velocity data
#
veldata <- cbind(glass = v1, collagen = v2, polyl = v3) # combining data into a single data frame
par(mar=c(5,6,4,2))# just fixing margins for labels
pdf(file = "./data/velocities.pdf", useDingbats=F) # writes plot to velocities.pdf
boxplot(veldata, horizontal = T, xlab = expression(paste("velocity (", mu, "m/sec)" )),  border = T, las = 1)# makes the plot
dev.off()# closes the pdf device

###############################################
### gets data summary
###############################################

stats1 <- as.table(summary(veldata))

###############################################
### exports summary stats to file stats_migdata.txt in current directory
###############################################

write.table(stats1, file = "./data/stats_veldata.txt", quote = F)
