# Load the libraries 
library("vars")
library("urca")
library("pcalg")
library("forecast")
#install.packages("Rgraphviz")
# To install pcalg library you may first need to execute the following commands:
source("https://bioconductor.org/biocLite.R")
source("https://bioconductor.org/packages/3.4/bioc/bin/windows/contrib/3.3/graph_1.52.0.zip")
biocLite("graph")
biocLite("RBGL")
#source("https://bioconductor.org/biocLite.R")
#biocLite("Rgraphviz")

# Read the input data 
data <- read.csv("E:/BI/causality/causality/data.csv",header = TRUE)
data
summary(data)
#just to see the trend in data
# Build a VAR model
?VARselect
VARselect(data, lag.max = 10, type="const")
#IT HAS LOW sc so selecting it.
var_model <- VAR(data,type ="const",lag.max=10,ic="SC" )
# Select the lag order using the Schwarz Information Criterion with a maximum lag of 10
# see ?VARSelect to find the optimal number of lags and use it as input to VAR()
# Extract the residuals from the VAR model 
# see ?residuals
?residuals
var_model
residual <- resid(var_model)
residual
1# Check for stationarity using the Augmented Dickey-Fuller test 
# see ?ur.df
ndiffs(residual[,1])
ndiffs(residual[,2])
ndiffs(residual[,3])
#used ndiffs to find thelags, which i have inspired from kaggle.
?ur.df
station1 <- ur.df(residual[,1])
summary(station1)
station2 <- ur.df(residual[,2])
summary(station2)
station3 <- ur.df(residual[,3])
summary(station3)

##less p-values states that we reject the null hypotheses that they are series are not stationary.
##so residuals are stationary
# Check whether the variables follow a Gaussian distribution  
# see ?ks.test
?ks.test
gauss1 <- ks.test(residual[,1],"pnorm")
gauss1
gauss2 <- ks.test(residual[,2],"pnorm")
gauss2
guass3 <- ks.test(residual[,3],"pnorm")
guass3
##less p-values states that we reject ull hypotheses that they are guasian. SO, they are not normally distributed.
# Write the residuals to a csv file to build causal graphs using Tetrad software
residual_data <- data.frame(residual[,1],residual[,2],residual[,3])
x <- c("Move", "Rprice", "Mprice")
colnames(residual_data)<- x
head(residual_data)
residual_file <- "E:/BI/causality/causality/residual.csv"
#?write.csv
write.csv(residual_data,file=residual_file,row.names = FALSE,col.names = TRUE)
# OR Run the PC and LiNGAM algorithm in R as follows,
# see ?pc and ?LINGAM 
?LINGAM
# PC Algorithm
suffStat=list(C=cor(residual_data), n=nrow(residual_data))
fit <- pc(suffStat, indepTest=gaussCItest, alpha=0.1, labels=colnames(residual), skel.method="original")
fit
plot(fit, main="PC graph")
# LiNGAM Algorithm
lingam_fit <- lingam(residual)
show(lingam_fit)

