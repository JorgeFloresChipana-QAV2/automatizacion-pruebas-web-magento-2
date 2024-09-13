@ui @clientes
Feature: Buscar Cliente por palabra clave

@iniciarSesion @eliminarCliente @Funcionalidad
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

@iniciarSesion @eliminarCliente @Funcionalidad
Scenario: Verificar que el nuevo cliente es encontrado usando "Prefijo Del Nombre" en el buscador por palabra clave
    Given el usuario Administrador añade un nuevo cliente por con informacion por defecto
        And el usuario Administrador navega a la pagina Clientes
    When el usuario Administrador busca a el cliente añadido usando "Test_PDN" en el buscador por palabra clave
    Then el nuevo cliente es mostrado en la tabla de clientes con la siguiente informacion:
        | PrefijoDelNombre                  | Test_PDN          |
        | Nombre                            | Test_N            |
        | SegundoNombre                     | Test_SN           |
        | Apellido                          | Test_A            |
        | SufijoDelNombre                   | Test_SDN          |
        | CorreoElectronico                 | <RandomEmail,15>  |
        | Genero                            | Male              |

@iniciarSesion @eliminarCliente @Funcionalidad
Scenario: Verificar que el nuevo cliente es encontrado usando "Nombre" en el buscador por palabra clave
    Given el usuario Administrador añade un nuevo cliente por con informacion por defecto
        And el usuario Administrador navega a la pagina Clientes
    When el usuario Administrador busca a el cliente añadido usando "Test_N" en el buscador por palabra clave
    Then el nuevo cliente es mostrado en la tabla de clientes con la siguiente informacion:
        | PrefijoDelNombre                  | Test_PDN          |
        | Nombre                            | Test_N            |
        | SegundoNombre                     | Test_SN           |
        | Apellido                          | Test_A            |
        | SufijoDelNombre                   | Test_SDN          |
        | CorreoElectronico                 | <RandomEmail,15>  |
        | Genero                            | Male              |

@iniciarSesion @eliminarCliente @Funcionalidad
Scenario: Verificar que el nuevo cliente es encontrado usando "Segundo Nombre" en el buscador por palabra clave
    Given el usuario Administrador añade un nuevo cliente por con informacion por defecto
        And el usuario Administrador navega a la pagina Clientes
    When el usuario Administrador busca a el cliente añadido usando "Test_SN" en el buscador por palabra clave
    Then el nuevo cliente es mostrado en la tabla de clientes con la siguiente informacion:
        | PrefijoDelNombre                  | Test_PDN          |
        | Nombre                            | Test_N            |
        | SegundoNombre                     | Test_SN           |
        | Apellido                          | Test_A            |
        | SufijoDelNombre                   | Test_SDN          |
        | CorreoElectronico                 | <RandomEmail,15>  |
        | Genero                            | Male              |

@iniciarSesion @eliminarCliente @Funcionalidad
Scenario: Verificar que el nuevo cliente es encontrado usando "Apellido" en el buscador por palabra clave
    Given el usuario Administrador añade un nuevo cliente por con informacion por defecto
        And el usuario Administrador navega a la pagina Clientes
    When el usuario Administrador busca a el cliente añadido usando "Test_A" en el buscador por palabra clave
    Then el nuevo cliente es mostrado en la tabla de clientes con la siguiente informacion:
        | PrefijoDelNombre                  | Test_PDN          |
        | Nombre                            | Test_N            |
        | SegundoNombre                     | Test_SN           |
        | Apellido                          | Test_A            |
        | SufijoDelNombre                   | Test_SDN          |
        | CorreoElectronico                 | <RandomEmail,15>  |
        | Genero                            | Male              |

@iniciarSesion @eliminarCliente @Funcionalidad
Scenario: Verificar que el nuevo cliente es encontrado usando "Sufijo Del Nombre" en el buscador por palabra clave
    Given el usuario Administrador añade un nuevo cliente por con informacion por defecto
        And el usuario Administrador navega a la pagina Clientes
    When el usuario Administrador busca a el cliente añadido usando "Test_SDN" en el buscador por palabra clave
    Then el nuevo cliente es mostrado en la tabla de clientes con la siguiente informacion:
        | PrefijoDelNombre                  | Test_PDN          |
        | Nombre                            | Test_N            |
        | SegundoNombre                     | Test_SN           |
        | Apellido                          | Test_A            |
        | SufijoDelNombre                   | Test_SDN          |
        | CorreoElectronico                 | <RandomEmail,15>  |
        | Genero                            | Male              |

@iniciarSesion @eliminarCliente @Funcionalidad
Scenario: Verificar que el nuevo cliente es encontrado usando "Numero De Impuesto" en el buscador por palabra clave
    Given el usuario Administrador añade un nuevo cliente por con informacion por defecto
        And el usuario Administrador navega a la pagina Clientes
    When el usuario Administrador busca a el cliente añadido usando "Test_Tax_Value" en el buscador por palabra clave
    Then el nuevo cliente es mostrado en la tabla de clientes con la siguiente informacion:
        | PrefijoDelNombre                  | Test_PDN          |
        | Nombre                            | Test_N            |
        | SegundoNombre                     | Test_SN           |
        | Apellido                          | Test_A            |
        | SufijoDelNombre                   | Test_SDN          |
        | CorreoElectronico                 | <RandomEmail,15>  |
        | Genero                            | Male              |
        | NumeroDeImpuesto                  | Test_Tax_Value    |
