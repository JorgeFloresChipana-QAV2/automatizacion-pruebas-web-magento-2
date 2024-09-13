@ui @productos
Feature: Editar Producto

@iniciarSesion @eliminarProducto @Funcionalidad
Scenario: Verificar que todos los campos de un producto existente es modificado
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

@iniciarSesion @eliminarProducto @Funcionalidad
Scenario: Verificar que la informacion de 'Nombre Del producto' de un producto existente es modificado
    Given el usuario Administrador añade un nuevo producto por con informacion por defecto
        And el usuario Administrador navega a la pagina Productos
        And el usuario Administrador selecciona la opcion Editar para el producto añadido en la pagina productos
    When el usuario Administrador edita la informacion de un existente producto con la siguiente informacion:
        | NombreDelProducto     | <RandomValue,15>      |
    Then el mensage exitoso "You saved the product." es mostrado en la parte superior de la pagina Productos

@iniciarSesion @eliminarProducto @Funcionalidad
Scenario: Verificar que la informacion de 'SKU' de un producto existente es modificado
    Given el usuario Administrador añade un nuevo producto por con informacion por defecto
        And el usuario Administrador navega a la pagina Productos
        And el usuario Administrador selecciona la opcion Editar para el producto añadido en la pagina productos
    When el usuario Administrador edita la informacion de un existente producto con la siguiente informacion:
        | SKU                   | <RandomValue,15>  |
    Then el mensage exitoso "You saved the product." es mostrado en la parte superior de la pagina Productos

@iniciarSesion @eliminarProducto @Funcionalidad
Scenario: Verificar que la informacion de 'Precio' de un producto existente es modificado
    Given el usuario Administrador añade un nuevo producto por con informacion por defecto
        And el usuario Administrador navega a la pagina Productos
        And el usuario Administrador selecciona la opcion Editar para el producto añadido en la pagina productos
    When el usuario Administrador edita la informacion de un existente producto con la siguiente informacion:
        | Precio                | 105                   |
    Then el mensage exitoso "You saved the product." es mostrado en la parte superior de la pagina Productos

@iniciarSesion @eliminarProducto @Funcionalidad
Scenario: Verificar que la informacion de 'Cantidad' de un producto existente es modificado
    Given el usuario Administrador añade un nuevo producto por con informacion por defecto
        And el usuario Administrador navega a la pagina Productos
        And el usuario Administrador selecciona la opcion Editar para el producto añadido en la pagina productos
    When el usuario Administrador edita la informacion de un existente producto con la siguiente informacion:
        | Cantidad              | 300                   |
    Then el mensage exitoso "You saved the product." es mostrado en la parte superior de la pagina Productos

@iniciarSesion @eliminarProducto @Funcionalidad
Scenario: Verificar que la informacion de 'Estado De Existencia' de un producto existente es modificado
    Given el usuario Administrador añade un nuevo producto por con informacion por defecto
        And el usuario Administrador navega a la pagina Productos
        And el usuario Administrador selecciona la opcion Editar para el producto añadido en la pagina productos
    When el usuario Administrador edita la informacion de un existente producto con la siguiente informacion:
        | EstadoDeExistencias   | Agotado               |
    Then el mensage exitoso "You saved the product." es mostrado en la parte superior de la pagina Productos

@iniciarSesion @eliminarProducto @Funcionalidad
Scenario: Verificar que la informacion de 'Peso' de un producto existente es modificado
    Given el usuario Administrador añade un nuevo producto por con informacion por defecto
        And el usuario Administrador navega a la pagina Productos
        And el usuario Administrador selecciona la opcion Editar para el producto añadido en la pagina productos
    When el usuario Administrador edita la informacion de un existente producto con la siguiente informacion:
        | Peso                  | 150                    |
    Then el mensage exitoso "You saved the product." es mostrado en la parte superior de la pagina Productos

@iniciarSesion @eliminarProducto @Funcionalidad
Scenario: Verificar que la informacion de 'Visibilidad' de un producto existente es modificado a "No visible individualmente"
    Given el usuario Administrador añade un nuevo producto por con informacion por defecto
        And el usuario Administrador navega a la pagina Productos
        And el usuario Administrador selecciona la opcion Editar para el producto añadido en la pagina productos
    When el usuario Administrador edita la informacion de un existente producto con la siguiente informacion:
        | Visibilidad           | No visible individualmente |
    Then el mensage exitoso "You saved the product." es mostrado en la parte superior de la pagina Productos

