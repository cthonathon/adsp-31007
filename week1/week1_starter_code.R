#Read in ACS table DP02
dp03raw <- read.csv('./rawdata/ACSDP5Y2022.DP03-Data.csv')

#We expect numeric data but the summary shows otherwise
#Notice that the first row is actually a set of variable labels
dim(dp03raw)
summary(dp03raw)
dp03raw[1:5,1:5]

#Drop the first row, focus on the columns we want
dp03clean <- dp03raw[-1,c('NAME','DP03_0051E','DP03_0062E',
  'DP03_0095E','DP03_0096PE')]
#Typecast all columns but the first to numeric
dp03clean[-1] <- lapply(dp03clean[-1],as.numeric)
#Rename columns
names(dp03clean) <- c('tract','hhs','medhhinc','civpop','prophealth')
#Convert percentage to decimal
dp03clean['prophealth'] <- dp03clean['prophealth']/100

#Check our work and save to cleandata
dim(dp03clean)
summary(dp03clean)
head(dp03clean)
write.csv(dp03clean,'./cleandata/dp03.csv')
