Feature: Control de inventario y lotes farmacéuticos

HU-07 – Registrar recepción de medicamentos
escenario feliz 
  Scenario: Registrar la recepción de medicamentos correctamente
    Given que existe una orden de compra registrada
    And el proveedor realiza la entrega de los medicamentos
    When el encargado de inventario registra la recepción
    Then el sistema debe almacenar la información de la recepción
    And debe asociarla a la orden de compra correspondiente

escenario Alternativo/Error
  Scenario: Registrar una recepción para una orden inexistente
    Given que el encargado de inventario se encuentra en el módulo de recepción
    When intenta registrar una recepción utilizando una orden inexistente
    Then el sistema debe rechazar la operación
    And debe mostrar un mensaje indicando que la orden no existe

HU-08 – Registrar lote y fecha de vencimiento
escenario feliz
  Scenario: Registrar lote y fecha de vencimiento correctamente
    Given que se ha registrado una recepción de medicamentos
    When el encargado de inventario registra el número de lote
    And registra la fecha de vencimiento
    Then el sistema debe almacenar la información del lote
    And debe asociarla al medicamento correspondiente

escenario Alternativo/Error
  Scenario: Registrar un lote con fecha de vencimiento inválida
    Given que se ha registrado una recepción de medicamentos
    When el encargado de inventario ingresa una fecha de vencimiento inválida
    Then el sistema debe rechazar el registro
    And debe mostrar un mensaje indicando el error encontrado

HU-09 – Actualizar existencias del inventario
escenario feliz
  Scenario: Actualizar existencias del inventario correctamente
    Given que existe una recepción de medicamentos registrada
    When el sistema procesa la recepción
    Then debe actualizar automáticamente las existencias disponibles
    And debe reflejar la nueva cantidad en inventario

escenario Alternativo/Error
  Scenario: Actualizar existencias con cantidades inconsistentes
    Given que existe una recepción registrada
    When se detectan cantidades inconsistentes durante la actualización
    Then el sistema debe impedir la actualización
    And debe registrar la incidencia para su revisión
