# Load the data
rct_data <- read_csv("https://raw.githubusercontent.com/datascibc/Data-Science-for-Docs/master/data/breast-rct-clean-fakeage.csv")


# Look at some plots to get an idea of the variables' distributions
qplot(rct_data$age, binwidth=8)
qplot(rct_data$id, geom="bar")
qplot(rct_data$ps12, geom="bar")
qplot(rct_data$binary_satisfaction, geom="bar")


# Calculate the 'centres' of the data
mean(rct_data$ps12, na.rm=TRUE)
median(rct_data$ps12, na.rm=TRUE)


# Calculate measures of 'spread'
IQR(rct_data$age, na.rm=TRUE)
sd(rct_data$age, na.rm=TRUE)


# Calculate lots of summary stats all at once
summary(rct_data)


# Histograms for fake age in each treatment arm
p <- ggplot(rct_data, aes(x=fake_age, group=random, fill=random))
p <- p + geom_histogram(position="identity", alpha=0.5, binwidth=6)
p <- p + theme_bw()
p


# T test comparing fake age in each treatment arm
t.test(rct_data$fake_age~rct_data$random)


# Contingency table for binary satisfaction in each treatment arm
tbl = table(rct_data$random, rct_data$binary_satisfaction)
tbl


# Chi squared test for independence of binary satisfaction and treatment arm
chisq.test(tbl)