@iniciarSesion @eliminarProducto @Funcionalidad
Scenario: Verificar que la informacion de 'Categorias' de un producto existente es modificado
    Given el usuario Administrador añade un nuevo producto por con informacion por defecto
        And el usuario Administrador navega a la pagina Productos
        And el usuario Administrador selecciona la opcion Editar para el producto añadido en la pagina productos
    When el usuario Administrador edita la informacion de un existente producto con la siguiente informacion:
        | Categorias            | Collections      |
    Then el mensage exitoso "You saved the product." es mostrado en la parte superior de la pagina Productos

@iniciarSesion @eliminarProducto @Funcionalidad
Scenario: Verificar que la informacion de 'Pais De Fabricacion' de un producto existente es modificado
    Given el usuario Administrador añade un nuevo producto por con informacion por defecto
        And el usuario Administrador navega a la pagina Productos
        And el usuario Administrador selecciona la opcion Editar para el producto añadido en la pagina productos
    When el usuario Administrador edita la informacion de un existente producto con la siguiente informacion:
        | PaisDeFabricacion     | Chile                 |
    Then el mensage exitoso "You saved the product." es mostrado en la parte superior de la pagina Productos







@iniciarSesion @eliminarProducto @Dominio
Scenario: Verificar que un producto existente es modificado con valor maximo permitido para el campo de texto "Nombre Del Producto"
    Given el usuario Administrador añade un nuevo producto por con informacion por defecto
        And el usuario Administrador navega a la pagina Productos
        And el usuario Administrador selecciona la opcion Editar para el producto añadido en la pagina productos
    When el usuario Administrador edita la informacion de un existente producto con la siguiente informacion:
        | NombreDelProducto     | <RandomValue,255>     |
    Then el mensage exitoso "You saved the product." es mostrado en la parte superior de la pagina Productos

@iniciarSesion @eliminarProducto @Dominio
Scenario: Verificar que un producto existente es modificado con valor minimo permitido para el campo de texto "Nombre Del Producto"
    Given el usuario Administrador añade un nuevo producto por con informacion por defecto
        And el usuario Administrador navega a la pagina Productos
        And el usuario Administrador selecciona la opcion Editar para el producto añadido en la pagina productos
    When el usuario Administrador edita la informacion de un existente producto con la siguiente informacion:
        | NombreDelProducto     | <RandomValue,1>       |
    Then el mensage exitoso "You saved the product." es mostrado en la parte superior de la pagina Productos

@iniciarSesion @eliminarProducto @Dominio
Scenario: Verificar que el campo de texto "Nombre Del Producto" controla el valor maximo permitido cuando un producto existente es modificado
    Given el usuario Administrador añade un nuevo producto por con informacion por defecto
        And el usuario Administrador navega a la pagina Productos
        And el usuario Administrador selecciona la opcion Editar para el producto añadido en la pagina productos
    When el usuario Administrador edita la informacion de un existente producto con la siguiente informacion:
        | NombreDelProducto     | 265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres |
        And el usuario Administrador busca a el producto añadido usando "265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres" en el buscador por palabra clave
    Then ningun producto es encontrado en la busqueda realizada anteriormente

@iniciarSesion @eliminarProducto @Negativa
Scenario: Verificar que el campo de texto "Nombre Del Producto" controla que el valor minimo permitido es requerido cuando un producto existente es modificado
    Given el usuario Administrador añade un nuevo producto por con informacion por defecto
        And el usuario Administrador navega a la pagina Productos
        And el usuario Administrador selecciona la opcion Editar para el producto añadido en la pagina productos
    When el usuario Administrador edita la informacion de un existente producto con la siguiente informacion:
        | NombreDelProducto     |                       |
    Then el mensage de error "This is a required field." es mostrado en la en el formulario de la pagina Nuevo Producto

@iniciarSesion @eliminarProducto @Dominio
Scenario: Verificar que un producto existente es modificado con valor maximo permitido para el campo de texto "SKU"
    Given el usuario Administrador añade un nuevo producto por con informacion por defecto
        And el usuario Administrador navega a la pagina Productos
        And el usuario Administrador selecciona la opcion Editar para el producto añadido en la pagina productos
    When el usuario Administrador edita la informacion de un existente producto con la siguiente informacion:
        | SKU                   | <RandomValue,64>      |
    Then el mensage exitoso "You saved the product." es mostrado en la parte superior de la pagina Productos

@iniciarSesion @eliminarProducto @Dominio
Scenario: Verificar que un producto existente es modificado con valor minimo permitido para el campo de texto "SKU"
    Given el usuario Administrador añade un nuevo producto por con informacion por defecto
        And el usuario Administrador navega a la pagina Productos
        And el usuario Administrador selecciona la opcion Editar para el producto añadido en la pagina productos
    When el usuario Administrador edita la informacion de un existente producto con la siguiente informacion:
        | SKU                   | <RandomValue,1>       |
    Then el mensage exitoso "You saved the product." es mostrado en la parte superior de la pagina Productos

