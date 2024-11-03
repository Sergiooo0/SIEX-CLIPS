import clips
import time

# Inicializar entorno CLIPS
environment = clips.Environment()

# Cargar templates, reglas y hechos iniciales
environment.load("templates.clp")
environment.load("hechos.clp")
environment.batch_star("rules.bat")

# Cargar hechos iniciales en memoria activa y emparejar reglas
environment.reset()
environment.run()


print("----------------SIMULACION-------------------------------")
