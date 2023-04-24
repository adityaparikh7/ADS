# Importing required packages
library(tm)       # For text mining
library(wordcloud) # For creating word clouds
library(RColorBrewer) # For generating color palettes

# Importing data
text <- readLines("C:/Users/Aditya/Desktop/Somaiya Stuff/SY/SEM 4/ADS/EXPS/EXP 7/f1.txt")

# Reading file attributes
file_attrs <- file.info("C:/Users/Aditya/Desktop/Somaiya Stuff/SY/SEM 4/ADS/EXPS/EXP 7/f1.txt")
file_size <- file_attrs$size

# Reading number of lines and words
num_lines <- length(text)
num_words <- sum(sapply(text, function(x) length(strsplit(x, " ")[[1]])))

# Displaying file attributes 
cat(sprintf("File size: %d bytes\n", file_size))
cat(sprintf("Number of lines: %d\n", num_lines)) 
cat(sprintf("Number of words: %d\n", num_words))

# Creating corpus and cleaning it
corpus <- Corpus(VectorSource(text))
print(corpus)
corpus <- tm_map(corpus, content_transformer(tolower))
corpus <- tm_map(corpus, stripWhitespace)
corpus <- tm_map(corpus, removeWords, stopwords("english"))
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, removeNumbers)

# Creating term-document matrix and finding frequent terms
tdm <- TermDocumentMatrix(corpus)
freq_terms <- findFreqTerms(tdm, lowfreq = 10)
print(freq_terms)

# Finding associations between terms
assoc_terms <- findAssocs(tdm, terms = freq_terms, corlimit = 0.5)
print(assoc_terms)


# # Creating word cloud
# set.seed(1234)
# wordcloud(names(freq_terms), freq_terms, min.freq = 10,
#           scale = c(3, 0.5), colors = brewer.pal(8, "Dark2"))

# Creating word cloud
set.seed(1234)
wordcloud(words = freq_terms, min.freq = 2,
          scale = c(3, 0.5), colors = brewer.pal(8, "Dark2"))


# # Importing Packages
# library("stringr")
# library("tm")
# library("SnowballC")
# library("RColorBrewer")
# library(wordcloud)

# # Import file
# ds <- readLines("C:/Users/andro/OneDrive/Desktop/Somaiya Stuff/SY/SEM 4/ADS/EXPS/EXP 7/f1.txt") ds
# # File attributes
# file.info("C:/Users/andro/OneDrive/Desktop/Somaiya Stuff/SY/SEM 4/ADS/EXPS/EXP 7/f1.txt") 
# file_attributes <- file.info("C:/Users/andro/OneDrive/Desktop/Somaiya Stuff/SY/SEM 4/ADS/EXPS/EXP 7/f1.txt")
# file_attributes$size


# # Count number of lines 
# countLines <- file("C:/Users/andro/OneDrive/Desktop/Somaiya Stuff/SY/SEM 4/ADS/EXPS/EXP 7/f1.txt")
# length(readLines(countLines))
# # Count number of words 
# ds_str = toString(readLines("C:/Users/andro/OneDrive/Desktop/Somaiya Stuff/SY/SEM 4/ADS/EXPS/EXP 7/f1.txt"))
# str_count(ds_str, '\\W+')


# # Creating corpus 
# text <- readLines("C:/Users/andro/OneDrive/Desktop/Somaiya Stuff/SY/SEM 4/ADS/EXPS/EXP 7/f1.txt") 
# docs <- Corpus(VectorSource(text)) 
# inspect(docs)

# # Cleaning Corpus
# # Convert text to lower case 
# docs <- tm_map(docs,content_transformer(tolower))
# # Remove numbers 
# docs <- tm_map(docs, removeNumbers) 
# #Remove english common stopwords 
# docs <- tm_map(docs, removeWords, stopwords("english"))
# # Remove punctuation 
# docs <- tm_map(docs, removePunctuation)
# # Eliminate extra white spaces 
# docs <- tm_map(docs, stripWhitespace)
# ### Creating Term Document Matrix 
# dtm <- TermDocumentMatrix(docs) 
# m <- as.matrix(dtm) 
# v <- sort(rowSums(m), decreasing=TRUE) 
# d <- data.frame(word = names(v), freq=v) head(d)


# # Creating Word Cloud
# set.seed(26)
# wordcloud(words = d$word, freq = d$freq, min.freq = 1,
# max.words=200, random.order=FALSE, rot.per=0.35,