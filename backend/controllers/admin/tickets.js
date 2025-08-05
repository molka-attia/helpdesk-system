const mongoose = require('mongoose');
const tickets = require('../../models/Ticket');
const users = require('../../models/User');
// exports.getTickets = (req, res, next) =>{
//     tickets.find({},{_id:1,description:1,priorite:1,demandeur:1,assignetech:1,etat:1,opened:1})
//     .then(ticketResults => {res.json(ticketResults);console.log(ticketResults)});
// }

// exports.getTickets = (req, res, next) =>{
// tickets.aggregate([
//     {$project: {_id:1,description:1,priorite:1,demandeur:1,assignetech:1,etat:1,opened:1,Datecreaation:1,Datecloturation:1}},
    
//     {
//       $lookup:{
//         from:"users",
//         localField:"demandeur",
//         foreignField:"_id",
//         as:"user"
//       }
//     },{ $sort: {priorite:- 1,Datecreaation:1 } },
//   ])
//   .then(ticketResults => {res.json(ticketResults);console.log(ticketResults)});
//    }








exports.getTickets = (req, res, next) =>{
  tickets.aggregate([
    //{$set: {assignetech: {$toObjectId: "$assignetech"} }},

     {$set: {specialite: {$toObjectId: "$specialite"} }},
   
      {
          $lookup: {
              from: 'groupes',
              localField: 'specialite',
              foreignField: '_id',
              as: 'ticket_groupe'
          }
      },
     // { "$addFields": { "assignetech": { "$toObjectId": "$assignetech" }}},   
    //   {
    //     $lookup: {
    //         from: 'users',
    //         localField: 'assignetech',
    //         foreignField: '_id',
    //         as: 'ticket_user'
    //     }
    // },  
    //  { $addFields:{ "users._id": { $toString: "$users._id" }
    //  }},
     
      {$sort:{
        priorite:- 1,Datecreaation:1}},
      {
          $match: {
            'etat': { $ne: 'cloturer'}
          }
      }
  
  ])
  .then(userResults => {res.json(userResults);console.log(userResults)});
}

exports.getTicketswithfilter= (req, res, next) =>{
  tickets.aggregate([
    { $match: { $and: [ {'specialite':req.params.id},{ 'etat': { $ne: 'cloturer'}} ] } },
      {$set: {specialite: {$toObjectId: "$specialite"} }},
      {
          $lookup: {
              from: 'groupes',
              localField: 'specialite',
              foreignField: '_id',
              as: 'ticket_groupe',
            //   pipeline: [
            //     { $match: { 'specialite':req.body.specialite } }
            //  ],
          }
      },
      {$sort:{
        priorite:- 1,Datecreaation:1}},
      // {
      //     $match: {
      //       'etat': { $ne: 'cloturer'}
      //     }
      // },
     // { $match: { $and: [ {'specialite':req.body.specialite},{ 'etat': { $ne: 'cloturer'}} ] } },
  
  ])
  .then(userResults => {res.json(userResults);console.log(userResults)});
}

exports.getTicketswithfilteruser= (req, res, next) =>{
  tickets.aggregate([
    { $match: { $and: [ {'specialite':req.params.groupe},{ 'etat': { $ne: 'cloturer'}},{'demandeur':req.params.id} ] } },
      {$set: {specialite: {$toObjectId: "$specialite"} }},
      {
          $lookup: {
              from: 'groupes',
              localField: 'specialite',
              foreignField: '_id',
              as: 'ticket_groupe',
            //   pipeline: [
            //     { $match: { 'specialite':req.body.specialite } }
            //  ],
          }
      },
      {$sort:{
        priorite:- 1,Datecreaation:1}},
      // {
      //     $match: {
      //       'etat': { $ne: 'cloturer'}
      //     }
      // },
     // { $match: { $and: [ {'specialite':req.body.specialite},{ 'etat': { $ne: 'cloturer'}} ] } },
  
  ])
  .then(userResults => {res.json(userResults);console.log(userResults)});
}


