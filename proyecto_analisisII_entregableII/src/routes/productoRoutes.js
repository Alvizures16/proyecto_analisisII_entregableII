const express = require('express');
const router = express.Router();
const ProductoController = require('../controllers/productoController');

router.get('/', ProductoController.getProductos);
router.post('/', ProductoController.createProducto);

module.exports = router;