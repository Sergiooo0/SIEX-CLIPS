import clips
import time

# Inicializar entorno CLIPS
environment = clips.Environment()

# Cargar templates, reglas y hechos iniciales
environment.load("templates.clp")
environment.load("hechosTemperatura.clp")
environment.load("rulesAireAcondicionado.clp")
environment.load("rulesCalefaccion.clp")
environment.load("rulesSensores.clp")
environment.load("rulesVentilador.clp")

# Cargar hechos iniciales en memoria activa y emparejar reglas
environment.reset()

print("----------------SIMULACION-------------------------------")

# Prueba de modificación de temperaturas
template_cambiar = environment.find_template("cambiar_valor")
temperatura = 20
for _ in range(10):
    time.sleep(2)
    fact = template_cambiar.assert_fact(
        sala="Sala A1", tipo=clips.Symbol("temperatura"), valor=temperatura
    )
    fact = template_cambiar.assert_fact(
        sala="Sala D1", tipo=clips.Symbol("temperatura"), valor=temperatura
    )
    temperatura += 2
    # Antes de ejecutar el ciclo de reglas, inserta el hecho "inicializar-sensores"
    environment.assert_string("(inicializar-sensores)")
    environment.run()
    print()
    print("------------------------------------------------------")
