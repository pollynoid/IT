library("psych")
library("dplyr")
library("ggplot2")
library("GGally")

# считываем базу данных
d <- read.csv("test/drug-use-by-age.csv")
glimpse(d) # смотрим, что лежит внутри

# отображаем описательные статистики по необходимым столбцам
summary(d[, c("alcohol.use", "alcohol.frequency", "marijuana.use", "marijuana.frequency")])
names <- c('alcohol.use', 'alcohol.frequency', 'marijuana.use', 'marijuana.frequency') # сохраняем названия столбцов
# зададим отступы для корректного отображения графиков
margins.default = par("mar") # запишем текущее значение, чтобы восстановить его потом
par(mar = c(5, 10, 4, 2)) # увеличим поле left до 10 условных единиц

# визуализируем некоторые описательные статистики
# Дисперсия
var_vec <- as.numeric(c(var(d$alcohol.use), var(d$alcohol.frequency), var(d$marijuana.use), var(d$marijuana.frequency)))
barplot(var_vec, names.arg = names, main = "Дисперсия", horiz=TRUE, las=1)
# Среднее значение
mean_vec <- as.numeric(c(mean(d$alcohol.use), mean(d$alcohol.frequency), mean(d$marijuana.use), mean(d$marijuana.frequency)))
barplot(mean_vec, names.arg = names, main = "Среднее значение", horiz=TRUE, las=1)
# Медиана
median_vec <- as.numeric(c(median(d$alcohol.use), median(d$alcohol.frequency), median(d$marijuana.use), median(d$marijuana.frequency)))
barplot(median_vec, names.arg = names, main = "Медиана", horiz=TRUE, las=1)

par(mar = margins.default) # восстанавливаем первоначальные отступы

# Визуальная проверка гипотез
# гипотеза 1
qplot(data=d, age, alcohol.use, xlab='Возраст', ylab='Доля употребляющих алкоголь')
# гипотеза 2
qplot(data=d, age, marijuana.use, xlab='Возраст', ylab='Доля употребляющих марихуану')
# гипотеза 3
qplot(data=d, age, alcohol.frequency, xlab='Возраст', ylab='Частота употребления алкоголя')
# гипотеза 4
qplot(data=d, age, marijuana.frequency, xlab='Возраст', ylab='Частота употребления марихуаны')

# Диаграммы разброса
# Доля употребляющих ...
boxplot(d$alcohol.use, d$marijuana.use, names = c('алкоголь', 'марихуана'), main ='Доля употребляющих')
# Частота употребления ...
boxplot(d$alcohol.frequency, d$marijuana.frequency, names = c('алкоголь', 'марихуана'), main ='Частота употребления')

