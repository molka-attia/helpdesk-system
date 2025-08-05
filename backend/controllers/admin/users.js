const mongoose = require('mongoose');
const users = require('../../models/User');
const tickets = require('../../models/Ticket');
const departement = require('../../models/Departement');
const Groupe = require('../../models/Groupe');

exports.getUsers = (req, res, next) =>{
//     users.find({'type': { $ne: 'technicien'}},{_id:1,name:1,email:1,password:1,type:1,user_img:1})
//     .then(userResults => {res.json(userResults);console.log(userResults)});
// }

users.aggregate([
    {$set: {departement_id: {$toObjectId: "$departement_id"} }},
    {
        $lookup: {
            from: 'departements',
            localField: 'departement_id',
            foreignField: '_id',
            as: 'user_departement'
        }
    },
   
    {
        $match: {
            'type': { $ne: 'technicien'}
        }
    }

])
.then(userResults => {res.json(userResults);console.log(userResults)});
}






exports.getsitechdisponible  =  (req, res, next) =>{
    users.aggregate([
       // {$set: {groupe_id: {$toObjectId: "$groupe_id"} }},
       // {
       //     $lookup: {
       //         from: 'users',
       //         localField: '_id',
       //         foreignField: 'groupe_id',
       //         as: 'user_groupe'
       //     }
       { "$addFields": { "_id": { "$toString": "$_id" }}},
       
       { "$lookup": {
         "from": "tickets",
         "localField": "_id",
         "foreignField": "assignetech",
         "as": "user_ticket",
         pipeline: [
           { $match: { "etat": { $ne: 'cloturer'} } }
        ],
       }},
       //{$set: {"groupe_id._id": {$toObjectId: "$groupe_id._id"} }},
       {
           $lookup: {
               from: 'groupes',
               localField: 'groupe_id._id',
               foreignField: '_id',
               as: 'technicien_groupe'
           }
       },
       {$set: {departement_id: {$toObjectId: "$departement_id"} }},
       {
           $lookup: {
               from: 'departements',
               localField: 'departement_id',
               foreignField: '_id',
               as: 'user_departement'
           }
       },
       {$match:{type:"technicien"}},
       {$project: {
           name:1,
           prenom:1,
           email:1,
           post:1,
           email:1,

           user_img:1,
           user_ticket: 1,
           groupe_id:1,
           technicien_groupe:1,
           user_departement:1,
           numberOftickets: { $size: "$user_ticket"  }
        }}
       //])
       //,
       // {$sort:{
       //     Datecreaation:-1}},
       // {
       //     $match: {
       //         'emetteur_id': req.params.id
       //     }
       // }
   
   ])
   .then(userResults => {res.json(userResults);console.log(userResults)});
}















// exports.getTechniciens = (req, res, next) =>{
//     users.find({type:"technicien" },{_id:1,name:1,email:1,password:1,type:1,user_img:1})
//     .then(userResults => {res.json(userResults);console.log(userResults)});
// }


