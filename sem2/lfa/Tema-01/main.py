import sys
f = open('input.txt')

DFA = {}

start_state = f.readline()
start_state = start_state.strip()

finish_states = f.readline()
finish_states = [elem.strip() for elem in finish_states.split()]

for line in f:
    table = [elem.strip() for elem in line.split()]
    if DFA.get(table[0]) == None:
        DFA[table[0]] = {}
    DFA[table[0]].update({table[1]: table[2]})
f.close()


word = input('\nCuvantul este: ').strip()
print()

current_state = start_state
path_saver = [current_state]

for letter in word:
    if DFA[current_state].get(letter) == None:
        sys.exit("Cuvant neacceptat, stare imposibila\n")
    else:
        current_state = DFA[current_state][letter]
        path_saver.append(current_state)

if current_state in finish_states:
    print('Cuvant acceptat')
else:
    print('Cuvant neacceptat, stare nefinala')

for state in path_saver[:-1]:
    print(state, end=' -> ')
print(path_saver[-1], '\n')

''' input.txt template
0
4
0 b 0 
0 a 1
1 a 1 
1 b 2
2 a 1 
2 b 3
3 b 1
3 a 4 
4 a 4 
4 b 4
'''