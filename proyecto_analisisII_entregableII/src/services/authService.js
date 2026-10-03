const UsuarioModel = require('../models/usuarioModel');

class AuthService {
    static async autenticar(email, password) {
        if (!email || !password) {
            throw new Error('El correo y la contraseña son obligatorios');
        }

        const usuario = await UsuarioModel.buscarPorEmail(email);
        if (!usuario) {
            throw new Error('Usuario no encontrado');
        }

        if (usuario.password !== password) {
            throw new Error('Contraseña incorrecta');
        }

        const { password: _, ...usuarioSinPassword } = usuario;
        return usuarioSinPassword;
    }

    static async listarUsuarios() {
        return await UsuarioModel.obtenerTodos();
    }
}

module.exports = AuthService;