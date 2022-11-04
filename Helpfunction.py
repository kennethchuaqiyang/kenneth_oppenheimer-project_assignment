import os

def working_directory(item):
    return os.getcwd()+item

def round_to_2_dp(price):

    return format(price, '.2f')

def splittext(sentence, num):
    print(num)
    a = sentence.split(" ")
    if str(num) in sentence:
        return "TRUE"
    return "FALSE"