exports.ticketsfiltertech= (req, res, next) =>{
  tickets.aggregate([
    { $match: { $and: [ {'specialite':req.params.groupe},{ 'etat': { $ne: 'cloturer'}},{'assignetech':req.params.id} ] } },
      {$set: {specialite: {$toObjectId: "$specialite"} }},
      {
          $lookup: {
              from: 'groupes',
              localField: 'specialite',
              foreignField: '_id',
              as: 'ticket_groupe',
            //   pipeline: [
            //     { $match: { 'specialite':req.body.specialite } }
            //  ],
          }
      },
      {$sort:{
        priorite:- 1,Datecreaation:1}},
      // {
      //     $match: {
      //       'etat': { $ne: 'cloturer'}
      //     }
      // },
     // { $match: { $and: [ {'specialite':req.body.specialite},{ 'etat': { $ne: 'cloturer'}} ] } },
  
  ])
  .then(userResults => {res.json(userResults);console.log(userResults)});
}










exports.ticketsfilterusercloturer= (req, res, next) =>{
  tickets.aggregate([
    { $match: { $and: [ {'specialite':req.params.groupe},{ 'etat': 'cloturer'},{'demandeur':req.params.id}  ] } },
      {$set: {specialite: {$toObjectId: "$specialite"} }},
      {
          $lookup: {
              from: 'groupes',
              localField: 'specialite',
              foreignField: '_id',
              as: 'ticket_groupe',
            //   pipeline: [
            //     { $match: { 'specialite':req.body.specialite } }
            //  ],
          }
      },
      {$sort:{
        priorite:- 1,Datecreaation:1}},
      // {
      //     $match: {
      //       'etat': { $ne: 'cloturer'}
      //     }
      // },
     // { $match: { $and: [ {'specialite':req.body.specialite},{ 'etat': { $ne: 'cloturer'}} ] } },
  
  ])
  .then(userResults => {res.json(userResults);console.log(userResults)});
}



exports.ticketscloturerfilter= (req, res, next) =>{
  tickets.aggregate([
    { $match: { $and: [ {'specialite':req.params.id},{ 'etat': 'cloturer'} ] } },
      {$set: {specialite: {$toObjectId: "$specialite"} }},
      {
          $lookup: {
              from: 'groupes',
              localField: 'specialite',
              foreignField: '_id',
              as: 'ticket_groupe',
            //   pipeline: [
            //     { $match: { 'specialite':req.body.specialite } }
            //  ],
          }
      },
      {$sort:{
        priorite:- 1,Datecreaation:1}},
      // {
      //     $match: {
      //       'etat': { $ne: 'cloturer'}
      //     }
      // },
     // { $match: { $and: [ {'specialite':req.body.specialite},{ 'etat': { $ne: 'cloturer'}} ] } },
  
  ])
  .then(userResults => {res.json(userResults);console.log(userResults)});
}











exports.getlatestticket= (req, res, next) => {
  tickets.find({},{_id:1,Datecreaation:1}).limit(1).sort({$natural:-1})
  .then(events => res.json(events));
}










// exports.getTickets= (req, res, next) => {
//   tickets.find({'etat': { $ne: 'cloturer'}},{'description':1,'priorite':1,'demandeur':1,'assignetech':1,'etat':1,'specialite':1,'Datecreaation':1,'_id':1}).sort({priorite:- 1,Datecreaation:1})
//   .then(events => res.json(events));
// }


exports.getoneticket= (req, res, next) => {
  tickets.findOne({'_id':req.params.id },{'description':1,'priorite':1,'demandeur':1,'assignetech':1,'etat':1,'specialite':1,'Datecreaation':1,'_id':1})
  .then(events => res.json(events));
}


// exports.getavailabletechnicien= (req, res, next) => {
//   tickets.find({'specialite':req.body.specialite},{'description':1,'priorite':1,'demandeur':1,'assignetech':1,'etat':1,'specialite':1,'_id':1},{ $sortByCount:"$assignetech" })
//   .then(events => res.json(events));
// }

// exports.getavailabletechnicien= (req, res, next) => {

//   tickets.aggregate([
//    // {$match: {'specialite':req.body.specialite}}   // guessing this is noise so filter out
//     // other $match could be used here to further shrink the data...
    
