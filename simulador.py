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
zonas = [
    hecho["nombre"] for hecho in environment.facts() if hecho.template.name == "zona"
]
salas = [
    hecho["nombre"] for hecho in environment.facts() if hecho.template.name == "sala"
]
users = [
    hecho["nombre"] for hecho in environment.facts() if hecho.template.name == "usuario"
]
racks = [hecho for hecho in environment.facts() if hecho.template.name == "rack"]
sensors = [hecho for hecho in environment.facts() if hecho.template.name == "sensor"]
emergencias = [clips.Symbol("humo"), clips.Symbol("agua")]

print("----------------SIMULACION-------------------------------")
for _ in range(10):
    # First we move the users
    for u in users:
        if random.random() < 0.1:
            fact = template_accion_moverse_sala.assert_fact(
                usuario=u, sala=random.choice(salas)
            )

    # Emergency
    if random.random() < 0.01:
        fact = template_cambiar_sensor_emergencia.assert_fact(
            zona=random.choice(zonas),
            tipo=random.choice(emergencias),
            valor=clips.Symbol("si"),
        )

    # Racks
    for r in racks:
        if random.random() < 0.5:
            value = r["voltaje"]
            value += random.choice(range(-10, 10))
            value = max(100, min(300, value))

            fact = template_cambiar_valor_voltaje.assert_fact(id=r["id"], valor=value)

    # Temperature and Humidity
    for s in sensors:
        if random.random() < 0.25:
            para = s["tipo"]
            value = s["valor"]
            if para == clips.Symbol("temperatura"):
                value += random.choice([-20, -10, 10, 20])
                value = max(0, min(100, value))
            else:
                value += random.choice(range(-10, 10))
                value = max(-20, min(80, value))
            fact = template_cambiar_temperatura_humedad.assert_fact(
                sala=s["sala"], tipo=para, valor=value
            )

    # Antes de ejecutar el ciclo de reglas, inserta el hecho "inicializar-sensores"
    environment.assert_string("(inicializar-sensores)")
    environment.run()
    time.sleep(10)
    print()
    print("-----------------------------------------------------")
