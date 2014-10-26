### FEATURES
# Features are invariants for the tests

features <- read.table("UCI HAR Dataset/features.txt")

# We are going to get only features containing mean/std words
f_index <- grep("mean\\(\\)|std\\(\\)", features$V2)
# Get indexes
indexes <- 1:length(features$V2)
indexes_filter <- sapply(indexes, (function(index) index %in% f_index))
desired_features <- features[features_index,]

### ACTIVITIES
# Load activity id for test and train datasets
labels_set <- c(scan("UCI HAR Dataset/test/y_test.txt"), scan("UCI HAR Dataset/train/y_train.txt"))
# Load labels
activities <- read.table("UCI HAR Dataset/activity_labels.txt")
# Replace activity ids by activity labels
Activity <- sapply(labels_set, (function(id) activities$V2[id]))

### DATA
# Concatenate test and train sets
data_set <- c(scan("UCI HAR Dataset/test/X_test.txt"), scan("UCI HAR Dataset/train/X_train.txt"))
# Extract usefull data from sets, only the features we desire, each column correspondong to one feature
mean_std <- split(data_set[rep(indexes_filter, length(data_set) / length(indexes))], 1:length(features_index))

# Concatenate subjects from test and train
Subject <- c(scan("UCI HAR Dataset/test/subject_test.txt"), scan("UCI HAR Dataset/train/subject_train.txt"))

### Build a data frame in order to generate a tidy csv
tidy_data <- data.frame(Subject, Activity, mean_std)
colnames(tidy_data) <- c("Subject", "Activity", sapply(desired_features$V2, (function(id) toString(id))))

### Write it to file
write.csv(tidy_data, file = "tidy.csv")

tidy_data