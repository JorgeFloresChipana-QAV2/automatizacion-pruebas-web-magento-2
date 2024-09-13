@ui @clientes
Feature: Editar Cliente

@iniciarSesion @eliminarCliente @Funcionalidad
Scenario: Verificar que todos los campos de un cliente existente es modificado
    Given el usuario Administrador añade un nuevo cliente por con informacion por defecto
        And el usuario Administrador navega a la pagina Clientes
        And el usuario Administrador selecciona la opcion Editar para el cliente añadido en la pagina Clientes
    When el usuario Administrador edita la informacion de un existente cliente con la siguiente informacion:
        | PrefijoDelNombre                  | <RandomValue,5>  |
        | Nombre                            | <RandomValue,10> |
        | SegundoNombre                     | <RandomValue,10> |
        | Apellido                          | <RandomValue,10> |
        | SufijoDelNombre                   | <RandomValue,5>  |
        | CorreoElectronico                 | <RandomEmail,15> |
        | FechaDeNacimiento                 | 12/12/2010       |
        | Genero                            | Femenino         |
    Then el mensage exitoso "You saved the customer." es mostrado en la parte superior de la pagina Clientes

@iniciarSesion @eliminarCliente @Funcionalidad
Scenario: Verificar que la informacion de 'Prefijo Del Nombre' de un cliente existente es modificado
    Given el usuario Administrador añade un nuevo cliente por con informacion por defecto
        And el usuario Administrador navega a la pagina Clientes
        And el usuario Administrador selecciona la opcion Editar para el cliente añadido en la pagina Clientes
    When el usuario Administrador edita la informacion de un existente cliente con la siguiente informacion:
        | PrefijoDelNombre                  | VIP |
    Then el mensage exitoso "You saved the customer." es mostrado en la parte superior de la pagina Clientes

@iniciarSesion @eliminarCliente @Funcionalidad
Scenario: Verificar que la informacion de 'Nombre' de un cliente existente es modificado
    Given el usuario Administrador añade un nuevo cliente por con informacion por defecto
        And el usuario Administrador navega a la pagina Clientes
        And el usuario Administrador selecciona la opcion Editar para el cliente añadido en la pagina Clientes
    When el usuario Administrador edita la informacion de un existente cliente con la siguiente informacion:
        | Nombre                            | Cliente Actualizado   |
    Then el mensage exitoso "You saved the customer." es mostrado en la parte superior de la pagina Clientes

@iniciarSesion @eliminarCliente @Funcionalidad
Scenario: Verificar que la informacion de 'Segundo Nombre' de un cliente existente es modificado
    Given el usuario Administrador añade un nuevo cliente por con informacion por defecto
        And el usuario Administrador navega a la pagina Clientes
        And el usuario Administrador selecciona la opcion Editar para el cliente añadido en la pagina Clientes
    When el usuario Administrador edita la informacion de un existente cliente con la siguiente informacion:
        | SegundoNombre                     | No sabe su segundo nombre  |
    Then el mensage exitoso "You saved the customer." es mostrado en la parte superior de la pagina Clientes

@iniciarSesion @eliminarCliente @Funcionalidad
Scenario: Verificar que la informacion de 'Apellido' de un cliente existente es modificado
    Given el usuario Administrador añade un nuevo cliente por con informacion por defecto
        And el usuario Administrador navega a la pagina Clientes
        And el usuario Administrador selecciona la opcion Editar para el cliente añadido en la pagina Clientes
    When el usuario Administrador edita la informacion de un existente cliente con la siguiente informacion:
        | Apellido                          | Andornol |
    Then el mensage exitoso "You saved the customer." es mostrado en la parte superior de la pagina Clientes

@iniciarSesion @eliminarCliente @Funcionalidad
Scenario: Verificar que la informacion de 'Sufijo del Nombre' de un cliente existente es modificado
    Given el usuario Administrador añade un nuevo cliente por con informacion por defecto
        And el usuario Administrador navega a la pagina Clientes
        And el usuario Administrador selecciona la opcion Editar para el cliente añadido en la pagina Clientes
    When el usuario Administrador edita la informacion de un existente cliente con la siguiente informacion:
        | SufijoDelNombre                   | VIP                     |
    Then el mensage exitoso "You saved the customer." es mostrado en la parte superior de la pagina Clientes

