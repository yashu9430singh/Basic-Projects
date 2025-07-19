const mongoose = require('mongoose');

const urlSchema = new mongoose.Schema({
    originalUrl: {type: String, required: true, unique: true},
    shortenedUrl: {type: Number, unique: true},
});

module.exports = mongoose.model('Url', urlSchema);