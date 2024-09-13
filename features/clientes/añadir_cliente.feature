@ui @clientes
Feature: Añadir Cliente

@iniciarSesion @eliminarCliente @Funcionalidad
Scenario: Verificar que un nuevo cliente es añadido llenado el formulario con valores validos
    Given el usuario Administrador navega a la pagina Clientes
    When el usuario Administrador añade un nuevo cliente con la siguiente informacion:
        | PrefijoDelNombre                  | <RandomValue,5>  |
        | Nombre                            | <RandomValue,10> |
        | SegundoNombre                     | <RandomValue,10> |
        | Apellido                          | <RandomValue,10> |
        | SufijoDelNombre                   | <RandomValue,5>  |
        | CorreoElectronico                 | <RandomEmail,15> |
        | FechaDeNacimiento                 | 12/12/2012       |
        | Genero                            | Masculino        | 
    Then el mensage exitoso "You saved the customer." es mostrado en la parte superior de la pagina Clientes

@iniciarSesion @eliminarCliente @Dominio
Scenario: Verificar que un nuevo cliente es añadido con valor maximo permitido para el campo de texto "Prefijo del nombre"
    Given el usuario Administrador navega a la pagina Clientes
    When el usuario Administrador añade un nuevo cliente con la siguiente informacion:
        | PrefijoDelNombre                  | <RandomValue,40> |
        | Nombre                            | <RandomValue,10> |
        | Apellido                          | <RandomValue,10> |
        | CorreoElectronico                 | <RandomEmail,15> |
    Then el mensage exitoso "You saved the customer." es mostrado en la parte superior de la pagina Clientes

@iniciarSesion @eliminarCliente @Dominio
Scenario: Verificar que un nuevo cliente es añadido con valor minimo permitido para el campo de texto "Prefijo del nombre"
    Given el usuario Administrador navega a la pagina Clientes
    When el usuario Administrador añade un nuevo cliente con la siguiente informacion:
        | PrefijoDelNombre                  |                  |
        | Nombre                            | <RandomValue,10> |
        | Apellido                          | <RandomValue,10> |
        | CorreoElectronico                 | <RandomEmail,15> |
    Then el mensage exitoso "You saved the customer." es mostrado en la parte superior de la pagina Clientes
    
@iniciarSesion @eliminarCliente @Dominio
Scenario: Verificar que el campo de texto "Prefijo del nombre" controla el valor maximo permitido cuando un nuevo cliente es añadido
    Given el usuario Administrador navega a la pagina Clientes
    When el usuario Administrador añade un nuevo cliente con la siguiente informacion:
        | PrefijoDelNombre                  | 51catacteres_51catacteres_51catacteres_51caracteres |
        | Nombre                            | <RandomValue,10> |
        | Apellido                          | <RandomValue,10> |
        | CorreoElectronico                 | <RandomEmail,15> |
        And el usuario Administrador busca a el cliente añadido usando "51catacteres_51catacteres_51catacteres_51caracteres" en el buscador por palabra clave
    Then ningun cliente es encontrado en la busqueda realizada anteriormente
    
@iniciarSesion @eliminarCliente @Dominio
Scenario: Verificar que un nuevo cliente es añadido con valor maximo permitido para el campo de texto "Nombre"
    Given el usuario Administrador navega a la pagina Clientes
    When el usuario Administrador añade un nuevo cliente con la siguiente informacion:
        | Nombre                            | <RandomValue,255> |
        | Apellido                          | <RandomValue,10>  |
        | CorreoElectronico                 | <RandomEmail,15>  |
    Then el mensage exitoso "You saved the customer." es mostrado en la parte superior de la pagina Clientes

