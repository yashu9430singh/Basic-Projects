const Book = require('../Model/Book');

exports.getAllBooks = async (req, res) => {
    try{
        const books = await Book.find();
        res.json(books);
    }catch(err){
        res.status(500).json({error: err.message});
    }
};

exports.createBook = async (req, res) =>{
    try{
        const newBook = new Book(req.body);
        const savedBook = await newBook.save();
        res.status(201).json(savedBook);
    }catch(err){
        res.status(400).json({error: err.message});
    }
};

exports.deleteBookByName = async (req, res) =>{
    try{
        const result = await Book.deleteOne({title: req.params.title});
        if(result.deletedCount === 0){
            res.status(404).json({message: 'Book not found'});
        }
        res.json({message: 'Book deleted'});
    }catch(err){
        res.status(500).json({error: err.message});
    }
};

exports.updateBookName = async (req, res) => {
    try{
        const update = await Book.findOneAndUpdate({title: req.body.title}, {author: req.body.author}, {new: true});
        res.json(update);
    }catch(err){
        req.status(500).json({error: err.message});
    }
};