//     {$group: {_id:"$assignetech", min:{$min:{n:{$sum:1}}}}}
//    // ,{$match: {n: {$gt:1}}}  // ignore non-dupes
//     //,{$sort: {_id: 1}} // and finally sort.
//                 ])    .then(stats => {
//                   res.json(stats);      
//               });

   
//    }
  
//exports.getavailabletechnicien = (req, res, next) =>{
 // users.find({groupe_id:req.body.id },{_id:1,name:1,email:1,password:1,type:1,user_img:1})
 // .then(userResults => {
    //res.json(userResults);console.log(userResults)
  
  
   //tickets.aggregate([
   // {$match: {'specialite':req.body.specialite}}   // guessing this is noise so filter out
    // other $match could be used here to further shrink the data...
    // {$set: {assignetech: {$toObjectId: "$assignetech"} }},
    //         {
    //             $lookup: {
    //                 from: 'tickets',
    //                 localField:'_id',
    //                 foreignField:'assignetech',
    //                 as: 'user_ticket'
    //             }
    //         }
            //,
 // {$group: {_id:"$assignetech", n:{$sum:1}}},
   //,
    // ignore non-dupes
  //  { $match: { $and: [ { etat:req.body.etat}, { assignetech: { $ne: "" } } ] } }
  //   ,{$sort: {n: 1}} // and finally sort.
  //               ])    .then(stats => {
  //                 res.json(stats);      
  //             });

   
  //  }
  
  
exports.getavailabletechnicien= (req, res, next) =>{
  //users.aggregate([

     // { $match: { "groupe_id":req.params.id} },
     // { $sample: { size: 1 } }
    //  Groupe.aggregate([
    //   {
    //       $match: {
    //           _id: mongoose.Types.ObjectId(req.params.id)
    //       }
    //   },
    users.aggregate([
      // {$set: {groupe_id: {$toObjectId: "$groupe_id"} }},
      // {
      //     $lookup: {
      //         from: 'users',
      //         localField: '_id',
      //         foreignField: 'groupe_id',
      //         as: 'user_groupe'
      //     }
      { $match: { 'groupe_id._id':mongoose.Types.ObjectId(req.params.id)} },
      { "$addFields": { "_id": { "$toString": "$_id" }}},
      
      { "$lookup": {
        "from": "tickets",
        "localField": "_id",
        "foreignField": "assignetech",
        "as": "user_ticket",
        pipeline: [
          { $match: { "etat":"non cloturer" } }
       ],
      }},
      {$match:{type:"technicien"}},
      {$project: {
        _id:1,
          name:1,
          email:1,
          user_img:1,
          user_ticket: 1,
          groupe_id:1,
          numberOftickets: { $size: "$user_ticket"  }
       }}
      //])
      ,
      {$sort:{
        numberOftickets:1}},
      // {
      //     $match: {
      //         'emetteur_id': req.params.id
      //     }
      // }
  
 
      //])
      //,
      // {$sort:{
      //     Datecreaation:-1}},
   
  
  ])
 
  .then(userResults => {res.json(userResults[0]);console.log(userResults)});
}




//    exports.getavailabletechnicien = (req, res, next) =>{
//     tickets.aggregate([
//         {$set: {user_id: {$toObjectId: "$user_id"} }},
//         {
//             $lookup: {
//                 from: 'users',
//                 localField: 'user_id',
//                 foreignField: '_id',
//                 as: 'user_publication'
//             }
//         },
//         {$sort:{
//             Datecreaation:-1}},
//         {
//             $match: {
//                 'groupe_id': req.params.id
//             }
//         }
    
