const db = require('../config/database');

class ProductoModel {
    static async obtenerTodos() {
        const query = 'SELECT * FROM productos WHERE estado = TRUE;';
        const [rows] = await db.query(query);
        return rows;
    }

    static async crear(datos) {
        const { nombre, descripcion, precio, stock, categoria_id } = datos;
        const query = 'INSERT INTO productos (nombre, descripcion, precio, stock, categoria_id) VALUES (?, ?, ?, ?, ?);';
        const [result] = await db.query(query, [nombre, descripcion, precio, stock, categoria_id || 1]);
        return { id: result.insertId, ...datos };
    }
}

module.exports = ProductoModel;