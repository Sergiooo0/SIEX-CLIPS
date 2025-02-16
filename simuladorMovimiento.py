import clips
import random
import time

# Inicializar entorno CLIPS
environment = clips.Environment()

# Cargar templates, reglas y hechos iniciales
environment.load("templates.clp")
environment.load("hechosMovimiento.clp")
environment.load("rulesMovimiento.clp")
environment.load("rulesIluminacion.clp")

# Cargar hechos iniciales en memoria activa y emparejar reglas
environment.reset()
environment.run()

people = []

for fact in environment.facts():
    if fact.template.name == "usuario":
        people.append(fact)

# Ahora eliminamos a todos excepto uno
if len(people) > 1:
    # Elegir uno al azar para conservar
    survivor = random.choice(people)

    # Eliminar todos los demás usuarios
    for person in people:
        if person != survivor:
            person.retract()

# Ahora le damos nivel de acceso 1 al usuario que queda
survivor.modify_slots(nivel_acceso=1)

print("\n\n\n")

print("Pasamos a tener una sola persona con nivel de acceso 1")
print("Usuario seleccionado: ", survivor)
print("Lo iremos moviendo por todas las salas en un bucle infinito")

templateAccion_moverse_sala = environment.find_template("accion_moverse_sala")
rooms = [x for x in environment.facts() if x.template.name == "sala"]

print("\n\n\n")

while True:
    # Elegir una sala al azar
    room = random.choice(rooms)

    # Crear un nuevo hecho de movimiento
    new_fact = templateAccion_moverse_sala.assert_fact(
        usuario=survivor["nombre"], sala=room["nombre"]
    )

    # Correr el motor de inferencia
    environment.run()

    # Esperar un rato
    time.sleep(2)

    print("\n\n\n")
