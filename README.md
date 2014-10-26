# General

The most interesting file if a project are:
- features_info.txt
- features.txt
- activity_labels.txt
- train/X_train.txt
- train/y_train.txt
- train/subject_train.txt
- test/X_test.txt
- test/y_test.txt
- test/subject_test.txt

features_info.txt explains a bit the relation that might exist between files.

# 561 vector

It appears that the number of lines in features.txt is 561:
```bash
wc -l features.txt
561
```

It appears also that train/X_train.txt and test/X_test.txt contains a count of measures which is a multiple of 561:
```bash
wc -w test/X_test.txt
1653267

wc -w train/X_train.txt
4124472
```
1653267 / 561 = 2947

4124472 / 561 = 7352

So we have an entire set of 10299 measures.

# activity ids and subjects dataset

The files:
- test/y_test.txt
- test/subject_test.txt

contains each 2947 lines
```bash
wc -l test/y_test.txt
2947

wc -l test/subject_test.txt
2947
```

As it is for the files:
- train/y_train.txt
- train/subject_train.txt

contains each 7352 lines
```bash
wc -l train/y_train.txt
7352

wc -l train/subject_train.txt
7352
```

All seems related and consistent according to cardinality.

# Put everything together

1. Load the features.txt file and keeps only desired features containing either "mean()" either "std()" (for standard deviation) as specified in features_info.txt
2. Load activities from test/y_test.txt and train/y_train.txt and transform the data so it contains only human readable data thanks to the content of activity_labels.txt (activity id => activity label)
3. Load data sets from test/X_test.txt and train/X_train.txt, group them by chunks of 561 features and then keeps only desired features (it happens that we desire 66 features, as far as I understand). Split the result so that each measure has its own column.
4. Load subjects from test/subject_test.txt and train/subject_train.txt, we don't have much to do here.
5. Create a data frame from all the data we have, subject, activity, featurs0, feature1, ...
6. Finally write a CSV on disk with the data frame. This is our tidy data.
