import { User } from "src/app/admin/user/user.model";
import { Userpublication } from "./user_publication.model";
export interface Publication{
  _id?: string;
  contenu?:string;
  user_id?:string;
 // user_img?:string;
 groupe_id?:string;
 Datecreaation?:Date;
 user_publication?:User;
 

}


/* contenu: {type: String, required: false},
    user_id: {type: String, required: false},
    groupe_id: {type: String, required: false},
 
    Datecreaation:{type: Date, required: false}, */