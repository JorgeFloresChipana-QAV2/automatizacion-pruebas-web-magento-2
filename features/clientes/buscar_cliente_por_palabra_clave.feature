@ui
Feature: Buscar Cliente por palabra clave

@login @eliminarCliente @Funcionalidad
Scenario: Verificar que el nuevo cliente es encontrado usando el buscador por palabra clave
    Given el usuario Administrador añade un nuevo cliente por con informacion por defecto
        And el usuario Administrador navega a la pagina Clientes
    When el usuario Administrador busca a el cliente añadido con el buscador por palabra clave
    Then el nuevo cliente es mostrado en la tabla de clientes con la siguiente informacion:
        | PrefijoDelNombre                  | Test_PDN          |
        | Nombre                            | Test_N            |
        | SegundoNombre                     | Test_SN           |
        | Apellido                          | Test_A            |
        | SufijoDelNombre                   | Test_SDN          |
        | CorreoElectronico                 | <RandomEmail,15>  |
        | Genero                            | Male              | 