@iniciarSesion @eliminarCliente @Dominio
Scenario: Verificar que un nuevo cliente es añadido con valor minimo permitido para el campo de texto "Nombre"
    Given el usuario Administrador navega a la pagina Clientes
    When el usuario Administrador añade un nuevo cliente con la siguiente informacion:
        | Nombre                            | <RandomValue,1>  |
        | Apellido                          | <RandomValue,10> |
        | CorreoElectronico                 | <RandomEmail,15> |
    Then el mensage exitoso "You saved the customer." es mostrado en la parte superior de la pagina Clientes

@iniciarSesion @eliminarCliente @Dominio
Scenario: Verificar que el campo de texto "Nombre" controla el valor maximo permitido cuando un nuevo cliente es añadido
    Given el usuario Administrador navega a la pagina Clientes
    When el usuario Administrador añade un nuevo cliente con la siguiente informacion:
        | Nombre                            | 265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres |
        | Apellido                          | <RandomValue,10> |
        | CorreoElectronico                 | <RandomEmail,15> |
        And el usuario Administrador busca a el cliente añadido usando "265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres" en el buscador por palabra clave
    Then ningun cliente es encontrado en la busqueda realizada anteriormente

@iniciarSesion @eliminarCliente @Negativa
Scenario: Verificar que el campo de texto "Nombre" controla que el valor minimo permitido es requerido cuando nuevo cliente es añadido
    Given el usuario Administrador navega a la pagina Clientes
    When el usuario Administrador añade un nuevo cliente con la siguiente informacion:
        | Nombre                            |                  |
        | Apellido                          | <RandomValue,10> |
        | CorreoElectronico                 | <RandomEmail,15> |
    Then el mensage de error "This is a required field." es mostrado en la en el formulario de la pagina Nuevo Cliente

@iniciarSesion @eliminarCliente @Dominio
Scenario: Verificar que un nuevo cliente es añadido con valor maximo permitido para el campo de texto "Segundo nombre"
    Given el usuario Administrador navega a la pagina Clientes
    When el usuario Administrador añade un nuevo cliente con la siguiente informacion:
        | SegundoNombre                     | <RandomValue,255> |
        | Apellido                          | <RandomValue,10>  |
        | Nombre                            | <RandomValue,10>  |
        | CorreoElectronico                 | <RandomEmail,15>  |
    Then el mensage exitoso "You saved the customer." es mostrado en la parte superior de la pagina Clientes

@iniciarSesion @eliminarCliente @Dominio
Scenario: Verificar que un nuevo cliente es añadido con valor minimo permitido para el campo de texto "Segundo nombre"
    Given el usuario Administrador navega a la pagina Clientes
    When el usuario Administrador añade un nuevo cliente con la siguiente informacion:
        | SegundoNombre                     |                  |
        | Apellido                          | <RandomValue,10> |
        | Nombre                            | <RandomValue,10> |
        | CorreoElectronico                 | <RandomEmail,15> |
    Then el mensage exitoso "You saved the customer." es mostrado en la parte superior de la pagina Clientes
    
@iniciarSesion @eliminarCliente @Dominio
Scenario: Verificar que el campo de texto "Segundo nombre" controla el valor maximo permitido cuando un nuevo cliente es añadido
    Given el usuario Administrador navega a la pagina Clientes
    When el usuario Administrador añade un nuevo cliente con la siguiente informacion:
        | SegundoNombre                     | 265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres |
        | Nombre                            | <RandomValue,10> |
        | Apellido                          | <RandomValue,10> |
        | CorreoElectronico                 | <RandomEmail,15> |
        And el usuario Administrador busca a el cliente añadido usando "265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres" en el buscador por palabra clave
    Then ningun cliente es encontrado en la busqueda realizada anteriormente
    
@iniciarSesion @eliminarCliente @Dominio
Scenario: Verificar que un nuevo cliente es añadido con valor maximo permitido para el campo de texto "Apellido"
    Given el usuario Administrador navega a la pagina Clientes
    When el usuario Administrador añade un nuevo cliente con la siguiente informacion:
        | Apellido                          | <RandomValue,255> |
        | Nombre                            | <RandomValue,10>  |
        | CorreoElectronico                 | <RandomEmail,15>  |
    Then el mensage exitoso "You saved the customer." es mostrado en la parte superior de la pagina Clientes

