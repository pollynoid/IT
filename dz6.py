# Считать от пользователя число n и вывести n-ое число Фибоначчи. 
# (Особый почёт и уважение тем кто сможет сделать это без использования циклов)

def fibonacci(n):
    cur = 1
    if n > 2:
        cur = fibonacci(n-1) + fibonacci(n-2)
    return cur

print("Введите номер искомого элемента:")
n = int(input())
value = fibonacci(n)
print(n, "элемент последовательности равен", value)