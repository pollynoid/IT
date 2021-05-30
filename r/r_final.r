# I saw that russian comments can not be seen on github, so this time i made english comments

library("psych")
library("dplyr")
library("ggplot2")
library("GGally")

# reading the database
d <- read.csv("r_final/r_final.csv")
glimpse(d) # we look at what is contained in this database

# visualize the distribution of variables
ggplot(data = d, aes(x = confrontative.coping)) + geom_bar()
ggplot(data = d, aes(x = planful.problem..solving)) + geom_bar()
ggplot(data = d, aes(x = intolerance.of.ambiguity)) + geom_bar()
ggplot(data = d, aes(x = tolerance.of.ambiguity)) + geom_bar()

# displaying descriptive statistics for the required columns
summary(d[, c("confrontative.coping", "planful.problem..solving", "intolerance.of.ambiguity", "tolerance.of.ambiguity")])
names <- c('confrontative.coping', 'planful.problem..solving', 'intolerance.of.ambiguity', 'tolerance.of.ambiguity') # сохраняем названия столбцов
# setting margins for the correct display of graphs
margins.default = par("mar") # write down the current value to restore it later
par(mar = c(5, 10, 4, 2)) # increasing the left field to 10 conditional units

# visualize some descriptive statistics

# Mean value
mean_vec <- as.numeric(c(mean(d$confrontative.coping), mean(d$planful.problem..solving), mean(d$intolerance.of.ambiguity), mean(d$tolerance.of.ambiguity)))
barplot(mean_vec, names.arg = names, main = "Mean", horiz=TRUE, las=1)

# Median
median_vec <- as.numeric(c(median(d$confrontative.coping), median(d$planful.problem..solving), median(d$intolerance.of.ambiguity), median(d$tolerance.of.ambiguity)))
barplot(median_vec, names.arg = names, main = "Median", horiz=TRUE, las=1)

# Mode
mymode <- function(x){names(which.max(table(x)))} # function for finding a mode
mode_vec <- as.numeric(c(mymode(d$confrontative.coping), mymode(d$planful.problem..solving), mymode(d$intolerance.of.ambiguity), mymode(d$tolerance.of.ambiguity)))
barplot(mode_vec, names.arg = names, main = "Mode", horiz=TRUE, las=1)

# Standard deviation
sd_vec <- as.numeric(c(sd(d$confrontative.coping), sd(d$planful.problem..solving), sd(d$intolerance.of.ambiguity), sd(d$tolerance.of.ambiguity)))
barplot(sd_vec, names.arg = names, main = "Standart deviation", horiz=TRUE, las=1)

par(mar = margins.default) # restoring the original margins

# counting the Spearman correlation
cor1 <- cor(d$confrontative.coping, d$intolerance.of.ambiguity, method = "spearman")
cor2 <- cor(d$planful.problem..solving, d$tolerance.of.ambiguity, method = "spearman")

# Displaying the correlation graph
ggplot(d, aes(x=confrontative.coping, y=intolerance.of.ambiguity)) + geom_point(shape=1) + geom_smooth(method=lm) + labs(title = paste("Correlation:", round(cor1, 3)))
ggplot(d, aes(x=planful.problem..solving, y=tolerance.of.ambiguity)) + geom_point(shape=1) + geom_smooth(method=lm) + labs(title = paste("Correlation:", round(cor2, 3)))

