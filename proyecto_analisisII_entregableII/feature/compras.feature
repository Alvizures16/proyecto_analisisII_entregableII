Feature: Gestión de órdenes de compra

  Scenario: Crear una orden de compra correctamente
    Given que existe un proveedor registrado
    And existen medicamentos disponibles para compra
    When el encargado de compras selecciona un proveedor
    And agrega medicamentos y cantidades
    And confirma la creación de la orden
    Then el sistema debe registrar la orden de compra
    And debe generar un número de orden

  Scenario: Crear una orden de compra con datos inválidos
    Given que el encargado de compras se encuentra creando una orden
    When intenta registrar la orden con información incompleta
    Then el sistema debe rechazar la operación
    And debe mostrar un mensaje indicando los errores encontrados

  Scenario: Generar número de orden de compra
    Given que la información de la orden es válida
    When el encargado de compras registra la orden
    Then el sistema debe generar un identificador único para la orden
    And debe asociarlo a la compra realizada

  Scenario: Intentar generar una orden sin proveedor
    Given que el encargado de compras se encuentra creando una orden
    When intenta registrar la orden sin seleccionar un proveedor
    Then el sistema debe impedir el registro
    And debe mostrar un mensaje indicando que el proveedor es obligatorio