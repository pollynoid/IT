import math

# основные части алгоритма были поделены на функции, возвращающие true или false - успешность выполнения: 
#   ввод 1-ого числа, ввод действия, ввод 2-ого числа, вычисление результата операции
# сделано это т.к. используются циклы while, для надёжности которых введен лимит для неверного ввода - 100 раз

i = ''
n = 0
m = 0
z = 0
counter = 0
limit = 100

# механизм многократного ввода нового числа/действия, в случае введения неверного во всех функциях реализован одинаково:
#   считывается строка
#   пока (считанная строка не удовлетворяет условию и счётчик != лимит)
#       считывается новая строка
#       счётчик увеличивается
#   если (счётчик >= лимит)
#       выводится сообщение об ошибке
#       возвращается false
#   иначе
#       счётчик обнуляется
#       возвращается true


# функция ввода 1-ого числа
def input_first_n():
    global i
    global n
    global counter
    global limit
    print("введите число:")
    i = input()
    while i.isdigit() != True and counter != limit:
        print("это не число, введите число:")
        i = input()
        counter += 1
    if counter >= limit:
        print('превышен лимит некорректоного ввода')
        return False
    else:
        counter = 0
        n = int(i)
        return True

# функция ввода действия
def input_action():
    global z
    global counter
    global limit
    print("введите действие:")
    z = input()

    while z != '+' and z != '-' and z != '/' and z != '*' and z != '^' and z != 'sqrt' and z != '!' and counter != limit:
        print("это не действие, введите действие:")
        z = input()
        counter += 1
    if counter >= limit:
        print('превышен лимит некорректоного ввода')
        return False
    else:
        counter = 0
        n = int(i)
        if z == '+' or z == '-' or z == '/' or z == '*' or z == '^': # если выполнение действия требует 2-ого числа, вызывается необходимая функция
            if input_second_n() == False:
                return False
        return True

# функция ввода 2-ого числа     
def input_second_n():
    global i
    global m
    global counter
    global limit
    print("введите 2е число:")
    i = input()
    while i.isdigit() != True and counter != limit:
        print("это не число, введите 2е число:")
        i = input()
        counter += 1
    if counter >= limit:
        print('превышен лимит некорректоного ввода')
        return False
    else:
        m = int(i)
        return True

# функция вычисления результата операции
def count():
    global n
    global m
    global z
    if z == '+': 
        result = n + m
        print("результат:", result) 
    elif z == '-': 
        result = n - m
        print("результат:", result) 
    elif z == '/': 
        result = n / m
        print("результат:", result) 
    elif z == '*': 
        result = n * m
        print("результат:", result)
    elif z == '^': 
        result = n ** m
        print("результат:", result)
    elif z == 'sqrt': 
        result = math.sqrt(n)
        print("результат:", result)
    elif z == '!': 
        result = math.factorial(n)
        print("результат:", result)
    else: print("что-то пошло не так")

# сама программа
if input_first_n() == True:
    if input_action() == True:
        count()