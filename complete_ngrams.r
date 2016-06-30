library(data.table)
dataDir<-"C:/Users/abm/Documents/Coursera-SwiftKey/final/en_US"

complete.dt1gram<-data.table()
complete.dt2gram<-data.table()
complete.dt3gram<-data.table()
complete.dt4gram<-data.table()

# combine the ngram tables from the 3 sources
dtngram <- read.table(paste(dataDir,"complete.dt1gram.txt",sep="/"),stringsAsFactors=FALSE)
complete.dt1gram <- rbindlist(list(complete.dt1gram,dtngram),use.names = TRUE,fill=FALSE)

dtngram <- read.table(paste(dataDir,"complete.dt2gram.txt",sep="/"),stringsAsFactors=FALSE)
complete.dt2gram <- rbindlist(list(complete.dt2gram,dtngram),use.names = TRUE,fill=FALSE)

dtngram <- read.table(paste(dataDir,"complete.dt3gram.txt",sep="/"),stringsAsFactors=FALSE)
complete.dt3gram <- rbindlist(list(complete.dt3gram,dtngram),use.names = TRUE,fill=FALSE)

dtngram <- read.table(paste(dataDir,"complete.dt4gram.txt",sep="/"),stringsAsFactors=FALSE)
complete.dt4gram <- rbindlist(list(complete.dt4gram,dtngram),use.names = TRUE,fill=FALSE)

setkey(complete.dt1gram, ngram)
setkey(complete.dt2gram, ngram)
setkey(complete.dt3gram, ngram)
setkey(complete.dt4gram, ngram)

rm(dtngram)