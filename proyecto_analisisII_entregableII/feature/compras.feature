Feature: Gestión de órdenes de compra

HU-04 – Crear orden de compra
escenario feliz
  Scenario: Crear una orden de compra correctamente
    Given que existe un proveedor registrado
    And existen medicamentos disponibles para compra
    When el encargado de compras selecciona un proveedor
    And agrega medicamentos y cantidades
    And confirma la creación de la orden
    Then el sistema debe registrar la orden de compra
    And debe generar un número de orden

escenario Alternativo/Error
  Scenario: Crear una orden de compra con datos inválidos
    Given que el encargado de compras se encuentra creando una orden
    When intenta registrar la orden con información incompleta
    Then el sistema debe rechazar la operación
    And debe mostrar un mensaje indicando los errores encontrados

HU-05 – Validar datos de orden de compra
escenario feliz
  Scenario: Validar los datos de una orden de compra correctamente
    Given que el encargado de compras ha ingresado todos los datos de la orden
    When el sistema valida la información registrada
    Then debe confirmar que los datos de la orden son válidos
    And debe permitir continuar con el registro de la orden

escenario Alternativo/Error
  Scenario: Validar una orden de compra con datos incorrectos
    Given que el encargado de compras ha ingresado información incorrecta
    When el sistema valida los datos de la orden
    Then debe rechazar la validación
    And debe mostrar un mensaje indicando los datos que deben corregirse

HU-06 – Generar número de orden de compra
escenario feliz
  Scenario: Generar número de orden de compra
    Given que la información de la orden es válida
    When el encargado de compras registra la orden
    Then el sistema debe generar un identificador único para la orden
    And debe asociarlo a la compra realizada

escenario Alternativo/Error
  Scenario: Intentar generar una orden sin proveedor
    Given que el encargado de compras se encuentra creando una orden
    When intenta registrar la orden sin seleccionar un proveedor
    Then el sistema debe impedir el registro
    And debe mostrar un mensaje indicando que el proveedor es obligatorio
