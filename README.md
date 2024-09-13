# Proyecto de Automatización de pruebas Web - Magento 2

## Descripción del Proyecto

Este proyecto tiene como objetivo automatizar las pruebas web para la aplicación Magento 2 Demo Store, utilizando herramientas como Selenium WebDriver, Cucumber, y Node.js. La automatización abarca diferentes funcionalidades de la aplicación, como la creación, actualización y eliminación de clientes y productos.
## Estructura del Proyecto

- **src/**
  - **pages/**: Contiene las clases que representan las diferentes páginas de la aplicación Magento 2. Cada clase incluye los selectores y métodos necesarios para interactuar con los elementos de la UI.
    - `dashboard_page.js`: Contiene los selectores para interactuar con el dashboard principal.
    - `customers_page.js`: Define los selectores para la interactual con los elementos web y realizar acciones.
    - `products_page.js`: Define los selectores para la interactual con los elementos web y realizar acciones
    - `login_page.js`: Define los selectores para el proceso de inicio de sesión.
    - Otros archivos que representan diferentes partes de la UI.
  - **steps/**: Contiene los archivos que definen los pasos de Cucumber. Cada archivo corresponde a una funcionalidad específica de la aplicación.
    - `login_steps.js`: Define los pasos para el inicio de sesión.
    - `customers_steps.js`: Pasos para la creación, busqueda, edicion y eliminacion de clientes.
    - `products_steps.js`: Pasos para la creación, busqueda, edicion y eliminacion de productos.
  - **support/**: Incluye archivos de soporte como `hooks.js` para establecer los prerequisitos, y `common_flows.js` que realizara las acciones mas comunes para las pruebas.

- **features/**: Contiene los archivos `.feature` que describen los escenarios de prueba en lenguaje Gherkin.
  - `añadir_cliente.feature`: Escenarios de prueba para crear un nuevo cliente.
  - Otros archivos `.feature` para distintas funcionalidades.

- **config/**: Contiene archivos de configuración como `configuration.json` y `environment.json`, donde se almacenan las configuraciones del entorno de pruebas y las credenciales.

## Instalación y Ejecución

### Prerrequisitos

- Node.js (versión recomendada: >= 14)
- npm (gestor de paquetes de Node.js)

### Instalación

1. Clona este repositorio en tu máquina local:
   ```bash
   git clone https://github.com/tu-repositorio.git
   ```
2. Navega al directorio del proyecto:
   ```bash
   cd tu-repositorio
   ```
3. Instala las dependencias necesarias:
   ```bash
   npm install
   ```

### Ejecución de las Pruebas

Para ejecutar las pruebas de automatización, utiliza el siguiente comando:

```bash
npx cucumber-js --tags "@ui"
```

Este comando ejecutará todos los escenarios definidos en los archivos `.feature` utilizando Cucumber.