exports.getTechniciens = (req, res, next) =>{

    //     users.aggregate([
    //        // {$set: {groupe_id: {$toObjectId: "$groupe_id"} }},
    //        // {
    //        //     $lookup: {
    //        //         from: 'users',
    //        //         localField: '_id',
    //        //         foreignField: 'groupe_id',
    //        //         as: 'user_groupe'
    //        //     }
    //        { "$addFields": { "_id": { "$toString": "$_id" }}},
           
    //        { "$lookup": {
    //          "from": "tickets",
    //          "localField": "_id",
    //          "foreignField": "assignetech",
    //          "as": "user_ticket",
    //          pipeline: [
    //            { $match: { "etat": { $ne: 'cloturer'} } }
    //         ],
    //        }},
    //     //    {$set: {groupe_id: {$toObjectId: "$groupe_id"} }},
    //     //    {
    //     //        $lookup: {
    //     //            from: 'groupes',
    //     //            localField: 'groupe_id',
    //     //            foreignField: '_id',
    //     //            as: 'technicien_groupe'
    //     //        }
    //     //    },
    //        {$set: {departement_id: {$toObjectId: "$departement_id"} }},
    //        {
    //            $lookup: {
    //                from: 'departements',
    //                localField: 'departement_id',
    //                foreignField: '_id',
    //                as: 'user_departement'
    //            }
    //        },
    //        {$match:{type:"technicien"}},
    //        {$project: {
    //            name:1,
    //            prenom:1,
    //            email:1,
    //            post:1,
    //            email:1,
    //            tel:1,
    // user_departement:1,
    //            user_img:1,
    //            user_ticket: 1,
    //           // groupe_id:1,
    //            technicien_groupe:1,
    //            numberOftickets: { $size: "$user_ticket"  }
    //         }}
    //        //])
    //        //,
    //        // {$sort:{
    //        //     Datecreaation:-1}},
    //        // {
    //        //     $match: {
    //        //         'emetteur_id': req.params.id
    //        //     }
    //        // }
       
    //    ])
    //    .then(userResults => {res.json(userResults);console.log(userResults)});
    // }
    
    users.aggregate([
        // {$set: {groupe_id: {$toObjectId: "$groupe_id"} }},
        // {
        //     $lookup: {
        //         from: 'users',
        //         localField: '_id',
        //         foreignField: 'groupe_id',
        //         as: 'user_groupe'
        //     }
        { "$addFields": { "_id": { "$toString": "$_id" }}},
        
        { "$lookup": {
          "from": "tickets",
          "localField": "_id",
          "foreignField": "assignetech",
          "as": "user_ticket",
          pipeline: [
            { $match: { "etat": { $ne: 'cloturer'} } }
         ],
        }},
        //{$set: {"groupe_id._id": {$toObjectId: "$groupe_id._id"} }},
        {
            $lookup: {
                from: 'groupes',
                localField: 'groupe_id._id',
                foreignField: '_id',
                as: 'technicien_groupe'
            }
        },
        {$set: {departement_id: {$toObjectId: "$departement_id"} }},
        {
            $lookup: {
                from: 'departements',
                localField: 'departement_id',
                foreignField: '_id',
                as: 'user_departement'
            }
        },
        {$match:{type:"technicien"}},
        {$project: {
            name:1,
            prenom:1,
            email:1,
            post:1,
            email:1,
 tel:1,
            user_img:1,
            user_ticket: 1,
            groupe_id:1,
            technicien_groupe:1,
            user_departement:1,
            numberOftickets: { $size: "$user_ticket"  }
         }}
        //])
        //,
        // {$sort:{
        //     Datecreaation:-1}},
        // {
        //     $match: {
        //         'emetteur_id': req.params.id
        //     }
        // }
    
    ])
    .then(userResults => {res.json(userResults);console.log(userResults)});
 }
  
    

 exports.deleteusergroupe= (req, res, next) =>{
    const id=req.params.id;
    users.updateOne({_id:req.params.id},
        // { $pull: { groupe_id: {"groupe_id._id":req.params.groupe,_id:req.params.id } } })
        { $pull: { groupe_id: { _id:mongoose.Types.ObjectId(req.params.groupe) } }  })
    .then(userResults => {res.json(userResults);console.log(userResults)});
 }




exports.getadmin = (req, res, next) =>{
    users.find({type:"admin" },{_id:1,name:1,email:1,password:1,type:1,user_img:1})
    .then(userResults => {res.json(userResults);console.log(userResults)});
}

// exports.getOneUser = (req, res, next) =>{
//     users.find({_id:req.params.id},{_id:1,name:1,email:1,password:1,type:1,user_img:1})
//     .then(userResults => res.json(userResults[0]));
// }

exports.delete= (req, res, next) =>{
users.deleteOne({_id:req.params.id})
.then(userResults => res.json("succes"));
}


// exports.getTechniciensofthegroupe = (req, res, next) =>{
//     users.find({"groupe_id._id":req.params._id },{_id:1,name:1,email:1,password:1,type:1,user_img:1})
//     .then(userResults => {res.json(userResults);console.log(userResults)});
// }


exports.getTechniciensofthegroupe = (req, res, next) => {

     
    Groupe.aggregate([
        {
            $match: {
                _id: mongoose.Types.ObjectId(req.params.id)
            }
        },
        { "$lookup": {
          "from": "users",
          "localField": "_id",
          "foreignField": "groupe_id._id",
          "as": "membre_groupe"
        }},
        { "$lookup": {
            "from": "tickets",
            "localField": "_id",
            "foreignField": "specialite",
            "as": "ticket_groupe"
          }},
        
          {$project: {
            specialite:1,
           
            membre_groupe: 1,
            ticket_groupe:1,
            numberOftickets: {$size: "$ticket_groupe"  },
            // numberOfticketscloturer: { $cond: { if: {'etat':"non cloturer" }, then: {$sum: 1 }, else: 0 } }
         }},
        //])
        //,
        // {$sort:{
        //     Datecreaation:-1}},
     
    
    ])
    .then(userResults => {res.json(userResults[0]);console.log(userResults)});

}








