@ui @productos
Feature: Buscar Producto por palabra clave

@iniciarSesion @eliminarProducto @Funcionalidad
Scenario: Verificar que el nuevo product es encontrado usando el buscador por palabra clave
    Given el usuario Administrador navega a la pagina Productos
        And el usuario Administrador añade un nuevo producto con la siguiente informacion:
            | NombreDelProducto     | <RandomValue,15>      |
            | SKU                   | VALOR_UNICO           |
            | Precio                | 13                    |
            | Cantidad              | 14                    |
            | EstadoDeExistencias   | exitencia             |
            | Peso                  | 15                    |
            | Visibilidad           | catalogo y busqueda   |
            | Categorias            | Default Category      |
            | PaisDeFabricacion     | Bolivia               | 
    When el usuario Administrador busca a el producto añadido con el buscador por palabra clave
    Then el nuevo producto es mostrado en la tabla de productos con la siguiente informacion:
        | NombreDelProducto     | <RandomValue,15>  |
        | SKU                   | VALOR_UNICO       |
        | Precio                | 13                |
        | Cantidad              | 14                |

@iniciarSesion @eliminarProducto @Funcionalidad
Scenario: Verificar que el nuevo producto es encontrado usando "SKU" en el buscador por palabra clave
    Given el usuario Administrador navega a la pagina Productos
        And el usuario Administrador añade un nuevo producto con la siguiente informacion:
            | NombreDelProducto     | <RandomValue,15>      |
            | SKU                   | VALOR_UNICO           |
            | Precio                | 13                    |
    When el usuario Administrador busca a el producto añadido usando "VALOR_UNIC" en el buscador por palabra clave
    Then el nuevo producto es mostrado en la tabla de productos con la siguiente informacion:
        | NombreDelProducto     | <RandomValue,15>  |
        | SKU                   | VALOR_UNICO       |
        | Precio                | 13                |
