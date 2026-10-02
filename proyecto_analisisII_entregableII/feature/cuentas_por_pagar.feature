Feature: Gestión de cuentas por pagar

HU-10 – Registrar factura de proveedor
escenario feliz
  Scenario: Registrar una factura de proveedor correctamente
    Given que existe un proveedor registrado
    When el encargado administrativo registra la información de la factura
    Then el sistema debe almacenar la factura
    And debe generar un registro de cuenta por pagar

escenario Alternativo/Error
  Scenario: Registrar una factura con información incompleta
    Given que el encargado administrativo se encuentra registrando una factura
    When intenta guardar la factura sin completar los datos obligatorios
    Then el sistema debe rechazar el registro
    And debe mostrar un mensaje indicando los campos faltantes

HU-11 – Vincular factura con orden de compra
escenario feliz
  Scenario: Vincular una factura con una orden de compra
    Given que existe una factura registrada
    And existe una orden de compra registrada
    When el encargado administrativo vincula la factura con la orden
    Then el sistema debe registrar la relación entre ambos documentos
    And debe guardar la vinculación correctamente

escenario Alternativo/Error
  Scenario: Vincular una factura con una orden inexistente
    Given que existe una factura registrada
    When el encargado administrativo intenta vincularla a una orden inexistente
    Then el sistema debe rechazar la operación
    And debe mostrar un mensaje indicando que la orden no existe

HU-12 – Validar orden relacionada con factura
escenario feliz
  Scenario: Validar una factura contra su orden relacionada
    Given que existe una factura vinculada a una orden de compra
    When el sistema valida la información registrada
    Then debe verificar la correspondencia entre ambos documentos
    And debe aprobar la validación si los datos coinciden

escenario Alternativo/Error
  Scenario: Detectar inconsistencias entre factura y orden de compra
    Given que existe una factura vinculada a una orden de compra
    When el sistema encuentra diferencias en los datos registrados
    Then debe rechazar la validación
    And debe informar las inconsistencias encontradas
