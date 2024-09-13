@ui
Feature: Añadir Producto

@login @eliminarProducto @Funcionalidad
Scenario: Verificar que un nuevo producto es añadido
    Given el usuario Administrador navega a la pagina Productos
    When el usuario Administrador añade un nuevo producto con la siguiente informacion:
        | SKU                   | <RandomValue,15>      |
        | NombreDelProducto     | <RandomValue,15>      |
        | Precio                | <RandomNumber,2>      |
        | Cantidad              | <RandomNumber,2>      |
        | EstadoDeExistencias   | exitencia             |
        | Peso                  | <RandomNumber,3>      |
        | Visibilidad           | catalogo y busqueda   |
        | Categorias            | Default Category      |
        | PaisDeFabricacion     | Bolivia               | 
    Then el mensage exitoso "You saved the product." es mostrado en la parte superior de la pagina Productos
