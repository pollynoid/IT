# Считайте строку и удалите каждый третий символ в ней

print("Введите строку:")
s = input()
count = 0
l = []

for i in range(len(s)):
    count += 1
    if count == 3:
        count = 0
        continue
    else:
        l.append(s[i])

s = ''.join(l)
print("Преобразованная строка:", s)