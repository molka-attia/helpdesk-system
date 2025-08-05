const express = require('express');
const router = express.Router();
const User=require('./../models/User');
const Ticket=require('./../models/Ticket');
const Groupe=require('./../models/Groupe');
const Publication=require('./../models/Publication');
const bcrypt = require('bcrypt');
const userController = require('../controllers/admin/users');
const PublicationController = require('../controllers/technicien/publication');
const auth=require('../middlewares/auth');

router.post('/ajouterpublication',(req, res, next) => {
    const publication = new Publication({
  contenu: req.body.contenu,
  user_id:req.body.user_id,
  groupe_id:req.body.groupe_id,
  Datecreaation:new Date(),
});

publication.save()
  .then(() => res.status(201).json({
    message: 'Publication created !',
    status: 201
  }))
  .catch(error => res.status(400).json({
    error
  }));
})
// router.delete('/:id/deletegroupe',auth,GroupeController.deleteGroupe)
// router.put('/:id/modifiergroupe',auth,GroupeController.updateGroupe)

// router.get('/:id/getTechnicienspecialite',GroupeController.getTechnicienspecialite)



router.get('/getpublications',auth, PublicationController.getPublications);

router.get('/:id/getpublicationsgroupe', PublicationController.getPublicationsgroupe);

module.exports = router;