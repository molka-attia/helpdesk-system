import { User } from "src/app/admin/user/user.model";
export interface Commentaire {
  _id?: string;
  contenu?:string;
  user_id?:string;
 // user_img?:string;
 publication_id?:string;
 Datecreaation?:Date;
 user_commentaire?:User;

}


/* contenu: {type: String, required: false},
    user_id: {type: String, required: false},
    groupe_id: {type: String, required: false},
 
    Datecreaation:{type: Date, required: false}, */