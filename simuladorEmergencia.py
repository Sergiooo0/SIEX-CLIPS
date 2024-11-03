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

# Obtenemos las zonas
templateZona = environment.find_template("zona")
zonas = []
for fact in environment.facts():
    if fact.template.name == "zona":
        zonas.append(fact)

template_cambiar = environment.find_template("cambiar_valorZ")

while True:
    # Elegir una zona al azar
    zona = random.choice(zonas)

    problema = random.choice(["humo", "agua"])

    fact = template_cambiar.assert_fact(
        zona=zona["nombre"],
        tipo=clips.Symbol(problema),
        valor=clips.Symbol("si"),
    )

    environment.assert_string("(inicializar-sensores)")

    # Correr el motor de inferencia
    environment.run()

    # Esperar un rato
    time.sleep(2)
    print()
    print("-----------------------------")
