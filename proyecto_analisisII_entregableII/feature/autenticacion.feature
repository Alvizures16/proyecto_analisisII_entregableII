Feature: Autenticación de usuarios

  Scenario: Inicio de sesión exitoso
    Given que el usuario se encuentra en la pantalla de inicio de sesión
    And posee una cuenta registrada en el sistema
    When ingresa un nombre de usuario válido
    And ingresa la contraseña correcta
    And selecciona la opción "Iniciar sesión"
    Then el sistema debe validar las credenciales
    And debe permitir el acceso al sistema
    And debe mostrar el panel principal correspondiente a su rol

  Scenario: Inicio de sesión con contraseña incorrecta
    Given que el usuario se encuentra en la pantalla de inicio de sesión
    And posee una cuenta registrada en el sistema
    When ingresa un nombre de usuario válido
    And ingresa una contraseña incorrecta
    And selecciona la opción "Iniciar sesión"
    Then el sistema debe rechazar las credenciales
    And debe mostrar un mensaje indicando que las credenciales son incorrectas
    And no debe permitir el acceso al sistema

  Scenario: Inicio de sesión con campos incompletos
    Given que el usuario se encuentra en la pantalla de inicio de sesión
    When intenta iniciar sesión sin completar todos los campos requeridos
    Then el sistema debe mostrar un mensaje indicando que existen campos obligatorios
    And no debe permitir el acceso al sistema