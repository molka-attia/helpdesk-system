const express = require('express');
const router = express.Router();
const User=require('./../models/User');
const Ticket=require('./../models/Ticket');
const bcrypt = require('bcrypt');
const userController = require('../controllers/admin/users');
const ticketController = require('../controllers/admin/tickets');
const auth=require('../middlewares/auth');
const nodemailer = require("nodemailer");

const multer = require('multer');
const Groupe = require('../models/Groupe');
const MIME_TYPE_MAP = {
    'image/png': 'png',
    'image/jpeg': 'jpg',
    'image/jpg': 'jpg'
};
const storageEvents = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, './../FrontEnd/src/assets/images');
       
    },
    filename: function (req, file, cb) {
        const name = file.originalname.toLowerCase().split(' ').join('-');
        const ext= MIME_TYPE_MAP[file.mimetype];
        cb(null, Date.now()+ '-' +name);
    }
});

router.get('/:id/getuser',userController.getOneUser);

router.get('/:id/getUserName',auth,userController.getUserName);
// router.get('/',(req,res)=>{
//     User.find().then(users=>res.status(200).json(users)).catch(err=>res.status(400).json('Eror')); 
//    })

   router.get('/',userController.getUsers);

   router.get('/gettechniciens',auth,userController.getTechniciens);

   router.get('/getadmin',auth,userController.getadmin);

   
   router.get('/gettechniciensofthesamegroupe',auth,userController.gettechniciensofthesamegroupe);



   router.get('/tickets',ticketController.getTickets);

   router.get('/:id/ticketsfilter',ticketController.getTicketswithfilter);
   router.get('/:groupe/:id/ticketsfilteruser',ticketController.getTicketswithfilteruser);
   router.get('/:groupe/:id/ticketsfiltertech',ticketController.ticketsfiltertech);
   ///ticketsfilterusercloturer
   ///ticketsfiltertech
   router.get('/:groupe/:id/ticketsfilterusercloturer',ticketController.ticketsfilterusercloturer);
   router.get('/:id/ticketscloturerfilter',ticketController.ticketscloturerfilter);


// router.put('/:id/editUser',auth,multer({storage:storageEvents}).single("user_img") ,(req, res, next) => {
//   const id=req.params.id;  
//   bcrypt.hash(req.body.password, 10)
//   .then(hash => {
//     const user = new User({
//       name: req.body.name,
//       prenom:req.body.prenom,
//       tel:req.body.tel,
//       poste:req.body.poste,
//       email: req.body.email,
//       password: hash,
//       type:"utilisateur",
//       departement_id:req.body.departement_id,
//       user_img:req.file.filename,
//     });
  
//     User.updateOne({"_id":id},{"$set":{"name":req.body.name,"email":req.body.email,"password":user.password,"type":req.body.type,"user_img":req.file.filename}})
//   //      .then(resultat=> console.log(resultat)) 
//       .then(() => res.status(201).json({
//         message: 'User created !',
//         status: 201
//       }))
//       .catch(error => res.status(400).json({
//         error
//       }));
//   })
//   .catch(error => res.status(500).json({
//     error
//   }));

  // const id=req.params.id;
  // console.log(id);
  //      const user = new User({
  //        name: req.body.name,
  //        email: req.body.email,
  //        type:req.body.type,
  //        user_img:req.file.filename,
  //      });
 
  //      User.updateOne({"_id":id},{"$set":{"name":req.body.name,"email":req.body.email,"type":req.body.type,"user_img":req.file.filename}})
  //      .then(resultat=> console.log(resultat)) 
       
  //      // .then(() => res.status(201).json({
  //        //   message: 'User modified !',
  //        //   status: 201
  //        // }))
  //        .catch(error => res.status(400).json({
  //          error
  //        }));
 
 
 //});
  


 router.put('/:id/affectertechnicien' ,auth,(req, res, next) => {
    /**
    const event = {
        event_id: mongoose.Types.ObjectId().toString(),
        event_name: req.body.event_name,
        event_date: req.body.event_date,
        event_img: req.file.filename,
    }

    club.updateOne({'_id':req.body.club_id},{'$push':{'events':event}})
    .then(AddedEvent => res.json(AddedEvent)); */
   
  const id=req.params.id;
  console.log(id);
       const user = new Groupe({
        _id: req.body.groupe_id,
        
       });
 
       User.updateOne({"_id":id},{'$push':{'groupe_id':user}})
       //,{"$set":{"groupe_id":req.body.groupe_id}})
       .then(resultat=> console.log(resultat)) 
       
       // .then(() => res.status(201).json({
         //   message: 'User modified !',
         //   status: 201
         // }))
         .catch(error => res.status(400).json({
           error
         }));
 
 
 });
  




   
  /** prenom: {type: String, required: false},
    tel: {type: String, required: false},
    poste: {type: String, required: false}, */
   router.post('/addUser',multer({storage:storageEvents}).single("user_img") ,(req, res, next) => {
    console.log(req.file);
    bcrypt.hash(req.body.password, 10)
    .then(hash => {
      const user = new User({
        name: req.body.name,
        prenom:req.body.prenom,
        tel:req.body.tel,
        poste:req.body.poste,
        email: req.body.email,
        password: hash,
        type:"utilisateur",
        departement_id:req.body.departement_id,
        user_img:req.file.filename,
      });
    
      user.save()
        .then(() => res.status(201).json({
          message: 'User created !',
          status: 201
        }))
        .catch(error => res.status(400).json({
          error
        }));
    })
    .catch(error => res.status(500).json({
      error
    }));


});


