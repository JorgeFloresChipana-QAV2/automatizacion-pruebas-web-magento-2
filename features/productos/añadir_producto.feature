@ui @productos
Feature: Añadir Producto

@iniciarSesion @eliminarProducto @Funcionalidad
Scenario: Verificar que un nuevo producto es añadido llenado el formulario con valores validos
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

@iniciarSesion @eliminarProducto @Dominio
Scenario: Verificar que un nuevo producto es añadido con valor maximo permitido para el campo de texto "Nombre Del Producto"
    Given el usuario Administrador navega a la pagina Productos
    When el usuario Administrador añade un nuevo producto con la siguiente informacion:
        | NombreDelProducto     | <RandomValue,255>     |
        | SKU                   | <RandomValue,15>      |
        | Precio                | <RandomNumber,2>      |
    Then el mensage exitoso "You saved the product." es mostrado en la parte superior de la pagina Productos

@iniciarSesion @eliminarProducto @Dominio
Scenario: Verificar que un nuevo producto es añadido con valor minimo permitido para el campo de texto "Nombre Del Producto"
    Given el usuario Administrador navega a la pagina Productos
    When el usuario Administrador añade un nuevo producto con la siguiente informacion:
        | NombreDelProducto     | <RandomValue,1>       |
        | SKU                   | <RandomValue,15>      |
        | Precio                | <RandomNumber,2>      |
    Then el mensage exitoso "You saved the product." es mostrado en la parte superior de la pagina Productos

@iniciarSesion @eliminarProducto @Dominio
Scenario: Verificar que el campo de texto "Nombre Del Producto" controla el valor maximo permitido cuando un nuevo producto es añadido
    Given el usuario Administrador navega a la pagina Productos
    When el usuario Administrador añade un nuevo producto con la siguiente informacion:
        | NombreDelProducto     | 265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres |
        | SKU                   | <RandomValue,15>      |
        | Precio                | <RandomNumber,2>      |
        And el usuario Administrador busca a el producto añadido usando "265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres" en el buscador por palabra clave
    Then ningun producto es encontrado en la busqueda realizada anteriormente

@iniciarSesion @eliminarProducto @Negativa
Scenario: Verificar que el campo de texto "Nombre Del Producto" controla que el valor minimo permitido es requerido cuando nuevo product es añadido
    Given el usuario Administrador navega a la pagina Productos
    When el usuario Administrador añade un nuevo producto con la siguiente informacion:
        | NombreDelProducto     |                       |
        | SKU                   | <RandomValue,15>      |
        | Precio                | <RandomNumber,2>      |
    Then el mensage de error "This is a required field." es mostrado en la en el formulario de la pagina Nuevo Producto

@iniciarSesion @eliminarProducto @Dominio
Scenario: Verificar que un nuevo producto es añadido con valor maximo permitido para el campo de texto "SKU"
    Given el usuario Administrador navega a la pagina Productos
    When el usuario Administrador añade un nuevo producto con la siguiente informacion:
        | SKU                   | <RandomValue,64>      |
        | NombreDelProducto     | <RandomValue,15>      |
        | Precio                | <RandomNumber,2>      |
    Then el mensage exitoso "You saved the product." es mostrado en la parte superior de la pagina Productos

@iniciarSesion @eliminarProducto @Dominio
Scenario: Verificar que un nuevo producto es añadido con valor minimo permitido para el campo de texto "SKU"
    Given el usuario Administrador navega a la pagina Productos
    When el usuario Administrador añade un nuevo producto con la siguiente informacion:
        | SKU                   | <RandomValue,1>       |
        | NombreDelProducto     | <RandomValue,15>      |
        | Precio                | <RandomNumber,2>      |
    Then el mensage exitoso "You saved the product." es mostrado en la parte superior de la pagina Productos

@iniciarSesion @eliminarProducto @Dominio
Scenario: Verificar que el campo de texto "SKU" controla el valor maximo permitido cuando un nuevo producto es añadido
    Given el usuario Administrador navega a la pagina Productos
    When el usuario Administrador añade un nuevo producto con la siguiente informacion:
        | SKU                   | 77catacteres_77catacteres_77catacteres_77caracteres_77caracteres_77caracteres |
        | NombreDelProducto     | <RandomValue,15>      |
        | Precio                | <RandomNumber,2>      |
    Then el mensage de error "Please enter less or equal than 64 symbols." es mostrado en la en el formulario de la pagina Nuevo Producto

