const mongoose = require('mongoose');

const commentaireSchema = mongoose.Schema({
    contenu: {type: String, required: false},
    user_id: {type:mongoose.Schema.ObjectId, required: false},
    publication_id: {type: String, required: false},
 
    Datecreaation:{type: Date, required: false},
  
});

module.exports = mongoose.model('Commentaire', commentaireSchema);