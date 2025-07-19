const express = require('express');
const router = express.Router();
const {shortenUrl, redirected} = require('../controller/urlController');

router.post('/api/shorturl', shortenUrl);
router.get('/api/shorturl/:short_url', redirected);

module.exports = router;