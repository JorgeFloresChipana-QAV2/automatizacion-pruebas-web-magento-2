@ui
Feature: Eliminar Cliente

@login @Funcionalidad
Scenario: Verificar que un cliente existente es eliminado desde la tabla de clientes
    Given el usuario Administrador añade un nuevo cliente por con informacion por defecto
        And el usuario Administrador navega a la pagina Clientes
        And el usuario Administrador busca a el cliente añadido con el buscador por palabra clave
    When el usuario Administrador elimina a el cliente encontrado en la tabla de clientes
    Then el mensage exitoso "A total of 1 record(s) were deleted." es mostrado en la parte superior de la pagina Clientes
