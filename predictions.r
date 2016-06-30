library(data.table)

trim<-function(x) gsub("^\\s+|\\s+$", "", x)

cleanText<-function(x){
  text.clean<-tolower(x)
  text.clean<-gsub("[^a-zA-Z]+"," ",text.clean)
  text.clean<-trim(text.clean)
} 

match<-function(search.word,ngrams,ngram.size) {  
  if (length(search.word)>=(ngram.size-1)) { 
    start.index<-length(search.word)-(ngram.size-2)
    end.index<-length(search.word)
    search.ngram<-paste(search.word[start.index:end.index],collapse = ' ')
    matches<-ngrams[ngram==search.gram,]
    matches<-matches[order(-count),] 
  } else {
    matches<-data.table()
  }
}

predict.next<-function(fragment) {
  predict.word<-""
  
  if (nchar(fragment)>0) {
    
    search.word<-strsplit(cleanText(fragment)," +")[[1]]
    
    matches<-find.matches(search.word,complete.dt4gram,4)
    
    if (nrow(matches) > 0) {
      predict.word<-matches[1,target]
    } else {
      matches<-find.matches(search.word,complete.dt3gram,3)  
      if (nrow(matches)>0) {
        predict.word<-matches[1,target]
      } else {
        matches<-find.matches(search.word,complete.dt2gram,2)      
        if (nrow(matches)>0) {
          predict.word<-matches[1,target]
        } else {
          predict.word<-complete.dt1gram[order(-count),][1,target] 
        }
      }
    }
  }
  predict.word
}