const ProductoModel = require('../models/productoModel');

class ProductoService {
    static async listarProductos() {
        return await ProductoModel.obtenerTodos();
    }

    static async registrarProducto(datos) {
        if (!datos.nombre || !datos.precio) {
            throw new Error('El nombre y el precio son obligatorios');
        }
        return await ProductoModel.crear(datos);
    }
}

module.exports = ProductoService;