//     ])
//     .then(userResults => {res.json(userResults);console.log(userResults)});
// }





























   ////////////////////////////////////////////////////////////////////////////////////////////////


   exports.delete= (req, res, next) =>{
    tickets.deleteOne({_id:req.params.id})
    .then(userResults => res.json("succes"));
    }
    exports.getTechtickets = (req, res, next) => {
  //     tickets.find({'assignetech':req.params.id,'etat': { $ne: 'cloturer'}},{'description':1,'priorite':1,'demandeur':1,'assignetech':1,'etat':1,'specialite':1,'Datecreaation':1,'_id':1}).sort({priorite:- 1,Datecreaation:1})
  //     .then(events => res.json(events));
  // }
  
tickets.aggregate([
  //{$set: {assignetech: {$toObjectId: "$assignetech"} }},

   {$set: {specialite: {$toObjectId: "$specialite"} }},
 
    {
        $lookup: {
            from: 'groupes',
            localField: 'specialite',
            foreignField: '_id',
            as: 'ticket_groupe'
        }
    },
   // { "$addFields": { "assignetech": { "$toObjectId": "$assignetech" }}},   
  //   {
  //     $lookup: {
  //         from: 'users',
  //         localField: 'assignetech',
  //         foreignField: '_id',
  //         as: 'ticket_user'
  //     }
  // },  
  //  { $addFields:{ "users._id": { $toString: "$users._id" }
  //  }},
   
    {$sort:{
      priorite:- 1,Datecreaation:1}},
    {
        $match: {
          'assignetech':req.params.id,
          'etat': { $ne: 'cloturer'}
        }
    }

])
.then(userResults => {res.json(userResults);console.log(userResults)});
}


  exports.affecterautechnicien = (req, res, next) => {
    tickets.updateOne({'id':req.params.id},
    {'$set':{
        'assignetech':req.body.specialite,
             
    }})
    .then(post => res.json(post));
}



exports.changeretatencoursdetraitement = (req, res, next) => {
  tickets.updateOne({'_id':req.params.id},
  {'$set':{
      'etat':"en cours de traitement",
           
  }})
  .then(post => res.json(post));
}


    exports.getTicketscloturer = (req, res, next) => {
      tickets.aggregate([
        //{$set: {assignetech: {$toObjectId: "$assignetech"} }},
    
         {$set: {specialite: {$toObjectId: "$specialite"} }},
       
          {
              $lookup: {
                  from: 'groupes',
                  localField: 'specialite',
                  foreignField: '_id',
                  as: 'ticket_groupe'
              }
          },
         // { "$addFields": { "assignetech": { "$toObjectId": "$assignetech" }}},   
        //   {
        //     $lookup: {
        //         from: 'users',
        //         localField: 'assignetech',
        //         foreignField: '_id',
        //         as: 'ticket_user'
        //     }
        // },  
        //  { $addFields:{ "users._id": { $toString: "$users._id" }
        //  }},
         
          {$sort:{
            priorite:- 1,Datecreaation:1}},
          {
              $match: {
                'etat':  'cloturer'
              }
          }
      
      ])
      .then(userResults => {res.json(userResults);console.log(userResults)});
    }
  
// description?:string;
// priorite?:string;
// demandeur?:string;
// assignetech?:string;
// etat?:string;
// opened?:string;
exports.getTicketsnumber = (req, res, next) => {
  // users.find({},{_id:1})
//    users.size().then(stats => {
//                 res.json(stats);      
//             });

    tickets.aggregate([
        // {$match:{_id :mongoose.Types.ObjectId()}},
        // {$project : {"users" : {$size :"$users"},_id:0}}
        {$match:{etat:{ $ne: 'cloturer'}}},
       { $group:{_id:null, tickets:{$sum:1}}}
        ])
        .then(stats => {
            res.json(stats[0]);      
        });

   }

   exports.getTicketstechnumber= (req, res, next) => {
    // users.find({},{_id:1})
  //    users.size().then(stats => {
  //                 res.json(stats);      
  //             });
  
      tickets.aggregate([
       
        { $match: { $and: [ { assignetech:req.params.id}, { etat:{ $ne: 'cloturer'} } ] } },
          // {$project : {"users" : {$size :"$users"},_id:0}}
         { $group:{_id:null, tickets:{$sum:1}}}
          ])
          .then(stats => {
              res.json(stats[0]);      
          });
  
     


     }





