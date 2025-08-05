import { Ticket } from "src/app/admin/ticket/ticket.model";

export interface Demande {
    _id?: string;
    contenu?:string;
    recepteur_id?:string;
    emetteur_id?:string;
    ticket_id?:string;
    etat?:string;
    Datecreaation?:Date;
    Datereponse?:Date;
    user_tickets?:Ticket[];
  }
  

  /*  contenu: {type: String, required: false},
    recepteur_id: {type:mongoose.Schema.ObjectId, required: false},
    emetteur_id: {type: String, required: false},
    ticket_id: {type: String, required: false},
    etat: {type: String, required: false},
    Datecreaation:{type: Date, required: false},
    Datereponse:{type: Date, required: false}, */