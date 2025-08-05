const mongoose = require('mongoose');

const demandeSchema = mongoose.Schema({
    contenu: {type: String, required: false},
    recepteur_id: {type:String, required: false},
    emetteur_id: {type: String, required: false},
    ticket_id: {type: String, required: false},
    etat: {type: String, required: false},
    Datecreaation:{type: Date, required: false},
    Datereponse:{type: Date, required: false},
  
});

module.exports = mongoose.model('Demande', demandeSchema);