////////////////////////////////////////////////////userTicket/////////////////////////////////////////////////



     exports.getUsertickets = (req, res, next) => {
  //     tickets.find({'demandeur':req.params.id,'etat': { $ne: 'cloturer'}},{'description':1,'priorite':1,'demandeur':1,'assignetech':1,'etat':1,'specialite':1,'note':1,'Datecreaation':1,'Dateaffectation':1,
  //     'Datecloturation':1,'_id':1}).sort({priorite:- 1,Datecreaation:1})
  //     .then(events => res.json(events));
  // }
  //     tickets.find({'demandeur':req.params.id,'etat': 'cloturer'},{'description':1,'priorite':1,'demandeur':1,'assignetech':1,'etat':1,'specialite':1,'note':1,'Datecreaation':1,'Datecloturation':1,'_id':1}).sort({priorite:- 1,Datecreaation:1})
//     .then(events => res.json(events));
// }
tickets.aggregate([
  //{$set: {assignetech: {$toObjectId: "$assignetech"} }},

   {$set: {specialite: {$toObjectId: "$specialite"} }},
 
    {
        $lookup: {
            from: 'groupes',
            localField: 'specialite',
            foreignField: '_id',
            as: 'ticket_groupe'
        }
    },
   // { "$addFields": { "assignetech": { "$toObjectId": "$assignetech" }}},   
  //   {
  //     $lookup: {
  //         from: 'users',
  //         localField: 'assignetech',
  //         foreignField: '_id',
  //         as: 'ticket_user'
  //     }
  // },  
  //  { $addFields:{ "users._id": { $toString: "$users._id" }
  //  }},
   
    {$sort:{
      priorite:- 1,Datecreaation:1}},
    {
        $match: {
          'demandeur':req.params.id,
          'etat': { $ne: 'cloturer'}
        }
    }

])
.then(userResults => {res.json(userResults);console.log(userResults)});
}


  exports.getUserticketscloturer = (req, res, next) => {
//     tickets.find({'demandeur':req.params.id,'etat': 'cloturer'},{'description':1,'priorite':1,'demandeur':1,'assignetech':1,'etat':1,'specialite':1,'note':1,'Datecreaation':1,'Datecloturation':1,'_id':1}).sort({priorite:- 1,Datecreaation:1})
//     .then(events => res.json(events));
// }
tickets.aggregate([
  //{$set: {assignetech: {$toObjectId: "$assignetech"} }},

   {$set: {specialite: {$toObjectId: "$specialite"} }},
 
    {
        $lookup: {
            from: 'groupes',
            localField: 'specialite',
            foreignField: '_id',
            as: 'ticket_groupe'
        }
    },
   // { "$addFields": { "assignetech": { "$toObjectId": "$assignetech" }}},   
  //   {
  //     $lookup: {
  //         from: 'users',
  //         localField: 'assignetech',
  //         foreignField: '_id',
  //         as: 'ticket_user'
  //     }
  // },  
  //  { $addFields:{ "users._id": { $toString: "$users._id" }
  //  }},
   
    {$sort:{
      priorite:- 1,Datecreaation:1}},
    {
        $match: {
          'demandeur':req.params.id,
          'etat': 'cloturer'
        }
    }

])
.then(userResults => {res.json(userResults);console.log(userResults)});
}





     exports.userticketsnumber= (req, res, next) => {
      // users.find({},{_id:1})
    //    users.size().then(stats => {
    //                 res.json(stats);      
    //             });
    
        tickets.aggregate([
             {$match:{demandeur:req.params.id}},
            // {$project : {"users" : {$size :"$users"},_id:0}}
           { $group:{_id:null, tickets:{$sum:1}}}
            ])
            .then(stats => {
                res.json(stats[0]);      
            });
    
       
  
  
       }
        //  
        exports.userticketscloturernumber= (req, res, next) => {
          // users.find({},{_id:1})
        //    users.size().then(stats => {
        //                 res.json(stats);      
        //             });
        
            tickets.aggregate([
              { $match: { $and: [ { demandeur:req.params.id}, { etat:"cloturer" } ] } },
                // {$project : {"users" : {$size :"$users"},_id:0}}
               { $group:{_id:null, tickets:{$sum:1}}}
                ])
                .then(stats => {
                    res.json(stats[0]);      
                });
      
           }
           exports.userticketsnoncloturernumber= (req, res, next) => {
            // users.find({},{_id:1})
          //    users.size().then(stats => {
          //                 res.json(stats);      
          //             });
          
              tickets.aggregate([
                { $match: { $and: [ { demandeur:req.params.id}, { etat:{ $ne: 'cloturer'} } ] } },
                  // {$project : {"users" : {$size :"$users"},_id:0}}
                 { $group:{_id:null, tickets:{$sum:1}}}
                  ])
                  .then(stats => {
                      res.json(stats[0]);      
                  });
        
             }



             exports.allticketsnumber= (req, res, next) => {
              // users.find({},{_id:1})
            //    users.size().then(stats => {
            //                 res.json(stats);      
            //             });
            
                tickets.aggregate([
                 // { $match: { $and: [ { demandeur:req.params.id}, { etat:{ $ne: 'cloturer'} } ] } },
                // { $match: {
                //         Datecreaation: '2022-05-11T19:37:45.426+00:00'
                //       }},
              //  { $match:{ "Datecreaation": { $gte: new Date(), $lt: new Date() } } },
                    // {$project : {"users" : {$size :"$users"},_id:0}}
                   { $group:{_id:null, tickets:{$sum:1}}}
                    ])
                    .then(stats => {
                     res.json(stats[0]);console.log(new Date())});   
                    
          
               }
               

              exports.statticketsencoursdetrait= (req, res, next) => {
                // users.find({},{_id:1})
              //    users.size().then(stats => {
              //                 res.json(stats);      
              //             });
              
                  tickets.aggregate([
                    { $match: { $and: [ { assignetech:req.params.id}, { etat:'en cours de traitement' } ] } },
                      // {$project : {"users" : {$size :"$users"},_id:0}}
                     { $group:{_id:null, tickets:{$sum:1}}}
                      ])
                      .then(stats => {
                          res.json(stats[0]);      
                      });
            
                 }