@iniciarSesion @eliminarCliente @Funcionalidad
Scenario: Verificar que la informacion de 'Correo Electronico' de un cliente existente es modificado
    Given el usuario Administrador añade un nuevo cliente por con informacion por defecto
        And el usuario Administrador navega a la pagina Clientes
        And el usuario Administrador selecciona la opcion Editar para el cliente añadido en la pagina Clientes
    When el usuario Administrador edita la informacion de un existente cliente con la siguiente informacion:
        | CorreoElectronico                 | <RandomEmail,15>       |
    Then el mensage exitoso "You saved the customer." es mostrado en la parte superior de la pagina Clientes







@iniciarSesion @eliminarCliente @Dominio
Scenario: Verificar que un cliente existente es modificado con valor maximo permitido para el campo de texto "Prefijo del nombre"
    Given el usuario Administrador añade un nuevo cliente por con informacion por defecto
        And el usuario Administrador navega a la pagina Clientes
        And el usuario Administrador selecciona la opcion Editar para el cliente añadido en la pagina Clientes
    When el usuario Administrador edita la informacion de un existente cliente con la siguiente informacion:
        | PrefijoDelNombre                  | <RandomValue,40> |
    Then el mensage exitoso "You saved the customer." es mostrado en la parte superior de la pagina Clientes

@iniciarSesion @eliminarCliente @Dominio
Scenario: Verificar que un cliente existente es modificado con valor minimo permitido para el campo de texto "Prefijo del nombre"
    Given el usuario Administrador añade un nuevo cliente por con informacion por defecto
        And el usuario Administrador navega a la pagina Clientes
        And el usuario Administrador selecciona la opcion Editar para el cliente añadido en la pagina Clientes
    When el usuario Administrador edita la informacion de un existente cliente con la siguiente informacion:
        | PrefijoDelNombre                  |                  |
    Then el mensage exitoso "You saved the customer." es mostrado en la parte superior de la pagina Clientes
    
@iniciarSesion @eliminarCliente @Dominio
Scenario: Verificar que el campo de texto "Prefijo del nombre" controla el valor maximo permitido cuando un cliente existente es modificado
    Given el usuario Administrador añade un nuevo cliente por con informacion por defecto
        And el usuario Administrador navega a la pagina Clientes
        And el usuario Administrador selecciona la opcion Editar para el cliente añadido en la pagina Clientes
    When el usuario Administrador edita la informacion de un existente cliente con la siguiente informacion:
        | PrefijoDelNombre                  | 51catacteres_51catacteres_51catacteres_51caracteres |
        And el usuario Administrador busca a el cliente añadido usando "51catacteres_51catacteres_51catacteres_51caracteres" en el buscador por palabra clave
    Then ningun cliente es encontrado en la busqueda realizada anteriormente
    
@iniciarSesion @eliminarCliente @Dominio
Scenario: Verificar que un cliente existente es modificado con valor maximo permitido para el campo de texto "Nombre"
    Given el usuario Administrador añade un nuevo cliente por con informacion por defecto
        And el usuario Administrador navega a la pagina Clientes
        And el usuario Administrador selecciona la opcion Editar para el cliente añadido en la pagina Clientes
    When el usuario Administrador edita la informacion de un existente cliente con la siguiente informacion:
        | Nombre                            | <RandomValue,255> |
    Then el mensage exitoso "You saved the customer." es mostrado en la parte superior de la pagina Clientes

@iniciarSesion @eliminarCliente @Dominio
Scenario: Verificar que un cliente existente es modificado con valor minimo permitido para el campo de texto "Nombre"
    Given el usuario Administrador añade un nuevo cliente por con informacion por defecto
        And el usuario Administrador navega a la pagina Clientes
        And el usuario Administrador selecciona la opcion Editar para el cliente añadido en la pagina Clientes
    When el usuario Administrador edita la informacion de un existente cliente con la siguiente informacion:
        | Nombre                            | <RandomValue,1>  |
    Then el mensage exitoso "You saved the customer." es mostrado en la parte superior de la pagina Clientes

