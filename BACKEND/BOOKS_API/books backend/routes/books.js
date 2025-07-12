const express = require('express');
const router = express.Router();
const bookController = require('../controller/bookController');

router.get('/', bookController.getAllBooks);
router.post('/', bookController.createBook);
router.delete('/:title', bookController.deleteBookByName);
router.put('/', bookController.updateBookName);

module.exports = router;