@iniciarSesion @eliminarCliente @Dominio
Scenario: Verificar que un nuevo cliente es añadido con valor minimo permitido para el campo de texto "Apellido"
    Given el usuario Administrador navega a la pagina Clientes
    When el usuario Administrador añade un nuevo cliente con la siguiente informacion:
        | Apellido                          | <RandomValue,1>  |
        | Nombre                            | <RandomValue,10> |
        | CorreoElectronico                 | <RandomEmail,15> |
    Then el mensage exitoso "You saved the customer." es mostrado en la parte superior de la pagina Clientes

@iniciarSesion @eliminarCliente @Dominio
Scenario: Verificar que el campo de texto "Apellido" controla el valor maximo permitido cuando un nuevo cliente es añadido
    Given el usuario Administrador navega a la pagina Clientes
    When el usuario Administrador añade un nuevo cliente con la siguiente informacion:
        | Apellido                          | 265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres |
        | Nombre                            | <RandomValue,10> |
        | CorreoElectronico                 | <RandomEmail,15> |
        And el usuario Administrador busca a el cliente añadido usando "265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres_265caracteres" en el buscador por palabra clave
    Then ningun cliente es encontrado en la busqueda realizada anteriormente

@iniciarSesion @eliminarCliente @Negativa
Scenario: Verificar que el campo de texto "Apellido" controla que el valor minimo permitido es requerido cuando nuevo cliente es añadido
    Given el usuario Administrador navega a la pagina Clientes
    When el usuario Administrador añade un nuevo cliente con la siguiente informacion:
        | Apellido                          |                  |
        | Nombre                            | <RandomValue,10> |
        | CorreoElectronico                 | <RandomEmail,15> |
    Then el mensage de error "This is a required field." es mostrado en la en el formulario de la pagina Nuevo Cliente

@iniciarSesion @eliminarCliente @Dominio
Scenario: Verificar que un nuevo cliente es añadido con valor maximo permitido para el campo de texto "Sufijo del nombre"
    Given el usuario Administrador navega a la pagina Clientes
    When el usuario Administrador añade un nuevo cliente con la siguiente informacion:
        | SufijoDelNombre                   | <RandomValue,40> |
        | Nombre                            | <RandomValue,10> |
        | Apellido                          | <RandomValue,10> |
        | CorreoElectronico                 | <RandomEmail,15> |
    Then el mensage exitoso "You saved the customer." es mostrado en la parte superior de la pagina Clientes

@iniciarSesion @eliminarCliente @Dominio
Scenario: Verificar que un nuevo cliente es añadido con valor minimo permitido para el campo de texto "Sufijo del nombre"
    Given el usuario Administrador navega a la pagina Clientes
    When el usuario Administrador añade un nuevo cliente con la siguiente informacion:
        | SufijoDelNombre                   |                  |
        | Nombre                            | <RandomValue,10> |
        | Apellido                          | <RandomValue,10> |
        | CorreoElectronico                 | <RandomEmail,15> |
    Then el mensage exitoso "You saved the customer." es mostrado en la parte superior de la pagina Clientes

@iniciarSesion @eliminarCliente @Dominio
Scenario: Verificar que el campo de texto "Prefijo del nombre" controla el valor maximo permitido cuando un nuevo cliente es añadido
    Given el usuario Administrador navega a la pagina Clientes
    When el usuario Administrador añade un nuevo cliente con la siguiente informacion:
        | SufijoDelNombre                   | 51catacteres_51catacteres_51catacteres_51caracteres |
        | Nombre                            | <RandomValue,10> |
        | Apellido                          | <RandomValue,10> |
        | CorreoElectronico                 | <RandomEmail,15> |
        And el usuario Administrador busca a el cliente añadido usando "51catacteres_51catacteres_51catacteres_51caracteres" en el buscador por palabra clave
    Then ningun cliente es encontrado en la busqueda realizada anteriormente