exports.getequipe= (req, res, next) =>{
    users.findOne({_id:req.params.id },{_id:0,groupe_id:1})
    .then(userResults => {res.json(userResults);console.log(userResults)});
}





// exports.getStats = (req, res, next) => {
//   // users.find({},{_id:1})
// //    users.size().then(stats => {
// //                 res.json(stats);      
// //             });

//     users.aggregate([
//         // {$match:{_id :mongoose.Types.ObjectId()}},
//         // {$project : {"users" : {$size :"$users"},_id:0}}
//        { $group:{_id:null, users:{$sum:1}}}
//         ])
//         .then(stats => {
//             res.json(stats[0]);      
//         });

//    }
//    exports.getStatsclubs = (req, res, next) => {
//     // users.find({},{_id:1})
//   //    users.size().then(stats => {
//   //                 res.json(stats);      
//   //             });
  
//       clubs.aggregate([
//           // {$match:{_id :mongoose.Types.ObjectId()}},
//           // {$project : {"users" : {$size :"$users"},_id:0}}
//          { $group:{_id:null, clubs:{$sum:1}}}
//           ])
//           .then(stats => {
//               res.json(stats[0]);      
//           });
  
//      }

exports.getStats = (req, res, next) => {
    // users.find({},{_id:1})
  //    users.size().then(stats => {
  //                 res.json(stats);      
  //             });
  
      users.aggregate([
          // {$match:{_id :mongoose.Types.ObjectId()}},
          // {$project : {"users" : {$size :"$users"},_id:0}}
         { $group:{_id:null, users:{$sum:1}}}
          ])
          .then(stats => {
              res.json(stats[0]);      
          });
  
     }



exports.getStatsnombreTechnicien= (req, res, next) => {
    // users.find({},{_id:1})
  //    users.size().then(stats => {
  //                 res.json(stats);      
  //             });
  
      users.aggregate([
          {$match:{type:"technicien"}},
          // {$project : {"users" : {$size :"$users"},_id:0}}
         { $group:{_id:null, techniciens:{$sum:1}}}
          ])
          .then(stats => {
              res.json(stats[0]);      
          });
  
     }









    //  exports.getOneUser = (req, res, next) =>{
    //     users.find({_id:req.params.id},{_id:1,name:1,email:1,password:1,type:1,user_img:1,groupe_id:1,poste:1,prenom:1})
    //     .then(userResults => res.json(userResults[0]));
    // }
    exports.getOneUser = (req, res, next) =>{
        //     users.find({'type': { $ne: 'technicien'}},{_id:1,name:1,email:1,password:1,type:1,user_img:1})
        //     .then(userResults => {res.json(userResults);console.log(userResults)});
        // }
        
        users.aggregate([
                
           // {$match:{_id:{ $eq: { $toObjectId:"6227aa0d6000a5b792490c83" } }}},
           { $match: { $expr : { $eq: [ '$_id' , { $toObjectId: req.params.id } ] }} },
           {$set: {departement_id: {$toObjectId: "$departement_id"} }},
            {
                $lookup: {
                    from: 'departements',
                    localField: 'departement_id',
                    foreignField: '_id',
                    as: 'user_departement'
                }
            },
            {
                $lookup: {
                    from: 'groupes',
                    localField: 'groupe_id._id',
                    foreignField: '_id',
                    as: 'technicien_groupe'
                }
            },
       
        
        ])
        .then(userResults => {res.json(userResults[0]);console.log(userResults[0])});
        }
        





    exports.getUserName = (req, res, next) =>{
        users.find({_id:req.params.id},{_id:0,name:1,prenom:1})
        .then(userResults => res.json(userResults[0]));
    }


    exports.gettechniciensofthesamegroupe= (req, res, next) =>{
        users.find({_id:req.params.id},{_id:0,name:1})
        .then(userResults => res.json(userResults[0]));
    }



    exports.getnombredeticketpertechnicien  =  (req, res, next) =>{
     users.aggregate([
        // {$set: {groupe_id: {$toObjectId: "$groupe_id"} }},
        // {
        //     $lookup: {
        //         from: 'users',
        //         localField: '_id',
        //         foreignField: 'groupe_id',
        //         as: 'user_groupe'
        //     }
        { "$addFields": { "_id": { "$toString": "$_id" }}},
        
        { "$lookup": {
          "from": "tickets",
          "localField": "_id",
          "foreignField": "assignetech",
          "as": "user_ticket",
          pipeline: [
            { $match: { "etat":{ $ne: 'cloturer'}} }
         ],
        }},
        {$match:{type:"technicien"}},
        {$project: {
            name:1,
            email:1,
            user_img:1,
            user_ticket: 1,
            groupe_id:1,
            numberOftickets: { $size: "$user_ticket"  }
         }}
        //])
        //,
        // {$sort:{
        //     Datecreaation:-1}},
        // {
        //     $match: {
        //         'emetteur_id': req.params.id
        //     }
        // }
    
    ])
    .then(userResults => {res.json(userResults);console.log(userResults)});
}
exports.getnombredeticketcloturerpertechnicien  =  (req, res, next) =>{
    users.aggregate([
       // {$set: {groupe_id: {$toObjectId: "$groupe_id"} }},
       // {
       //     $lookup: {
       //         from: 'users',
       //         localField: '_id',
       //         foreignField: 'groupe_id',
       //         as: 'user_groupe'
       //     }
       { "$addFields": { "_id": { "$toString": "$_id" }}},
       
       { "$lookup": {
         "from": "tickets",
         "localField": "_id",
         "foreignField": "assignetech",
         "as": "user_ticket",
         pipeline: [
           { $match: { "etat":"cloturer" } }
        ],
       }},
       {$match:{type:"technicien"}},
       {$project: {
           name:1,
           email:1,
           user_img:1,
           user_ticket: 1,
           groupe_id:1,
           numberOftickets: { $size: "$user_ticket"  }
        }}
       //])
       //,
       // {$sort:{
       //     Datecreaation:-1}},
       // {
       //     $match: {
       //         'emetteur_id': req.params.id
       //     }
       // }
   
   ])
   .then(userResults => {res.json(userResults);console.log(userResults)});
}