@iniciarSesion @eliminarProducto @Negativa
Scenario: Verificar que el campo de texto "SKU" controla que el valor minimo permitido es requerido cuando nuevo product es añadido
    Given el usuario Administrador navega a la pagina Productos
    When el usuario Administrador añade un nuevo producto con la siguiente informacion:
        | NombreDelProducto     | <RandomValue,15>      |
        | SKU                   |                       |
        | Precio                | <RandomNumber,2>      |
    Then el mensage de error "This is a required field." es mostrado en la en el formulario de la pagina Nuevo Producto

@iniciarSesion @eliminarProducto @Dominio
Scenario: Verificar que un nuevo producto es añadido con valor maximo permitido para el campo de texto "Precio"
    Given el usuario Administrador navega a la pagina Productos
    When el usuario Administrador añade un nuevo producto con la siguiente informacion:
        | Precio                | <RandomNumber,1>      |
        | SKU                   | <RandomValue,15>      |
        | NombreDelProducto     | <RandomValue,15>      |
    Then el mensage exitoso "You saved the product." es mostrado en la parte superior de la pagina Productos

@iniciarSesion @eliminarProducto @Dominio
Scenario: Verificar que un nuevo producto es añadido con valor minimo permitido para el campo de texto "Precio"
    Given el usuario Administrador navega a la pagina Productos
    When el usuario Administrador añade un nuevo producto con la siguiente informacion:
        | Precio                | <RandomNumber,12>     |
        | SKU                   | <RandomValue,15>      |
        | NombreDelProducto     | <RandomValue,15>      |
    Then el mensage exitoso "You saved the product." es mostrado en la parte superior de la pagina Productos

@iniciarSesion @eliminarProducto @Negativa
Scenario: Verificar que el campo de texto "Precio" controla que el valor minimo permitido es requerido cuando nuevo product es añadido
    Given el usuario Administrador navega a la pagina Productos
    When el usuario Administrador añade un nuevo producto con la siguiente informacion:
        | SKU                   | <RandomValue,15>      |
        | NombreDelProducto     | <RandomValue,15>      |
        | Precio                |                       |
    Then el mensage de error "This is a required field." es mostrado en la en el formulario de la pagina Nuevo Producto

@iniciarSesion @eliminarProducto @Negativa
Scenario: Verificar que el campo de texto "Precio" no permite valores de tipo texto cuando nuevo product es añadido
    Given el usuario Administrador navega a la pagina Productos
    When el usuario Administrador añade un nuevo producto con la siguiente informacion:
        | SKU                   | <RandomValue,15>      |
        | NombreDelProducto     | <RandomValue,15>      |
        | Precio                | S                     |
    Then el mensage de error "Please enter a number 0 or greater in this field." es mostrado en la en el formulario de la pagina Nuevo Producto

@iniciarSesion @eliminarProducto @Negativa
Scenario: Verificar que el campo de texto "Precio" no permite valores de tipo simbolo cuando nuevo product es añadido
    Given el usuario Administrador navega a la pagina Productos
    When el usuario Administrador añade un nuevo producto con la siguiente informacion:
        | SKU                   | <RandomValue,15>      |
        | NombreDelProducto     | <RandomValue,15>      |
        | Precio                | $                     |
    Then el mensage de error "Please enter a number 0 or greater in this field." es mostrado en la en el formulario de la pagina Nuevo Producto

@iniciarSesion @eliminarProducto @Dominio
Scenario: Verificar que un nuevo producto es añadido con valor maximo permitido para el campo de texto "Cantidad"
    Given el usuario Administrador navega a la pagina Productos
    When el usuario Administrador añade un nuevo producto con la siguiente informacion:
        | Cantidad              | <RandomNumber,8>      |
        | Precio                | <RandomNumber,2>      |
        | SKU                   | <RandomValue,15>      |
        | NombreDelProducto     | <RandomValue,15>      |
    Then el mensage exitoso "You saved the product." es mostrado en la parte superior de la pagina Productos

