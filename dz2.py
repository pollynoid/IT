# Считать от пользователя число n. Вывести "лесенку" из n ступенек, 
# где первая строчка состоит из первой цифры, 
# вторая - из первых двух и т.д. 
# Без пробелов!

print("Введите n:")
n = int(input())

for i in range(1, n + 1):
    for j in range(1, i + 1):
        print(j, sep='', end='')
    print()