@iniciarSesion @eliminarCliente @Dominio
Scenario: Verificar que un nuevo cliente es añadido con valor maximo permitido para el campo de texto "Correo electrónico"
    Given el usuario Administrador navega a la pagina Clientes
    When el usuario Administrador añade un nuevo cliente con la siguiente informacion:
        | CorreoElectronico                 | <RandomEmail,69> |
        | Apellido                          | <RandomValue,5>  |
        | Nombre                            | <RandomValue,5>  |
    Then el mensage exitoso "You saved the customer." es mostrado en la parte superior de la pagina Clientes

@iniciarSesion @eliminarCliente @Dominio
Scenario: Verificar que un nuevo cliente es añadido con valor minimo permitido para el campo de texto "Correo electrónico"
    Given el usuario Administrador navega a la pagina Clientes
    When el usuario Administrador añade un nuevo cliente con la siguiente informacion:
        | CorreoElectronico                 | <RandomEmail,6> |
        | Apellido                          | <RandomValue,5> |
        | Nombre                            | <RandomValue,5> |
    Then el mensage exitoso "You saved the customer." es mostrado en la parte superior de la pagina Clientes

@iniciarSesion @eliminarCliente @Negativa
Scenario: Verificar que el campo de texto "Correo electrónico" controla el valor maximo permitido cuando un nuevo cliente es añadido
    Given el usuario Administrador navega a la pagina Clientes
    When el usuario Administrador añade un nuevo cliente con la siguiente informacion:
        | CorreoElectronico                 | correo_electronico_de_76_caracteres_correo_electronico_de_76_caracteres@x.co |
        | Nombre                            | <RandomValue,10> |
        | Apellido                          | <RandomEmail,15> |
    Then el mensage de error "'Email' uses too many characters." es mostrado en la parte superior de la pagina Clientes

@iniciarSesion @eliminarCliente @Negativa
Scenario: Verificar que el campo de texto "Correo electrónico" controla que el valor minimo permitido es requerido cuando nuevo cliente es añadido
    Given el usuario Administrador navega a la pagina Clientes
    When el usuario Administrador añade un nuevo cliente con la siguiente informacion:
        | CorreoElectronico                 |                  |
        | Nombre                            | <RandomValue,10> |
        | Apellido                          | <RandomEmail,15> |
    Then el mensage de error "This is a required field." es mostrado en la en el formulario de la pagina Nuevo Cliente

@iniciarSesion @eliminarCliente @Dominio
Scenario: Verificar que un nuevo cliente es añadido con valor maximo permitido para el campo de texto "Numero De Impuesto"
    Given el usuario Administrador navega a la pagina Clientes
    When el usuario Administrador añade un nuevo cliente con la siguiente informacion:
        | NumeroDeImpuesto                  | <RandomValue,40> |
        | CorreoElectronico                 | <RandomEmail,10> |
        | Apellido                          | <RandomValue,5>  |
        | Nombre                            | <RandomValue,5>  |
    Then el mensage exitoso "You saved the customer." es mostrado en la parte superior de la pagina Clientes

@iniciarSesion @eliminarCliente @Dominio
Scenario: Verificar que un nuevo cliente es añadido con valor minimo permitido para el campo de texto "Numero De Impuesto"
    Given el usuario Administrador navega a la pagina Clientes
    When el usuario Administrador añade un nuevo cliente con la siguiente informacion:
        | NumeroDeImpuesto                  |                  |
        | CorreoElectronico                 | <RandomEmail,10> |
        | Apellido                          | <RandomValue,5>  |
        | Nombre                            | <RandomValue,5>  |
    Then el mensage exitoso "You saved the customer." es mostrado en la parte superior de la pagina Clientes

