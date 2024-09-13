@ui
Feature: Editar Producto

@login @eliminarProducto @Funcionalidad
Scenario: Verificar que todos los campos de un product existente es modificado
    Given el usuario Administrador añade un nuevo producto por con informacion por defecto
        And el usuario Administrador navega a la pagina Productos
        And el usuario Administrador selecciona la opcion Editar para el producto añadido en la pagina productos
    When el usuario Administrador edita la informacion de un existente producto con la siguiente informacion:
        | NombreDelProducto     | <RandomValue,15>      |
        | SKU                   | <RandomValue,10>      |
        | Precio                | <RandomNumber,2>      |
        | Cantidad              | <RandomNumber,2>      |
        | EstadoDeExistencias   | agotado               |
        | Peso                  | <RandomNumber,2>      |
        | Visibilidad           | No visible            |
        | Categorias            | Default Category      |
        | PaisDeFabricacion     | Chile                 |
    Then el mensage exitoso "You saved the product." es mostrado en la parte superior de la pagina Productos
