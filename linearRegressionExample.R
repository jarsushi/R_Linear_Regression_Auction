library(readxl)

temp.allTeams <- read_excel("condensedAuctionData.xls", sheet = "All Teams")
temp.potSize <- read_excel("condensedAuctionData.xls", sheet = "Pot Size")

temp.fullData <- merge(temp.allTeams, temp.potSize, by="Year")

colnames(temp.fullData)[1] <- "YEAR"
colnames(temp.fullData)[7] <- "PICK_NO"
colnames(temp.fullData)[8] <- "COST_PCT_OF_POT"
colnames(temp.fullData)[10] <- "WIN_PCT_OF_POT"
colnames(temp.fullData)[11] <- "RETURN_DOL"
colnames(temp.fullData)[12] <- "NET_DOL"
colnames(temp.fullData)[13] <- "NET_PCT"
colnames(temp.fullData)[14] <- "NET_PCT_OF_POT"
colnames(temp.fullData)[15] <- "TOTAL_POT_SIZE"


curYear <- as.numeric(format(as.Date(Sys.Date(), format="%Y/%m/%d"),"%Y"))
curYear

train <- subset(temp.fullData, temp.fullData$YEAR > curYear-10 & temp.fullData$YEAR <= curYear-2)
  temp.fullData[temp.fullData$YEAR > curYear-10 & temp.fullData$YEAR <=curYear-2,]
test <- temp.fullData[temp.fullData$YEAR > curYear-2,]

View(train)
View(test)

train.lm <- lm(NET_PCT ~ SEED, data=train)
summary(train.lm)

