const mongoose = require('mongoose');
const departement = require('../../models/Departement');



exports.getDepartements = (req, res, next) =>{
    departement.find({},{_id:1,name:1})
    .then(userResults => {res.json(userResults);console.log(userResults)});
}
