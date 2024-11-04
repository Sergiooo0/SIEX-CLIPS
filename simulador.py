import clips
import time
import random

# Inicializar entorno CLIPS
environment = clips.Environment()

# Cargar templates, reglas y hechos iniciales
environment.load("templates.clp")
environment.load("hechos.clp")
environment.batch_star("rules.bat")

# Cargar hechos iniciales en memoria activa y emparejar reglas
environment.reset()
environment.run()

template_cambiar_temperatura_humedad = environment.find_template("cambiar_valor")
template_cambiar_sensor_emergencia = environment.find_template("cambiar_valorZ")
template_cambiar_valor_voltaje = environment.find_template("cambiar_valor_voltaje")
template_accion_moverse_sala = environment.find_template("accion_moverse_sala")
zonas = [hecho["nombre"] for hecho in environment.facts() if hecho.template.name == "zona"]
salas = [hecho["nombre"] for hecho in environment.facts() if hecho.template.name == "sala"]
users = [hecho["nombre"] for hecho in environment.facts() if hecho.template.name == "usuario"]
emergencias = [clips.Symbol("humo"), clips.Symbol("agua")]
temp_humd = [clips.Symbol("temperatura"), clips.Symbol("humedad")]
valores_simbolicos =  [clips.Symbol("si"), clips.Symbol("no")]

print("----------------SIMULACION-------------------------------")
for _ in range(10):
    fact = template_cambiar_temperatura_humedad.assert_fact(
        sala=random.choice(salas), tipo=random.choice(temp_humd), valor=random.choice(range(20, 45))
    )
    fact = template_cambiar_sensor_emergencia.assert_fact(
        zona = random.choice(zonas), tipo=random.choice(emergencias), valor = random.choice(valores_simbolicos)
    )
    fact = template_cambiar_valor_voltaje.assert_fact(
        id = 1, valor = random.choice(range(200, 250))
    )
    fact= template_accion_moverse_sala.assert_fact(
        usuario = random.choice(users), sala = random.choice(salas)
    )
    # Antes de ejecutar el ciclo de reglas, inserta el hecho "inicializar-sensores"
    environment.assert_string("(inicializar-sensores)")
    environment.run()
    time.sleep(3)
    print()
    print("-----------------------------------------------------")