@iniciarSesion @eliminarCliente @Dominio
Scenario: Verificar que el campo de texto "Nombre" controla el valor maximo permitido cuando un cliente existente es modificado
    Given el usuario Administrador añade un nuevo cliente por con informacion por defecto
        And el usuario Administrador navega a la pagina Clientes
        And el usuario Administrador selecciona la opcion Editar para el cliente añadido en la pagina Clientes
    When el usuario Administrador edita la informacion de un existente cliente con la siguiente informacion:
        | Nombre                            | 265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres |
        And el usuario Administrador busca a el cliente añadido usando "265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres" en el buscador por palabra clave
    Then ningun cliente es encontrado en la busqueda realizada anteriormente

@iniciarSesion @eliminarCliente @Negativa
Scenario: Verificar que el campo de texto "Nombre" controla que el valor minimo permitido es requerido cuando un cliente existente es modificado
    Given el usuario Administrador añade un nuevo cliente por con informacion por defecto
        And el usuario Administrador navega a la pagina Clientes
        And el usuario Administrador selecciona la opcion Editar para el cliente añadido en la pagina Clientes
    When el usuario Administrador edita la informacion de un existente cliente con la siguiente informacion:
        | Nombre                            |                  |
    Then el mensage de error "This is a required field." es mostrado en la en el formulario de la pagina Nuevo Cliente

@iniciarSesion @eliminarCliente @Dominio
Scenario: Verificar que un cliente existente es modificado con valor maximo permitido para el campo de texto "Segundo nombre"
    Given el usuario Administrador añade un nuevo cliente por con informacion por defecto
        And el usuario Administrador navega a la pagina Clientes
        And el usuario Administrador selecciona la opcion Editar para el cliente añadido en la pagina Clientes
    When el usuario Administrador edita la informacion de un existente cliente con la siguiente informacion:
        | SegundoNombre                     | <RandomValue,255> |
    Then el mensage exitoso "You saved the customer." es mostrado en la parte superior de la pagina Clientes

@iniciarSesion @eliminarCliente @Dominio
Scenario: Verificar que un cliente existente es modificado con valor minimo permitido para el campo de texto "Segundo nombre"
    Given el usuario Administrador añade un nuevo cliente por con informacion por defecto
        And el usuario Administrador navega a la pagina Clientes
        And el usuario Administrador selecciona la opcion Editar para el cliente añadido en la pagina Clientes
    When el usuario Administrador edita la informacion de un existente cliente con la siguiente informacion:
        | SegundoNombre                     |                  |
    Then el mensage exitoso "You saved the customer." es mostrado en la parte superior de la pagina Clientes
    
@iniciarSesion @eliminarCliente @Dominio
Scenario: Verificar que el campo de texto "Segundo nombre" controla el valor maximo permitido cuando un cliente existente es modificado
    Given el usuario Administrador añade un nuevo cliente por con informacion por defecto
        And el usuario Administrador navega a la pagina Clientes
        And el usuario Administrador selecciona la opcion Editar para el cliente añadido en la pagina Clientes
    When el usuario Administrador edita la informacion de un existente cliente con la siguiente informacion:
        | SegundoNombre                     | 265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres |
        And el usuario Administrador busca a el cliente añadido usando "265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres" en el buscador por palabra clave
    Then ningun cliente es encontrado en la busqueda realizada anteriormente
    
@iniciarSesion @eliminarCliente @Dominio
Scenario: Verificar que un cliente existente es modificado con valor maximo permitido para el campo de texto "Apellido"
    Given el usuario Administrador añade un nuevo cliente por con informacion por defecto
        And el usuario Administrador navega a la pagina Clientes
        And el usuario Administrador selecciona la opcion Editar para el cliente añadido en la pagina Clientes
    When el usuario Administrador edita la informacion de un existente cliente con la siguiente informacion:
        | Apellido                          | <RandomValue,255> |
    Then el mensage exitoso "You saved the customer." es mostrado en la parte superior de la pagina Clientes

