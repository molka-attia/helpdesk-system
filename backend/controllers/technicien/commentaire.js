const mongoose = require('mongoose');
const Commentaire = require('../../models/Commentaire');
const users = require('../../models/User');


// exports.getCommentaires = (req, res, next) =>{
//     Commentaire.find({publication_id:req.params.id},{_id:1,contenu:1,user_id:1,publication_id:1,Datecreaation:1})
//     .then(userResults => {res.json(userResults);console.log(userResults)});
// }

exports.getCommentaires = (req, res, next) =>{
    Commentaire.aggregate([
        {$set: {user_id: {$toObjectId: "$user_id"} }},
        {
            $lookup: {
                from: 'users',
                localField: 'user_id',
                foreignField: '_id',
                as: 'user_commentaire'
            }
        },
        {$sort:{
            Datecreaation:-1}},
        {
            $match: {
                publication_id:req.params.id
            }
        }
    
    ])
    .then(userResults => {res.json(userResults);console.log(userResults)});
}