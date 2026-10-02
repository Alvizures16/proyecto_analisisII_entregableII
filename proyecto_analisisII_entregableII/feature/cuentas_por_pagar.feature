Feature: Gestión de cuentas por pagar

  Scenario: Registrar una factura de proveedor correctamente
    Given que existe un proveedor registrado
    When el encargado administrativo registra la información de la factura
    Then el sistema debe almacenar la factura
    And debe generar un registro de cuenta por pagar

  Scenario: Registrar una factura con información incompleta
    Given que el encargado administrativo se encuentra registrando una factura
    When intenta guardar la factura sin completar los datos obligatorios
    Then el sistema debe rechazar el registro
    And debe mostrar un mensaje indicando los campos faltantes

  Scenario: Vincular una factura con una orden de compra
    Given que existe una factura registrada
    And existe una orden de compra registrada
    When el encargado administrativo vincula la factura con la orden
    Then el sistema debe registrar la relación entre ambos documentos
    And debe guardar la vinculación correctamente

  Scenario: Vincular una factura con una orden inexistente
    Given que existe una factura registrada
    When el encargado administrativo intenta vincularla a una orden inexistente
    Then el sistema debe rechazar la operación
    And debe mostrar un mensaje indicando que la orden no existe

  Scenario: Validar una factura contra su orden relacionada
    Given que existe una factura vinculada a una orden de compra
    When el sistema valida la información registrada
    Then debe verificar la correspondencia entre ambos documentos
    And debe aprobar la validación si los datos coinciden

  Scenario: Detectar inconsistencias entre factura y orden de compra
    Given que existe una factura vinculada a una orden de compra
    When el sistema encuentra diferencias en los datos registrados
    Then debe rechazar la validación
    And debe informar las inconsistencias encontradas