@iniciarSesion @eliminarProducto @Dominio
Scenario: Verificar que un nuevo producto es añadido con valor minimo permitido para el campo de texto "Cantidad"
    Given el usuario Administrador navega a la pagina Productos
    When el usuario Administrador añade un nuevo producto con la siguiente informacion:
        | Cantidad              |                       |
        | Precio                | <RandomNumber,2>      |
        | SKU                   | <RandomValue,15>      |
        | NombreDelProducto     | <RandomValue,15>      |
    Then el mensage exitoso "You saved the product." es mostrado en la parte superior de la pagina Productos

@iniciarSesion @eliminarProducto @Negativa
Scenario: Verificar que el campo de texto "Cantidad" no permite valores de tipo texto cuando nuevo product es añadido
    Given el usuario Administrador navega a la pagina Productos
    When el usuario Administrador añade un nuevo producto con la siguiente informacion:
        | SKU                   | <RandomValue,15>      |
        | NombreDelProducto     | <RandomValue,15>      |
        | Precio                | <RandomNumber,2>      |
        | Cantidad              | S                     |
    Then el mensage de error "Please enter a valid number in this field." es mostrado en la en el formulario de la pagina Nuevo Producto

@iniciarSesion @eliminarProducto @Negativa
Scenario: Verificar que el campo de texto "Cantidad" no permite valores de tipo simbolo cuando nuevo product es añadido
    Given el usuario Administrador navega a la pagina Productos
    When el usuario Administrador añade un nuevo producto con la siguiente informacion:
        | SKU                   | <RandomValue,15>      |
        | NombreDelProducto     | <RandomValue,15>      |
        | Precio                | <RandomNumber,2>      |
        | Cantidad              | #                     |
    Then el mensage de error "Please enter a valid number in this field." es mostrado en la en el formulario de la pagina Nuevo Producto

@iniciarSesion @eliminarProducto @Dominio
Scenario: Verificar que un nuevo producto es añadido con valor maximo permitido para el campo de texto "Peso"
    Given el usuario Administrador navega a la pagina Productos
    When el usuario Administrador añade un nuevo producto con la siguiente informacion:
        | Peso                  | <RandomNumber,15>     |
        | Precio                | <RandomNumber,2>      |
        | SKU                   | <RandomValue,15>      |
        | NombreDelProducto     | <RandomValue,15>      |
    Then el mensage exitoso "You saved the product." es mostrado en la parte superior de la pagina Productos

@iniciarSesion @eliminarProducto @Dominio
Scenario: Verificar que un nuevo producto es añadido con valor minimo permitido para el campo de texto "Peso"
    Given el usuario Administrador navega a la pagina Productos
    When el usuario Administrador añade un nuevo producto con la siguiente informacion:
        | Peso                  |                       |
        | Precio                | <RandomNumber,2>      |
        | SKU                   | <RandomValue,15>      |
        | NombreDelProducto     | <RandomValue,15>      |
    Then el mensage exitoso "You saved the product." es mostrado en la parte superior de la pagina Productos

@iniciarSesion @eliminarProducto @Negativa
Scenario: Verificar que el campo de texto "Peso" no permite valores de tipo texto cuando nuevo producto es añadido
    Given el usuario Administrador navega a la pagina Productos
    When el usuario Administrador añade un nuevo producto con la siguiente informacion:
        | SKU                   | <RandomValue,15>      |
        | NombreDelProducto     | <RandomValue,15>      |
        | Precio                | <RandomNumber,2>      |
        | Peso                  | S                     |
    Then el mensage de error "Please enter a number 0 or greater in this field." es mostrado en la en el formulario de la pagina Nuevo Producto

@iniciarSesion @eliminarProducto @Negativa
Scenario: Verificar que el campo de texto "Peso" no permite valores de tipo simbolo cuando nuevo producto es añadido
    Given el usuario Administrador navega a la pagina Productos
    When el usuario Administrador añade un nuevo producto con la siguiente informacion:
        | SKU                   | <RandomValue,15>      |
        | NombreDelProducto     | <RandomValue,15>      |
        | Precio                | <RandomNumber,2>      |
        | Peso                  | %                     |
    Then el mensage de error "Please enter a number 0 or greater in this field." es mostrado en la en el formulario de la pagina Nuevo Producto