@iniciarSesion @eliminarProducto @Dominio
Scenario: Verificar que el campo de texto "SKU" controla el valor maximo permitido cuando un producto existente es modificado
    Given el usuario Administrador añade un nuevo producto por con informacion por defecto
        And el usuario Administrador navega a la pagina Productos
        And el usuario Administrador selecciona la opcion Editar para el producto añadido en la pagina productos
    When el usuario Administrador edita la informacion de un existente producto con la siguiente informacion:
        | SKU                   | 77catacteres_77catacteres_77catacteres_77caracteres_77caracteres_77caracteres |
    Then el mensage de error "Please enter less or equal than 64 symbols." es mostrado en la en el formulario de la pagina Nuevo Producto

@iniciarSesion @eliminarProducto @Negativa
Scenario: Verificar que el campo de texto "SKU" controla que el valor minimo permitido es requerido cuando un producto existente es modificado
    Given el usuario Administrador añade un nuevo producto por con informacion por defecto
        And el usuario Administrador navega a la pagina Productos
        And el usuario Administrador selecciona la opcion Editar para el producto añadido en la pagina productos
    When el usuario Administrador edita la informacion de un existente producto con la siguiente informacion:
        | SKU                   |                       |
    Then el mensage de error "This is a required field." es mostrado en la en el formulario de la pagina Nuevo Producto

@iniciarSesion @eliminarProducto @Dominio
Scenario: Verificar que un producto existente es modificado con valor maximo permitido para el campo de texto "Precio"
    Given el usuario Administrador añade un nuevo producto por con informacion por defecto
        And el usuario Administrador navega a la pagina Productos
        And el usuario Administrador selecciona la opcion Editar para el producto añadido en la pagina productos
    When el usuario Administrador edita la informacion de un existente producto con la siguiente informacion:
        | Precio                | <RandomNumber,1>      |
    Then el mensage exitoso "You saved the product." es mostrado en la parte superior de la pagina Productos

@iniciarSesion @eliminarProducto @Dominio
Scenario: Verificar que un producto existente es modificado con valor minimo permitido para el campo de texto "Precio"
    Given el usuario Administrador añade un nuevo producto por con informacion por defecto
        And el usuario Administrador navega a la pagina Productos
        And el usuario Administrador selecciona la opcion Editar para el producto añadido en la pagina productos
    When el usuario Administrador edita la informacion de un existente producto con la siguiente informacion:
        | Precio                | <RandomNumber,12>     |
    Then el mensage exitoso "You saved the product." es mostrado en la parte superior de la pagina Productos

@iniciarSesion @eliminarProducto @Negativa
Scenario: Verificar que el campo de texto "Precio" controla que el valor minimo permitido es requerido cuando un producto existente es modificado
    Given el usuario Administrador añade un nuevo producto por con informacion por defecto
        And el usuario Administrador navega a la pagina Productos
        And el usuario Administrador selecciona la opcion Editar para el producto añadido en la pagina productos
    When el usuario Administrador edita la informacion de un existente producto con la siguiente informacion:
        | Precio                |                       |
    Then el mensage de error "This is a required field." es mostrado en la en el formulario de la pagina Nuevo Producto

@iniciarSesion @eliminarProducto @Negativa
Scenario: Verificar que el campo de texto "Precio" no permite valores de tipo texto cuando un producto existente es modificado
    Given el usuario Administrador añade un nuevo producto por con informacion por defecto
        And el usuario Administrador navega a la pagina Productos
        And el usuario Administrador selecciona la opcion Editar para el producto añadido en la pagina productos
    When el usuario Administrador edita la informacion de un existente producto con la siguiente informacion:
        | Precio                | S                     |
    Then el mensage de error "Please enter a number 0 or greater in this field." es mostrado en la en el formulario de la pagina Nuevo Producto

@iniciarSesion @eliminarProducto @Negativa
Scenario: Verificar que el campo de texto "Precio" no permite valores de tipo simbolo cuando un producto existente es modificado
    Given el usuario Administrador añade un nuevo producto por con informacion por defecto
        And el usuario Administrador navega a la pagina Productos
        And el usuario Administrador selecciona la opcion Editar para el producto añadido en la pagina productos
    When el usuario Administrador edita la informacion de un existente producto con la siguiente informacion:
        | Precio                | $                     |
    Then el mensage de error "Please enter a number 0 or greater in this field." es mostrado en la en el formulario de la pagina Nuevo Producto