@iniciarSesion @eliminarCliente @Dominio
Scenario: Verificar que un cliente existente es modificado con valor minimo permitido para el campo de texto "Apellido"
    Given el usuario Administrador añade un nuevo cliente por con informacion por defecto
        And el usuario Administrador navega a la pagina Clientes
        And el usuario Administrador selecciona la opcion Editar para el cliente añadido en la pagina Clientes
    When el usuario Administrador edita la informacion de un existente cliente con la siguiente informacion:
        | Apellido                          | <RandomValue,1>  |
    Then el mensage exitoso "You saved the customer." es mostrado en la parte superior de la pagina Clientes

@iniciarSesion @eliminarCliente @Dominio
Scenario: Verificar que el campo de texto "Apellido" controla el valor maximo permitido cuando un cliente existente es modificado
    Given el usuario Administrador añade un nuevo cliente por con informacion por defecto
        And el usuario Administrador navega a la pagina Clientes
        And el usuario Administrador selecciona la opcion Editar para el cliente añadido en la pagina Clientes
    When el usuario Administrador edita la informacion de un existente cliente con la siguiente informacion:
        | Apellido                          | 265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres |
        And el usuario Administrador busca a el cliente añadido usando "265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres" en el buscador por palabra clave
    Then ningun cliente es encontrado en la busqueda realizada anteriormente

@iniciarSesion @eliminarCliente @Negativa
Scenario: Verificar que el campo de texto "Apellido" controla que el valor minimo permitido es requerido cuando un cliente existente es modificado
    Given el usuario Administrador añade un nuevo cliente por con informacion por defecto
        And el usuario Administrador navega a la pagina Clientes
        And el usuario Administrador selecciona la opcion Editar para el cliente añadido en la pagina Clientes
    When el usuario Administrador edita la informacion de un existente cliente con la siguiente informacion:
        | Apellido                          |                  |
    Then el mensage de error "This is a required field." es mostrado en la en el formulario de la pagina Nuevo Cliente

@iniciarSesion @eliminarCliente @Dominio
Scenario: Verificar que un cliente existente es modificado con valor maximo permitido para el campo de texto "Sufijo del nombre"
    Given el usuario Administrador añade un nuevo cliente por con informacion por defecto
        And el usuario Administrador navega a la pagina Clientes
        And el usuario Administrador selecciona la opcion Editar para el cliente añadido en la pagina Clientes
    When el usuario Administrador edita la informacion de un existente cliente con la siguiente informacion:
        | SufijoDelNombre                   | <RandomValue,40> |
    Then el mensage exitoso "You saved the customer." es mostrado en la parte superior de la pagina Clientes

@iniciarSesion @eliminarCliente @Dominio
Scenario: Verificar que un cliente existente es modificado con valor minimo permitido para el campo de texto "Sufijo del nombre"
    Given el usuario Administrador añade un nuevo cliente por con informacion por defecto
        And el usuario Administrador navega a la pagina Clientes
        And el usuario Administrador selecciona la opcion Editar para el cliente añadido en la pagina Clientes
    When el usuario Administrador edita la informacion de un existente cliente con la siguiente informacion:
        | SufijoDelNombre                   |                  |
    Then el mensage exitoso "You saved the customer." es mostrado en la parte superior de la pagina Clientes

@iniciarSesion @eliminarCliente @Dominio
Scenario: Verificar que el campo de texto "Prefijo del nombre" controla el valor maximo permitido cuando un cliente existente es modificado
    Given el usuario Administrador añade un nuevo cliente por con informacion por defecto
        And el usuario Administrador navega a la pagina Clientes
        And el usuario Administrador selecciona la opcion Editar para el cliente añadido en la pagina Clientes
    When el usuario Administrador edita la informacion de un existente cliente con la siguiente informacion:
        | SufijoDelNombre                   | 51catacteres_51catacteres_51catacteres_51caracteres |
        And el usuario Administrador busca a el cliente añadido usando "51catacteres_51catacteres_51catacteres_51caracteres" en el buscador por palabra clave
    Then ningun cliente es encontrado en la busqueda realizada anteriormente

