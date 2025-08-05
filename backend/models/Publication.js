const mongoose = require('mongoose');

const publicationSchema = mongoose.Schema({
    contenu: {type: String, required: false},
    user_id: {type:String, required: false},
    groupe_id: {type: String, required: false},
 
    Datecreaation:{type: Date, required: false},
  
});

module.exports = mongoose.model('Publication', publicationSchema);