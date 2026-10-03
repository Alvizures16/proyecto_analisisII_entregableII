const AuthService = require('../services/authService');

class AuthController {
    static async login(req, res) {
        try {
            const { email, password } = req.body;
            const resultado = await AuthService.autenticar(email, password);
            res.status(200).json({
                success: true,
                message: 'Inicio de sesión exitoso',
                data: resultado
            });
        } catch (error) {
            res.status(401).json({
                success: false,
                message: 'Error de autenticación',
                error: error.message
            });
        }
    }

    static async getUsuarios(req, res) {
        try {
            const usuarios = await AuthService.listarUsuarios();
            res.status(200).json({
                success: true,
                count: usuarios.length,
                data: usuarios
            });
        } catch (error) {
            res.status(500).json({
                success: false,
                message: 'Error al obtener usuarios',
                error: error.message
            });
        }
    }
}

module.exports = AuthController;