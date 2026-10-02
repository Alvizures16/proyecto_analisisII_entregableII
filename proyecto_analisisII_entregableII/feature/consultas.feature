Feature: Consulta de información

HU-13 – Consulta de información
escenario feliz
  Scenario: Consultar información registrada correctamente
    Given que el usuario ha iniciado sesión en el sistema
    And posee permisos de consulta
    When accede al módulo de consultas
    And selecciona la información que desea visualizar
    Then el sistema debe mostrar la información solicitada
    And debe presentar los datos actualizados

escenario Alternativo/Error
  Scenario: Consultar información sin permisos suficientes
    Given que el usuario ha iniciado sesión en el sistema
    When intenta acceder a información para la cual no posee permisos
    Then el sistema debe restringir el acceso
    And debe mostrar un mensaje indicando que no cuenta con autorización
