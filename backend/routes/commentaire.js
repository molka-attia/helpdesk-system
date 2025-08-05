const express = require('express');
const router = express.Router();
const User=require('./../models/User');
const Ticket=require('./../models/Ticket');
const Groupe=require('./../models/Groupe');

const Publication=require('./../models/Publication');
const Commentaire=require('./../models/Commentaire');
const bcrypt = require('bcrypt');
const userController = require('../controllers/admin/users');
const CommentaireController = require('../controllers/technicien/commentaire');
const auth=require('../middlewares/auth');

router.post('/ajoutercommentaire',(req, res, next) => {
    const commentaire = new Commentaire({
  contenu: req.body.contenu,
  user_id:req.body.user_id,
  publication_id:req.body.publication_id,
  Datecreaation:new Date(),
});

commentaire.save()
  .then(() => res.status(201).json({
    message: 'comment created !',
    status: 201
  }))
  .catch(error => res.status(400).json({
    error
  }));
})
// router.delete('/:id/deletegroupe',auth,GroupeController.deleteGroupe)
// router.put('/:id/modifiergroupe',auth,GroupeController.updateGroupe)

// router.get('/:id/getTechnicienspecialite',GroupeController.getTechnicienspecialite)



router.get('/:id/getCommentaires',auth, CommentaireController.getCommentaires);


module.exports = router;