exports.getnombredetickettotalpertechnicien  =  (req, res, next) =>{
    users.aggregate([
       // {$set: {groupe_id: {$toObjectId: "$groupe_id"} }},
       // {
       //     $lookup: {
       //         from: 'users',
       //         localField: '_id',
       //         foreignField: 'groupe_id',
       //         as: 'user_groupe'
       //     }
       { "$addFields": { "_id": { "$toString": "$_id" }}},
       
       { "$lookup": {
         "from": "tickets",
         "localField": "_id",
         "foreignField": "assignetech",
         "as": "user_ticket",
        //  pipeline: [
        //    { $match: { "etat":"non cloturer" } }
        // ],
       }},
       {$match:{type:"technicien"}},
       {$project: {
           name:1,
           email:1,
           user_img:1,
           user_ticket: 1,
           groupe_id:1,
           numberOftickets: { $size: "$user_ticket"  }
        }}
       //])
       //,
       // {$sort:{
       //     Datecreaation:-1}},
       // {
       //     $match: {
       //         'emetteur_id': req.params.id
       //     }
       // }
   
   ])
   .then(userResults => {res.json(userResults);console.log(userResults)});
}



exports.gettimeticketpertechnicien =  (req, res, next) =>{
    users.aggregate([
       // {$set: {groupe_id: {$toObjectId: "$groupe_id"} }},
       // {
       //     $lookup: {
       //         from: 'users',
       //         localField: '_id',
       //         foreignField: 'groupe_id',
       //         as: 'user_groupe'
       //     }
       { "$addFields": { "_id": { "$toString": "$_id" }}},
       
       { "$lookup": {
         "from": "tickets",
         "localField": "_id",
         "foreignField": "assignetech",
         "as": "user_ticket",
         pipeline: [
            {
                $group:
                   {
                       _id: null,
                       averageTime:
                          {
                             $avg:
                                {
                                   $dateDiff:
                                      {
                                          startDate: "$Dateaffectation",
                                          endDate: "$Datecloturation",
                                          unit: "hour"
                                      }
                                 }
                          }
                   }
             },
        ],
       }},
       {$match:{type:"technicien"}},
       
       {$project: {
           name:1,
           email:1,
           user_img:1,
           "user_ticket.averageTime": 1,
           averageTime: 1,
           groupe_id:1,
        //    numberOftickets: { $size: "$user_ticket"  },
           numDays:
           {
              $trunc:
                 [ "$averageTime", 1 ]
           }
     
        }}
       //])
       //,
       // {$sort:{
       //     Datecreaation:-1}},
       // {
       //     $match: {
       //         'emetteur_id': req.params.id
       //     }
       // }
   
   ])
   .then(userResults => {res.json(userResults);console.log(userResults)});
}

