const Url = require('../Model/url');

const shortenUrl = async(req, res)=>{
    const originalUrl = req.body.url;
    const urlPattern = /^(https?:\/\/)([\w.-]+\.[a-z]{2,})(\/\S*)?$/i;

    if (!urlPattern.test(originalUrl)) {
        return res.json({ error: 'invalid url' });
    }
    

    try{
        let existing = await Url.findOne({originalUrl});
        if(existing){
            return res.json({original_url : existing.originalUrl, short_url : existing.shortenedUrl});
        }

        const last = await Url.findOne().sort('-shortenedUrl').exec();
        const newShort = last ? last.shortenedUrl + 1 : 1;

        const newUrl = new Url({originalUrl, shortenedUrl: newShort});
        await newUrl.save();

        res.json({original_url : originalUrl, short_url : newShort});
    }catch(err){
        console.error(err);
        res.status(500).json({error: 'Internal Server Error'});
    }
};

const redirected = async(req, res) =>{
    const short_url = req.params.short_url;

    try{
        const found = await Url.findOne({shortenedUrl: short_url});
        if(!found){
            res.status(400).json({error: 'No short Url found for the given input'});
        }

        res.redirect(301, found.originalUrl);
    }catch(err){
        res.status(500).json({error: 'Internal Server Error'});
    }
}

module.exports = {
    shortenUrl,
    redirected,
};
