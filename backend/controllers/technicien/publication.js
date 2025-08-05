const mongoose = require('mongoose');
const Publication = require('../../models/Publication');
const users = require('../../models/User');


// exports.getPublications = (req, res, next) =>{
//     Publication.find({},{_id:1,contenu:1,user_id:1,groupe_id:1,Datecreaation:1})
//     .then(userResults => {res.json(userResults);console.log(userResults)});
// }
exports.getPublications = (req, res, next) =>{
    Publication.aggregate([
        {$set: {user_id: {$toObjectId: "$user_id"} }},
        {
            $lookup: {
                from: 'users',
                localField: 'user_id',
                foreignField: '_id',
                as: 'user_publication'
            }
        },
        {$sort:{
            Datecreaation:-1}}
            ,
            {
                $match: {
                    'groupe_id': "public"
                }
            }
    
    ])
    .then(userResults => {res.json(userResults);console.log(userResults)});
}


exports.getPublicationsgroupe = (req, res, next) =>{
    Publication.aggregate([
        {$set: {user_id: {$toObjectId: "$user_id"} }},
        {
            $lookup: {
                from: 'users',
                localField: 'user_id',
                foreignField: '_id',
                as: 'user_publication'
            }
        },
        {$sort:{
            Datecreaation:-1}},
        {
            $match: {
                'groupe_id': req.params.id
            }
        }
    
    ])
    .then(userResults => {res.json(userResults);console.log(userResults)});
}






// exports.getPublications = (req, res, next) =>{
// Publication.aggregate( [
//     {
//       $lookup:
//         {
//           from: "users",
//           localField: "user_id",
//           foreignField: "_id",
//           as: "inventory_docs"
//         }
//    }, 
//    {
//     $unwind: "$inventory_docs",
// },
//  ] )
//  .then(userResults => {res.json(userResults);console.log(userResults)});
// }


  

  

// exports.getPublications = (req, res, next) =>{
// // Implementing $lookup for customers collection
// Publication.aggregate([
//   {
//     $lookup: {
//       from: "users",
//       localField: "_id",
//       foreignField: "user_id",
//       as: "orders_info",
//     },
//   },
//   // Deconstructs the array field from the
//   // input document to output a document
//   // for each element
//   {
//     $unwind: "$orders_info",
//   },
// ])
//   .then((result) => {
//     console.log(result);
//   })
//   .catch((error) => {
//     console.log(error);
//   });}