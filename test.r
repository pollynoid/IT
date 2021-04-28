library("psych")
library("dplyr")
library("ggplot2")
library("GGally")

# ��������� ���� ������
d <- read.csv("test/drug-use-by-age.csv")
glimpse(d) # �������, ��� ����� ������

# ���������� ������������ ���������� �� ����������� ��������
summary(d[, c("alcohol.use", "alcohol.frequency", "marijuana.use", "marijuana.frequency")])
names <- c('alcohol.use', 'alcohol.frequency', 'marijuana.use', 'marijuana.frequency') # ��������� �������� ��������
# ������� ������� ��� ����������� ����������� ��������
margins.default = par("mar") # ������� ������� ��������, ����� ������������ ��� �����
par(mar = c(5, 10, 4, 2)) # �������� ���� left �� 10 �������� ������

# ������������� ��������� ������������ ����������
# ���������
var_vec <- as.numeric(c(var(d$alcohol.use), var(d$alcohol.frequency), var(d$marijuana.use), var(d$marijuana.frequency)))
barplot(var_vec, names.arg = names, main = "���������", horiz=TRUE, las=1)
# ������� ��������
mean_vec <- as.numeric(c(mean(d$alcohol.use), mean(d$alcohol.frequency), mean(d$marijuana.use), mean(d$marijuana.frequency)))
barplot(mean_vec, names.arg = names, main = "������� ��������", horiz=TRUE, las=1)
# �������
median_vec <- as.numeric(c(median(d$alcohol.use), median(d$alcohol.frequency), median(d$marijuana.use), median(d$marijuana.frequency)))
barplot(median_vec, names.arg = names, main = "�������", horiz=TRUE, las=1)

par(mar = margins.default) # ��������������� �������������� �������

# ���������� �������� �������
# �������� 1
qplot(data=d, age, alcohol.use, xlab='�������', ylab='���� ������������� ��������')
# �������� 2
qplot(data=d, age, marijuana.use, xlab='�������', ylab='���� ������������� ���������')
# �������� 3
qplot(data=d, age, alcohol.frequency, xlab='�������', ylab='������� ������������ ��������')
# �������� 4
qplot(data=d, age, marijuana.frequency, xlab='�������', ylab='������� ������������ ���������')

# ��������� ��������
# ���� ������������� ...
boxplot(d$alcohol.use, d$marijuana.use, names = c('��������', '���������'), main ='���� �������������')
# ������� ������������ ...
boxplot(d$alcohol.frequency, d$marijuana.frequency, names = c('��������', '���������'), main ='������� ������������')

