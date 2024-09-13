@ui
Feature: Añadir Cliente

@login @eliminarCliente @Funcionalidad
Scenario: Verificar que un nuevo cliente es añadido
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
