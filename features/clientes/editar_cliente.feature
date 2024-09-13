@ui
Feature: Editar Cliente

@login @eliminarCliente @Funcionalidad
Scenario: Verificar que todos los campos de un cliente existen es modificado
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