@iniciarSesion @eliminarProducto @Dominio
Scenario: Verificar que un producto existente es modificado con valor maximo permitido para el campo de texto "Cantidad"
    Given el usuario Administrador añade un nuevo producto por con informacion por defecto
        And el usuario Administrador navega a la pagina Productos
        And el usuario Administrador selecciona la opcion Editar para el producto añadido en la pagina productos
    When el usuario Administrador edita la informacion de un existente producto con la siguiente informacion:
        | Cantidad              | <RandomNumber,8>      |
    Then el mensage exitoso "You saved the product." es mostrado en la parte superior de la pagina Productos

@iniciarSesion @eliminarProducto @Dominio
Scenario: Verificar que un producto existente es modificado con valor minimo permitido para el campo de texto "Cantidad"
    Given el usuario Administrador añade un nuevo producto por con informacion por defecto
        And el usuario Administrador navega a la pagina Productos
        And el usuario Administrador selecciona la opcion Editar para el producto añadido en la pagina productos
    When el usuario Administrador edita la informacion de un existente producto con la siguiente informacion:
        | Cantidad              |                       |
    Then el mensage exitoso "You saved the product." es mostrado en la parte superior de la pagina Productos

@iniciarSesion @eliminarProducto @Negativa
Scenario: Verificar que el campo de texto "Cantidad" no permite valores de tipo texto cuando un producto existente es modificado
    Given el usuario Administrador añade un nuevo producto por con informacion por defecto
        And el usuario Administrador navega a la pagina Productos
        And el usuario Administrador selecciona la opcion Editar para el producto añadido en la pagina productos
    When el usuario Administrador edita la informacion de un existente producto con la siguiente informacion:
        | Cantidad              | S                     |
    Then el mensage de error "Please enter a valid number in this field." es mostrado en la en el formulario de la pagina Nuevo Producto

@iniciarSesion @eliminarProducto @Negativa
Scenario: Verificar que el campo de texto "Cantidad" no permite valores de tipo simbolo cuando un producto existente es modificado
    Given el usuario Administrador añade un nuevo producto por con informacion por defecto
        And el usuario Administrador navega a la pagina Productos
        And el usuario Administrador selecciona la opcion Editar para el producto añadido en la pagina productos
    When el usuario Administrador edita la informacion de un existente producto con la siguiente informacion:
        | Cantidad              | #                     |
    Then el mensage de error "Please enter a valid number in this field." es mostrado en la en el formulario de la pagina Nuevo Producto

@iniciarSesion @eliminarProducto @Dominio
Scenario: Verificar que un producto existente es modificado con valor maximo permitido para el campo de texto "Peso"
    Given el usuario Administrador añade un nuevo producto por con informacion por defecto
        And el usuario Administrador navega a la pagina Productos
        And el usuario Administrador selecciona la opcion Editar para el producto añadido en la pagina productos
    When el usuario Administrador edita la informacion de un existente producto con la siguiente informacion:
        | Peso                  | <RandomNumber,15>     |
    Then el mensage exitoso "You saved the product." es mostrado en la parte superior de la pagina Productos

@iniciarSesion @eliminarProducto @Dominio
Scenario: Verificar que un producto existente es modificado con valor minimo permitido para el campo de texto "Peso"
    Given el usuario Administrador añade un nuevo producto por con informacion por defecto
        And el usuario Administrador navega a la pagina Productos
        And el usuario Administrador selecciona la opcion Editar para el producto añadido en la pagina productos
    When el usuario Administrador edita la informacion de un existente producto con la siguiente informacion:
        | Peso                  |                       |
    Then el mensage exitoso "You saved the product." es mostrado en la parte superior de la pagina Productos

@iniciarSesion @eliminarProducto @Negativa
Scenario: Verificar que el campo de texto "Peso" no permite valores de tipo texto cuando producto existente es modificado
    Given el usuario Administrador añade un nuevo producto por con informacion por defecto
        And el usuario Administrador navega a la pagina Productos
        And el usuario Administrador selecciona la opcion Editar para el producto añadido en la pagina productos
    When el usuario Administrador edita la informacion de un existente producto con la siguiente informacion:
        | Peso                  | S                     |
    Then el mensage de error "Please enter a number 0 or greater in this field." es mostrado en la en el formulario de la pagina Nuevo Producto

@iniciarSesion @eliminarProducto @Negativa
Scenario: Verificar que el campo de texto "Peso" no permite valores de tipo simbolo cuando producto existente es modificado
    Given el usuario Administrador añade un nuevo producto por con informacion por defecto
        And el usuario Administrador navega a la pagina Productos
        And el usuario Administrador selecciona la opcion Editar para el producto añadido en la pagina productos
    When el usuario Administrador edita la informacion de un existente producto con la siguiente informacion:
        | Peso                  | %                     |
    Then el mensage de error "Please enter a number 0 or greater in this field." es mostrado en la en el formulario de la pagina Nuevo Producto
