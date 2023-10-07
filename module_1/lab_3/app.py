from pyswip import Prolog
prolog = Prolog()
prolog.consult("bd.pl")

print('Введите вашего игрока:')
character = input()

def get_type(c):
    for t in ['boss', 'underboss', 'capo', 'soldier', 'consigliere', 'assosiate', 'gangster']:
        t_query = f"{t}('{c}')"
        if len(list(prolog.query(t_query)))>0:
            return t
    return False

character_type = get_type(character)
while(not character_type):
    print('Такого персонажа нет, введите другого:')
    character = input()
    character_type = get_type(character)
print('тип персонажа: ', character_type)

family_query = f"family_member('{character}',X)"
chief_query = f"chief(X, '{character}')"
enemy_query = f"enemy(X, '{character}')"
family_res = list(prolog.query(family_query))
chief_res = list(prolog.query(chief_query))

enemies_res = list(prolog.query(enemy_query))
enemies = [elem['X'] for elem in enemies_res]

print(f"шеф: {chief_res[0]['X'] if len(chief_res)>0 else 'нет шефа'}")
print(f"враги которых нужно убить: {enemies if len(enemies)>0 else 'врагов нет'}")
