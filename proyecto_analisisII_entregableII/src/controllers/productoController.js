const ProductoService = require('../services/productoService');

class ProductoController {
    static async getProductos(req, res) {
        try {
            const productos = await ProductoService.listarProductos();
            res.status(200).json({
                success: true,
                count: productos.length,
                data: productos
            });
        } catch (error) {
            res.status(500).json({
                success: false,
                message: 'Error al obtener productos',
                error: error.message
            });
        }
    }

    static async createProducto(req, res) {
        try {
            if (!req.body || Object.keys(req.body).length === 0) {
                return res.status(400).json({
                    success: false,
                    message: 'Error al registrar el producto',
                    error: 'El cuerpo de la petición (body) está vacío'
                });
            }

            const nuevoProducto = await ProductoService.registrarProducto(req.body);
            res.status(201).json({
                success: true,
                message: 'Producto registrado exitosamente',
                data: nuevoProducto
            });
        } catch (error) {
            res.status(400).json({
                success: false,
                message: 'Error al registrar el producto',
                error: error.message
            });
        }
    }
}

module.exports = ProductoController;