const express = require('express');
const mongoose = require('mongoose');
const bodyParser = require('body-parser');
const cors = require("cors");
 const User= require('./models/User');
 const Groupe= require('./models/Groupe');
 const Publication= require('./models/Publication');
 const Commenaire= require('./models/Commentaire');
 const Demande= require('./models/Demande'); 
 const Departement=require('./models/Departement');
 const nodemailer = require("nodemailer");
 const webpush=require('web-push');
const path=require('path'); 

const details = require("./details.json");

const app = express();

const adminRouter=require('./routes/admin');
const authRouter = require('./routes/auth');
const ticketRouter = require('./routes/ticket');
const groupeRouter = require('./routes/groupe');
const publicationRouter = require('./routes/publication');
const commentaireRouter = require('./routes/commentaire');
const demandeRouter = require('./routes/demande');
const departementRouter = require('./routes/Departement');
//connecting to database
mongoose.connect('mongodb://localhost:27017/Pfe', {
    useNewUrlParser: true,
    useUnifiedTopology: true
  })
  .then(() => console.log('Connected successfully to MongoDB !'))
  .catch(() => console.log('Connection failed to MongoDB !'));




app.use((req,res,next)=>{
res.setHeader('Access-Control-Allow-Origin','*');
res.setHeader('Access-Control-Allow-Headers','Origin, X-Requested-With,Content, Accept ,Content-Type,Authorization');
res.setHeader('Access-Control-Allow-Methods','GET,POST,DELETE,PATCH,OPTIONS');
next();
});
app.use(bodyParser.json());

app.use(express.static(path.join(__dirname, "client")))

const publicVapidKey = "BMR6s1S_WmSfPMkNF_0zvSaCUIWQ6QOYeLkxu6ZMsEr7oCI310x-Hf2i8yeauXc8pwtezJS5qQc1tcviEkDsnoQ";

const privateVapidKey = "DhAotSLG-qyQIKlbws2LckNJ6Uk1IqSy6OHdK64-mGM";


// Set static path
app.use(express.static(path.join(__dirname, "client")));

app.use(bodyParser.json());



webpush.setVapidDetails(
  "mailto:test@test.com",
  publicVapidKey,
  privateVapidKey
);

// Subscribe Route
app.post("/subscribe", (req, res) => {
  // Get pushSubscription object
  const subscription = req.body;

  // Send 201 - resource created
  res.status(201).json({});

  // Create payload
  const payload = JSON.stringify({ title: "Push Test" });

  // Pass object into sendNotification
  webpush
    .sendNotification(subscription, payload)
    .catch(err => console.error(err));
});





// CORS Middleware
// //app.use(cors());
// const corsOptions ={
//   origin:["http://localhost:56881","http://localhost:4200"], 
//   credentials:true,            //access-control-allow-credentials:true
//   optionSuccessStatus:200
// }

// app.use(cors(corsOptions));


app.use(cors({ origin: "*" }));
app.use('/api/auth', authRouter);
app.use('/api/users',adminRouter);
app.use('/api/tickets',ticketRouter);
app.use('/api/groupe',groupeRouter);
app.use('/api/publication',publicationRouter);
app.use('/api/commentaire',commentaireRouter);
app.use('/api/demande',demandeRouter);
app.use('/api/departement',departementRouter);


app.post("/api/sendmail", (req, res) => {
  //console.log("request came");
  
 // let user = req.body;
  sendMail(req.body.email,req.body.name,req.body.password, info => {
    console.log(req.body.name);
    res.send(info);
  });
});

async function sendMail(user,name,password ,callback) {
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
    from: 'Carte assurance', // sender address
    to: user, // list of receivers
    subject: "notre technicien", // Subject line
    html: `<h1>salut `+name+`</h1><br>
    <h4>vous pouvez maintenant vous connecter en utilisant le mot de passe suivant `+password+`</h4>`
  };

  // send mail with defined transport object
  let info = await transporter.sendMail(mailOptions);

  callback(info);
}


app.post("/api/sendmailticket", (req, res) => {
  //console.log("request came");
  
 // let user = req.body;
  sendMailticket(req.body.email,req.body.name, info => {
    console.log(req.body.name);
    res.send(info);
  });
});

async function sendMailticket(user,name,callback) {
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
    from: 'Carte assurance', // sender address
    to: user, // list of receivers
    subject: "Nouveau Ticket", // Subject line
    html: `<h1>Bonsoir `+name+`</h1><br>
    <h4>Vous avez reçu un nouveau ticket ,merci de le consulter</h4>`
  };

  // send mail with defined transport object
  let info = await transporter.sendMail(mailOptions);

  callback(info);
}



app.post("/api/sendmailuser", (req, res) => {
  //console.log("request came");
  
 // let user = req.body;
  sendMailuser(req.body.email,req.body.name, info => {
    console.log(req.body.name);
    res.send(info);
  });
});

async function sendMailuser(user,name,callback) {
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
    from: 'Carte assurance', // sender address
    to: user, // list of receivers
    subject: "clôture de votre ticket", // Subject line
    html: `<h1>salut `+name+`</h1><br>
    <h4>nous sommes heureux de vous informer que votre problème a été résolu </h4>`
  };

  // send mail with defined transport object
  let info = await transporter.sendMail(mailOptions);

  callback(info);
}




module.exports = app;