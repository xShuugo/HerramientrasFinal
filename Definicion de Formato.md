# Definicion de formato

### Inicialización de Nivel

- **Nombre de Nivel**: A mostrar al inicio del Nivel
- **Posición de Jugador Inicial**: Posición de spawn
- Tamaño de Mapa será de 30m x 30m por defecto

### Listado de Objetos

**Formato por cada Objeto**:
- Código de Objeto
- Posición X 
- Posición Y
- Rotación Z
- Tipo de Objeto
- Propiedad 1
- Propiedad 2
- Propiedad ...

<hr>

Cada tipo de objeto tiene una diferente cantidad de propiedades, el código en Unity que lee el archivo texto sabrá cuántas propiedades esperar dependiendo del tipo de objeto.

**Tipos de Objetos**:

- **Paredes**
- **Mesa**
- **Lámpara**: *Longitud de cable, rango de luz, boolean para instanciarlo sobre una mesa*
- **Caja fuerte (password)**: *Password Correcto, contenido de la caja, boolean para instanciarlo sobre una mesa*
- **Llave de puerta final**
- **Notas (pistas)**: *Contenido de la nota*
- **Enchufes**
- **Caja de fósforos**: *Cantidad de fósforos*
- **Puerta (final)**: *Código de Llave asignada*
