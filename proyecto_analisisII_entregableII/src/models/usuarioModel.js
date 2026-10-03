const db = require('../config/database');

class UsuarioModel {
    static async buscarPorEmail(email) {
        const query = 'SELECT * FROM usuarios WHERE email = ? AND estado = TRUE;';
        const [rows] = await db.query(query, [email]);
        return rows[0] || null;
    }

    static async obtenerTodos() {
        const query = 'SELECT id, nombre, email, rol, estado FROM usuarios;';
        const [rows] = await db.query(query);
        return rows;
    }
}

module.exports = UsuarioModel;