@iniciarSesion @eliminarCliente @Dominio
Scenario: Verificar que un cliente existente es modificado con valor maximo permitido para el campo de texto "Correo electrónico"
    Given el usuario Administrador añade un nuevo cliente por con informacion por defecto
        And el usuario Administrador navega a la pagina Clientes
        And el usuario Administrador selecciona la opcion Editar para el cliente añadido en la pagina Clientes
    When el usuario Administrador edita la informacion de un existente cliente con la siguiente informacion:
        | CorreoElectronico                 | <RandomEmail,69> |
    Then el mensage exitoso "You saved the customer." es mostrado en la parte superior de la pagina Clientes

@iniciarSesion @eliminarCliente @Dominio
Scenario: Verificar que un cliente existente es modificado con valor minimo permitido para el campo de texto "Correo electrónico"
    Given el usuario Administrador añade un nuevo cliente por con informacion por defecto
        And el usuario Administrador navega a la pagina Clientes
        And el usuario Administrador selecciona la opcion Editar para el cliente añadido en la pagina Clientes
    When el usuario Administrador edita la informacion de un existente cliente con la siguiente informacion:
        | CorreoElectronico                 | <RandomEmail,6> |
    Then el mensage exitoso "You saved the customer." es mostrado en la parte superior de la pagina Clientes

@iniciarSesion @eliminarCliente @Negativa
Scenario: Verificar que el campo de texto "Correo electrónico" controla el valor maximo permitido cuando un cliente existente es modificado
    Given el usuario Administrador añade un nuevo cliente por con informacion por defecto
        And el usuario Administrador navega a la pagina Clientes
        And el usuario Administrador selecciona la opcion Editar para el cliente añadido en la pagina Clientes
    When el usuario Administrador edita la informacion de un existente cliente con la siguiente informacion:
        | CorreoElectronico                 | correo_electronico_de_76_caracteres_correo_electronico_de_76_caracteres@x.co |
    Then el mensage de error "'Email' uses too many characters." es mostrado en la parte superior de la pagina Clientes

@iniciarSesion @eliminarCliente @Negativa
Scenario: Verificar que el campo de texto "Correo electrónico" controla que el valor minimo permitido es requerido cuando un cliente existente es modificado
    Given el usuario Administrador añade un nuevo cliente por con informacion por defecto
        And el usuario Administrador navega a la pagina Clientes
        And el usuario Administrador selecciona la opcion Editar para el cliente añadido en la pagina Clientes
    When el usuario Administrador edita la informacion de un existente cliente con la siguiente informacion:
        | CorreoElectronico                 |                  |
    Then el mensage de error "This is a required field." es mostrado en la en el formulario de la pagina Nuevo Cliente

@iniciarSesion @eliminarCliente @Dominio
Scenario: Verificar que un cliente existente es modificado con valor maximo permitido para el campo de texto "Numero De Impuesto"
    Given el usuario Administrador añade un nuevo cliente por con informacion por defecto
        And el usuario Administrador navega a la pagina Clientes
        And el usuario Administrador selecciona la opcion Editar para el cliente añadido en la pagina Clientes
    When el usuario Administrador edita la informacion de un existente cliente con la siguiente informacion:
        | NumeroDeImpuesto                  | <RandomValue,40> |
    Then el mensage exitoso "You saved the customer." es mostrado en la parte superior de la pagina Clientes

@iniciarSesion @eliminarCliente @Dominio
Scenario: Verificar que un cliente existente es modificado con valor minimo permitido para el campo de texto "Numero De Impuesto"
    Given el usuario Administrador añade un nuevo cliente por con informacion por defecto
        And el usuario Administrador navega a la pagina Clientes
        And el usuario Administrador selecciona la opcion Editar para el cliente añadido en la pagina Clientes
    When el usuario Administrador edita la informacion de un existente cliente con la siguiente informacion:
        | NumeroDeImpuesto                  |                  |
    Then el mensage exitoso "You saved the customer." es mostrado en la parte superior de la pagina Clientes

