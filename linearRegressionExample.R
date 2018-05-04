library(readxl)

temp.allTeams <- read_excel("condensedAuctionData.xls", sheet = "All Teams")
temp.potSize <- read_excel("condensedAuctionData.xls", sheet = "Pot Size")

temp.fullData <- merge(temp.allTeams, temp.potSize, by="Year")

colnames(temp.fullData)[6] <- "PICK_NO"
colnames(temp.fullData)[7] <- "COST_PCT_OF_POT"
colnames(temp.fullData)[9] <- "WIN_PCT"
colnames(temp.fullData)[10] <- "RETURN_DOL"
colnames(temp.fullData)[11] <- "NET_DOL"
colnames(temp.fullData)[12] <- "NET_PCT"
colnames(temp.fullData)[13] <- "NET_PCT_OF_POT"
colnames(temp.fullData)[14] <- "YEAR"


curYear <- as.numeric(format(as.Date(Sys.Date(), format="%Y/%m/%d"),"%Y"))
curYear

train <- temp.fullData[temp.fullData$YEAR > curYear-10 & temp.fullData$YEAR <=curYear-2,]
test <- temp.fullData[temp.fullData$YEAR > curYear-2,]
# 
# set.seed(1)
# row.numbers <- sample(1:nrow(temp.fullData), 0.80*nrow(temp.fullDate))
# train <- temp.fullData[row.numbers,]
# test <- temp.fullData[-row.numbers,]

train
test