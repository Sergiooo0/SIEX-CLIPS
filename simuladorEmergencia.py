import clips
import random
import time

# Inicializar entorno CLIPS
environment = clips.Environment()

# Cargar templates, reglas y hechos iniciales
environment.load("templates.clp")
environment.load("hechosEmergencia.clp")
environment.load("rulesIluminacion.clp")
environment.load("rulesEmergencia.clp")
environment.load("rulesSensores.clp")

# Cargar hechos iniciales en memoria activa y emparejar reglas
environment.reset()
environment.run()

# Obtenemos las salas
templateSala = environment.find_template("sala")
salas = []
for fact in environment.facts():
    if fact.template.name == "sala":
        salas.append(fact)


template_cambiar = environment.find_template("cambiar_valor")

while True:
    # Elegir una sala al azar
    room = random.choice(salas)

    problema = random.choice(["humo", "agua"])

    fact = template_cambiar.assert_fact(
        sala=room["nombre"],
        tipo=clips.Symbol(random.choice(["humo", "agua"])),
        valor=clips.Symbol("si"),
    )

    environment.assert_string("(inicializar-sensores)")

    # Correr el motor de inferencia
    environment.run()

    # Esperar un rato
    time.sleep(2)

    print("-----------------------------")
