# ---
# title:  "Next Word Prediction Using N-Grams (Good-Turing Smoothing)"
# subtitle:   "Data Science Capstone Final Project Report"
# author: "Chandra Tara Lama"
# date:   "2016-05-29 00:00:00"
# ---

# sharedheader.R
#


# debug print functions
dmessage <- function(...) if (mydebug) message(...)
dprint <- function(...) if (mydebug) print(...)

tslist <- c("0.30", "1.00", "5.00")
tslist.selected <- "1.00"

mydebug <- FALSE
