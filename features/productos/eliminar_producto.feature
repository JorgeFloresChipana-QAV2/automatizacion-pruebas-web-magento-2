@ui
Feature: Eliminar Producto

@login @Funcionalidad
Scenario: Verificar que el producto es eliminado cuando se confirma la ventana emergente “Eliminar elementos”
    Given el usuario Administrador navega a la pagina Productos
        And el usuario Administrador añade un nuevo producto por con informacion por defecto
        And el usuario Administrador busca a el producto añadido con el buscador por palabra clave
    When el usuario Administrador elimina a el producto encontrado en la tabla de Productos
    Then el mensage exitoso "A total of 1 record(s) have been deleted." es mostrado en la parte superior de la pagina Productos
