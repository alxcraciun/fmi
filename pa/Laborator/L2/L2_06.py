# a) Decodarea sirului

sir = input('Textul codat: ')
sir_decodat = ''

i = 0
while i < len(sir):
    try: 
        num = int(sir[i] + sir[i+1])
        sir_decodat += num*sir[i+2]
        i+=3
    except:
        try:
            num = int(sir[i])
            sir_decodat += num * sir[i+1]
            i+=2
        except:
            print('Textul nu e codificat corect', end = '\n\n')
            break
else:
    print(sir_decodat, end = '\n\n')


# b) Codificarea unui sir

sir2 = input("Textul normal: ")
sir2_codat = ''

char = sir2[0]
counter = 1

for i in range(1, len(sir2)):
    if char == sir2[i]:
        counter += 1
    else:
        sir2_codat += (str(counter) + char)
        char = sir2[i]
        counter = 1

# Pentru a nu rata ultima parte ramasa:
sir2_codat += (str(counter) + char)

print(sir2_codat)



