Feature: Gestión de proveedores

  Scenario: Registrar un proveedor correctamente
    Given que el administrador se encuentra en el módulo de proveedores
    When registra la información requerida del proveedor
    And selecciona la opción "Guardar"
    Then el sistema debe registrar el proveedor
    And debe mostrar un mensaje de confirmación

  Scenario: Registrar un proveedor con información incompleta
    Given que el administrador se encuentra en el módulo de proveedores
    When intenta registrar un proveedor sin completar los datos obligatorios
    Then el sistema debe rechazar el registro
    And debe mostrar un mensaje indicando los campos faltantes

  Scenario: Vincular un medicamento con un proveedor
    Given que existe un proveedor registrado
    And existe un medicamento registrado
    When el administrador selecciona un proveedor
    And selecciona un medicamento
    And confirma la vinculación
    Then el sistema debe registrar la relación entre proveedor y medicamento
    And debe mostrar un mensaje de confirmación

  Scenario: Vincular un medicamento con un proveedor inexistente
    Given que el administrador se encuentra en el módulo de proveedores
    When intenta vincular un medicamento a un proveedor que no existe
    Then el sistema debe rechazar la operación
    And debe mostrar un mensaje indicando que el proveedor no está registrado