router.post('/ajouterTechnicien',multer({storage:storageEvents}).single("user_img") ,(req, res, next) => {
  console.log(req.file);
  bcrypt.hash(req.body.password, 10)
  .then(hash => {
    const user = new User({
      name: req.body.name,
      prenom:req.body.prenom,
      tel:req.body.tel,
      poste:req.body.poste,
      email: req.body.email,
      password: hash,
      type:"technicien",
      departement_id:req.body.departement_id,
      user_img:req.file.filename,
      groupe_id:req.body.groupe_id,
    });
  
    user.save()
      .then(() => res.status(201).json({
        message: 'User created !',
        status: 201
      }))
      .catch(error => res.status(400).json({
        error
      }));
  })
  .catch(error => res.status(500).json({
    error
  }));


});




async function sendMail(user, callback) {
  // create reusable transporter object using the default SMTP transport
  let transporter = nodemailer.createTransport({
    host: "smtp.gmail.com",
    port: 587,
    secure: false, // true for 465, false for other ports
    auth: {
      user: details.email,
      pass: details.password
    }
  });

  let mailOptions = {
    from: '"Fun Of Heuristic"<example.gimail.com>', // sender address
    to: "pfemolka@gmail.com", // list of receivers
    subject: "Wellcome to Fun Of Heuristic 👻", // Subject line
    html: `<h1>Hi </h1><br>
    <h4>Thanks for joining us</h4>`
  };

  // send mail with defined transport object
  let info = await transporter.sendMail(mailOptions);

  callback(info);
}

router.post('/addUser2',multer({storage:storageEvents}).single("user_img") ,(req, res, next) => {
  console.log(req.file);
  bcrypt.hash(req.body.password, 10)
  .then(hash => {
    const user = new User({
      name: req.body.name,
      email: req.body.email,
      password: hash,
      type:req.body.type,
     // user_img:req.file.filename,
    });
  
    user.save()
      .then(() => res.status(201).json({
        message: 'User created !',
        status: 201
      }))
      .catch(error => res.status(400).json({
        error
      }));
  })
  .catch(error => res.status(500).json({
    error
  }));


});


router.put('/:id/editTechnicien',auth,multer({storage:storageEvents}).single("user_img") ,(req, res, next) => {
    
   
  const id=req.params.id;
  console.log(id);
       const user = new User({
         name: req.body.name,
         email: req.body.email,
         type:"technicien",
         user_img:req.file.filename,
         groupe_id:req.body.groupe_id,
       });
 
       User.updateOne({"_id":id},{"$set":{"name":req.body.name,"email":req.body.email,"type":"technicien","user_img":req.file.filename,"groupe_id":req.body.groupe_id}})
       .then(resultat=> console.log(resultat)) 
       
       // .then(() => res.status(201).json({
         //   message: 'User modified !',
         //   status: 201
         // }))
         .catch(error => res.status(400).json({
           error
         }));
 
 
 });











router.put('/:id/editUser',auth,multer({storage:storageEvents}).single("user_img") ,(req, res, next) => {
    
   
  const id=req.params.id;
  console.log(id);
       const user = new User({
         name: req.body.name,
         email: req.body.email,
         type:req.body.type,
         departement_id:req.body.departement_id,
         user_img:req.file.filename,
       });
 
       User.updateOne({"_id":id},{"$set":{"name":req.body.name,"prenom":req.body.prenom,"email":req.body.email,"tel":req.body.tel,"poste":req.body.poste,"departement_id":req.body.departement_id,"type":req.body.type,"user_img":req.file.filename}})
       .then(resultat=> console.log(resultat)) 
       
       // .then(() => res.status(201).json({
         //   message: 'User modified !',
         //   status: 201
         // }))
         .catch(error => res.status(400).json({
           error
         }));
 
 
 });
  

 
 router.get('/:id/getmembreofspecialite',userController.getTechniciensofthegroupe )
 
router.delete('/:id/deleteuser',auth,userController.delete)

router.get('/:id/getequipe',userController.getequipe )






//deleteusergroupe
router.put('/:id/:groupe/deleteusergroupe',userController.deleteusergroupe )




//////////////////////////////////////// Stats ////////////////////////////////////////
//router.get('/stats',auth, userController.getStats);
router.get('/stats',auth, userController.getStats);
//getStatsnombreTechnicien
router.get('/getStatsnombreTechnicien', userController.getStatsnombreTechnicien);
router.get('/getnombredeticketpertechnicien',userController.getnombredeticketpertechnicien);
router.get('/getnombredeticketcloturerpertechnicien',userController.getnombredeticketcloturerpertechnicien);
router.get('/getnombredetickettotalpertechnicien',userController.getnombredetickettotalpertechnicien);
router.get('/gettimeticketpertechnicien',userController.gettimeticketpertechnicien);
//getsitechdisponible
router.get('/getsitechdisponible',userController.getsitechdisponible);

module.exports = router;