@iniciarSesion @eliminarCliente @Dominio
Scenario: Verificar que el campo de texto "Numero De Impuesto" controla el valor maximo permitido cuando un cliente existente es modificado
    Given el usuario Administrador añade un nuevo cliente por con informacion por defecto
        And el usuario Administrador navega a la pagina Clientes
        And el usuario Administrador selecciona la opcion Editar para el cliente añadido en la pagina Clientes
    When el usuario Administrador edita la informacion de un existente cliente con la siguiente informacion:
        | NumeroDeImpuesto                  | 51catacteres_51catacteres_51catacteres_51caracteres |
        And el usuario Administrador busca a el cliente añadido usando "51catacteres_51catacteres_51catacteres_51caracteres" en el buscador por palabra clave
    Then ningun cliente es encontrado en la busqueda realizada anteriormente

@iniciarSesion @eliminarCliente @Negativa
Scenario: Verificar que el campo de texto "Fecha de nacimiento" controla el valor valido para el Mes de nacimiento cuando un cliente existente es modificado
    Given el usuario Administrador añade un nuevo cliente por con informacion por defecto
        And el usuario Administrador navega a la pagina Clientes
        And el usuario Administrador selecciona la opcion Editar para el cliente añadido en la pagina Clientes
    When el usuario Administrador edita la informacion de un existente cliente con la siguiente informacion:
        | FechaDeNacimiento                 | 35/12/2012       |
    Then el mensage de error "Please enter a valid date." es mostrado en la en el formulario de la pagina Nuevo Cliente

@iniciarSesion @eliminarCliente @Negativa
Scenario: Verificar que el campo de texto "Fecha de nacimiento" controla el valor valido para el Dia de nacimiento cuando un cliente existente es modificado
    Given el usuario Administrador añade un nuevo cliente por con informacion por defecto
        And el usuario Administrador navega a la pagina Clientes
        And el usuario Administrador selecciona la opcion Editar para el cliente añadido en la pagina Clientes
    When el usuario Administrador edita la informacion de un existente cliente con la siguiente informacion:
        | FechaDeNacimiento                 | 9/35/2012        |
    Then el mensage de error "Please enter a valid date." es mostrado en la en el formulario de la pagina Nuevo Cliente

@iniciarSesion @eliminarCliente @Dominio
Scenario: Verificar que la ventana calendario de el campo de texto "Fecha de nacimiento" controla el valor minimo de fecha de nacimiento cuando un cliente existente es modificado
    Given el usuario Administrador añade un nuevo cliente por con informacion por defecto
        And el usuario Administrador navega a la pagina Clientes
        And el usuario Administrador selecciona la opcion Editar para el cliente añadido en la pagina Clientes
    When el usuario Administrador edita la informacion de un existente cliente con la siguiente informacion:
        | FechaDeNacimiento                 | <FirstSelectableDayOfCalendarPopup> |
        And el usuario Administrador busca a el cliente añadido con el buscador por palabra clave
    Then el nuevo cliente es mostrado en la tabla de clientes con la siguiente informacion:
        | FechaDeNacimiento                 | 01/1/1924        |

@iniciarSesion @eliminarCliente @Dominio
Scenario: Verificar que la ventana calendario de el campo de texto "Fecha de nacimiento" controla el valor maximo de fecha de nacimiento cuando un cliente existente es modificado
    Given el usuario Administrador añade un nuevo cliente por con informacion por defecto
        And el usuario Administrador navega a la pagina Clientes
        And el usuario Administrador selecciona la opcion Editar para el cliente añadido en la pagina Clientes
    When el usuario Administrador edita la informacion de un existente cliente con la siguiente informacion:
        | FechaDeNacimiento                 | <LastSelectableDayOfCalendarPopup> |
        And el usuario Administrador busca a el cliente añadido con el buscador por palabra clave
    Then el nuevo cliente es mostrado en la tabla de clientes con la siguiente informacion:
        | FechaDeNacimiento                 | <Today>          |
