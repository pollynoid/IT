# Считайте строку и замените в ней все буквы h кроме первой и последней на H
import string

print("Введите строку на английском языке: ")
s = input()
s_list = list(s)

for i in range(1, len(s)-1):
    if s_list[i] == 'h':
        s_list[i] = 'H'

s = ''.join(s_list)
print("Преобразованная строка:", s)