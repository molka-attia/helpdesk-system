const express = require('express');
const router = express.Router();
const User=require('./../models/User');
const Ticket=require('./../models/Ticket');
const Demande=require('./../models/Demande');
const bcrypt = require('bcrypt');
const userController = require('../controllers/admin/users');
const ticketController = require('../controllers/admin/tickets');
const demandeController = require('../controllers/technicien/demande');
const auth=require('../middlewares/auth');

const multer = require('multer');
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
router.get('/:id/getdemandes', demandeController.getDemandes);
//
router.get('/:id/getdemandesenvoyer', demandeController.getDemandesenvoyer);


router.post('/ajouterDemande',(req, res, next) => {
        const demande = new Demande({
            contenu: req.body.contenu,
            recepteur_id:req.body.recepteur_id,
            emetteur_id:req.body.emetteur_id,
            ticket_id:req.body.ticket_id,
            etat:"pending",
            Datecreaation:new Date(),
            Datereponse:""
    });
  
    demande.save()
      .then(() => res.status(201).json({
        message: 'request created !',
        status: 201
      }))
      .catch(error => res.status(400).json({
        error
      }));
  })

   router.put('/:id/repondredemande',auth,demandeController.repondredemande)



   //////////////////////////stat/////////////////////////////////
   router.get('/:id/statsdemande', demandeController.getStats);
   //getStatsemetteur
   router.get('/:id/Statsemetteur', demandeController.getStatsemetteur); 

module.exports = router;