@iniciarSesion @eliminarCliente @Dominio
Scenario: Verificar que el campo de texto "Numero De Impuesto" controla el valor maximo permitido cuando un nuevo cliente es añadido
    Given el usuario Administrador navega a la pagina Clientes
    When el usuario Administrador añade un nuevo cliente con la siguiente informacion:
        | NumeroDeImpuesto                  | 51catacteres_51catacteres_51catacteres_51caracteres |
        | Nombre                            | <RandomValue,10> |
        | Apellido                          | <RandomValue,10> |
        | CorreoElectronico                 | <RandomEmail,15> |
        And el usuario Administrador busca a el cliente añadido usando "51catacteres_51catacteres_51catacteres_51caracteres" en el buscador por palabra clave
    Then ningun cliente es encontrado en la busqueda realizada anteriormente

@iniciarSesion @eliminarCliente @Negativa
Scenario: Verificar que el campo de texto "Fecha de nacimiento" controla el valor valido para el Mes de nacimiento cuando nuevo cliente es añadido
    Given el usuario Administrador navega a la pagina Clientes
    When el usuario Administrador añade un nuevo cliente con la siguiente informacion:
        | CorreoElectronico                 | <RandomEmail,10> |
        | Nombre                            | <RandomValue,10> |
        | Apellido                          | <RandomEmail,15> |
        | FechaDeNacimiento                 | 35/12/2012       |
    Then el mensage de error "Please enter a valid date." es mostrado en la en el formulario de la pagina Nuevo Cliente

@iniciarSesion @eliminarCliente @Negativa
Scenario: Verificar que el campo de texto "Fecha de nacimiento" controla el valor valido para el Dia de nacimiento cuando nuevo cliente es añadido
    Given el usuario Administrador navega a la pagina Clientes
    When el usuario Administrador añade un nuevo cliente con la siguiente informacion:
        | CorreoElectronico                 | <RandomEmail,10> |
        | Nombre                            | <RandomValue,10> |
        | Apellido                          | <RandomEmail,15> |
        | FechaDeNacimiento                 | 9/35/2012        |
    Then el mensage de error "Please enter a valid date." es mostrado en la en el formulario de la pagina Nuevo Cliente

@iniciarSesion @eliminarCliente @Dominio
Scenario: Verificar que la ventana calendario de el campo de texto "Fecha de nacimiento" controla el valor minimo de fecha de nacimiento cuando nuevo cliente es añadido
    Given el usuario Administrador navega a la pagina Clientes
    When el usuario Administrador añade un nuevo cliente con la siguiente informacion:
        | CorreoElectronico                 | <RandomEmail,10> |
        | Nombre                            | <RandomValue,10> |
        | Apellido                          | <RandomEmail,15> |
        | FechaDeNacimiento                 | <FirstSelectableDayOfCalendarPopup> |
        And el usuario Administrador busca a el cliente añadido con el buscador por palabra clave
    Then el nuevo cliente es mostrado en la tabla de clientes con la siguiente informacion:
        | FechaDeNacimiento                 | 01/1/1924        |

@iniciarSesion @eliminarCliente @Dominio
Scenario: Verificar que la ventana calendario de el campo de texto "Fecha de nacimiento" controla el valor maximo de fecha de nacimiento cuando nuevo cliente es añadido
    Given el usuario Administrador navega a la pagina Clientes
    When el usuario Administrador añade un nuevo cliente con la siguiente informacion:
        | CorreoElectronico                 | <RandomEmail,10> |
        | Nombre                            | <RandomValue,10> |
        | Apellido                          | <RandomEmail,15> |
        | FechaDeNacimiento                 | <LastSelectableDayOfCalendarPopup> |
        And el usuario Administrador busca a el cliente añadido con el buscador por palabra clave
    Then el nuevo cliente es mostrado en la tabla de clientes con la siguiente informacion:
        | FechaDeNacimiento                 | <Today>          |