exports.getnombretickettotalencoursdetraitement= (req, res, next) => {
  // users.find({},{_id:1})
//    users.size().then(stats => {
//                 res.json(stats);      
//             });

    tickets.aggregate([
      { $match:  { etat:'en cours de traitement' } },
        // {$project : {"users" : {$size :"$users"},_id:0}}
       { $group:{_id:null, tickets:{$sum:1}}}
        ])
        .then(stats => {
            res.json(stats[0]);      
        });

   }

  exports.getnombretotalticketnonafféctés= (req, res, next) => {
    // users.find({},{_id:1})
  //    users.size().then(stats => {
  //                 res.json(stats);      
  //             });
  
      tickets.aggregate([
        { $match:  { assignetech:'' } },
          // {$project : {"users" : {$size :"$users"},_id:0}}
         { $group:{_id:null, tickets:{$sum:1}}}
          ])
          .then(stats => {
              res.json(stats[0]);      
          });
  
     }














             exports.getBeginningOfTheWeek = (now) => {
              const days = (now.getDay() + 7 - 1) % 7;
              now.setDate(now.getDate() - days);
              now.setHours(0, 0, 0, 0);
              return now;
          };

          exports.userticketsnoncloturernumberperweek= (req, res, next) => {
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
                  { $match:{ "Datecreaation": { $gte: new Date("2022-05-02"), $lt: new Date() } } }
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
       



       exports.userticketsnumbernoncloturerperweekedit= (req, res, next) => {
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
             // { $match:{ "Datecreaation": { $gte: new Date(req.params.datedebut), $lt: new Date(req.params.datefin) } } }
            { $match:{ "Datecreaation": { $gte: new Date(req.params.datedebut), $lte: new Date(req.params.datefin) } } }
            // { $match:{ "Datecreaation": { $gte: new Date("2022-05-02"), $lt: new Date("2022-06-09") } } }
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
      .then(userResults => {res.json(userResults);console.log(userResults);console.log(req.params.datefin)});
   }



exports.numberofticketstoday  = (req, res, next) => { 
 tickets.aggregate([
                // { $match: { $and: [ { 
                //   Datecreaation:new Date("")}, { etat:{ $ne: 'cloturer'} } ] } },

                  // {$project : {"users" : {$size :"$users"},_id:0}}
                  //{ $match:{ "Datecreaation": {  $gte: new Date(new Date().getMonth()) } } },
                  { $match:{ "Datecreaation":{$gt:new Date(Date.now() - 24*60*60 * 1000)}} },
                  
                 { $group:{_id:null, tickets:{$sum:1}}}
                  ])
                  .then(stats => {
                      res.json(stats[0]); console.log(new Date(new Date().getMonth()));     
                  });
        
             }

