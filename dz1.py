# Считать n чисел с клавиатуры и вывести их сумму. Разрешается спрашивать у пользователя n.

print("Введите n - количество чисел:")
n = int(input())
s = 0

for i in range(n):
    print("Введите", i+1, "число:")
    m = int(input())
    s += m

print ("Сумма:")
print(s)