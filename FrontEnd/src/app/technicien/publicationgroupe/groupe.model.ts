
export interface Groupe {
    _id?: string;
    specialite?:string;
    membre_groupe?:Groupe[];
    numberOftickets?:number;
  
  }