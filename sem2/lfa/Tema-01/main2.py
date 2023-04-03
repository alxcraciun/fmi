import sys
f = open('input.txt')

NFA = {}

start_state = f.readline()
start_state = start_state.strip()

finish_states = f.readline()
finish_states = [elem.strip() for elem in finish_states.split()]

for line in f:
    table = [elem.strip() for elem in line.split()]

    if NFA.get(table[0]) == None:
        NFA[table[0]] = {}

    if NFA[table[0]].get(table[1]) == None:
        NFA[table[0]][table[1]] = list()
    
    NFA[table[0]][table[1]].append(table[2])

f.close()

word = input('\nCuvantul este: ').strip()
print()

current_states = [start_state]
path_saver = [[start_state]]

for letter in word:
    i = 0
    length_current_states = len(current_states)
    while i < length_current_states: 
        if NFA[current_states[i]].get(letter) == None:
            current_states.pop(i)
            path_saver.pop(i)
            length_current_states -= 1
        else: 
            if len(NFA[current_states[i]][letter]) == 1:
                current_states[i] = NFA[current_states[i]][letter][0]
                path_saver[i].append(current_states[i])
                i += 1
            else: 
                for possible_state in NFA[current_states[i]][letter]:
                    current_states.append(possible_state)
                    new_path = [ elem for elem in path_saver[i] ]
                    new_path.append(possible_state)
                    path_saver.append(new_path)
                path_saver.pop(i)
                current_states.pop(i)
                length_current_states -= 1

for i in range(len(current_states)):
    if current_states[i] in finish_states:
        print('Cuvant acceptat')
        break
else:
    print('Cuvant neacceptat')

for i in range(len(current_states)):
    if current_states[i] in finish_states:
        print('✅', end=' ')
    else:
        print('❌', end=' ')
    for state in path_saver[i][:-1]:
        print(state, end=' -> ')
    print(path_saver[i][-1])
print()

''' input.txt template
0 1 4
0 b 0 
0 a 1
0 a 0
1 a 1 
1 b 2
2 a 1 
2 b 3
2 a 3
3 b 1
3 a 4 
4 a 4 
4 b 4
'''