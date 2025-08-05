import { Component, OnDestroy, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { Publication } from './publication.model';
import { publications } from './publications-list';
import { Commentaire } from './commentaire.model';
import { commentaires } from './commentaires-list';
import {TechnicienService } from '../../services/technicien.service';
import {AdminService } from '../../services/admin.service';
import { users } from '../../admin/user/users-list';
import { User } from '../../admin/user/user.model';
import { Location } from '@angular/common';
@Component({
  selector: 'app-publication',
  templateUrl: './publication.component.html',
  styleUrls: ['./publication.component.css']
})
export class PublicationComponent implements OnInit {
public show:string;  public publicationsList : Publication[] = publications;
public showTicketDetails = false;
public showTicketaffectation = false;
public currentpublication=publications[0];
public fetchedPublications=publications;
formaddCommentaire:FormGroup;
formaddPublication:FormGroup;
public currentcommentaire=commentaires[0];
public fetchedCommentaires=commentaires;

public fetchedTechniciens=users;
public user:User;
public tech:User;
public technicienaffecte:User;
public formclourer:FormGroup;
public showTicketcloturation = false;
 id:string;


constructor(public _router: Router, public _location: Location,private technicienService :TechnicienService,private adminService :AdminService, private route:ActivatedRoute,private router:Router) { }
technicienId = localStorage.getItem('user');
ngOnInit(): void {
  this.technicienService.getPublications().subscribe(
    (resultatTicket) => {
      this.fetchedPublications = resultatTicket;
       console.log(resultatTicket);
      
      // for(let publication of this.fetchedPublications){
      //   this.id=publication._id;
      //   // this.adminService.getUser(publication._id).subscribe(
      //   //   (resultat:any) => {
      //   //     console.log(resultat);
      //   //     this.fetchedTechniciens = resultat;
          
      //   //   });
        

      // }



    }  
    );

//
this.formaddCommentaire = new FormGroup({
  contenu: new FormControl(null,{validators:[Validators.required]}),
});

this.formaddPublication = new FormGroup({
  contenu: new FormControl(null,{validators:[Validators.required]}),
});



    this.adminService.getUser(JSON.parse(this.technicienId).userId).subscribe(
      (resultat:any) => {
        console.log(resultat);
        this.user = resultat;
      
      });
    
  }
 async onshow(id:string){
    if(this.show=='0'){
     this.show='1'+id;
   await  this.technicienService.getCommentaires(id).subscribe(
      (resultat:any) => {
        console.log(resultat);
        this.fetchedCommentaires = resultat;
      
      });
    }
    else{
      this.show='0';
    }
  }
onajout(id:string){
 // this.technicienService.addCommentaire(this.formaddCommentaire.value,JSON.parse(this.technicienId).userId,id)
 this.technicienService.addCommentaire(this.formaddCommentaire.value.contenu,JSON.parse(this.technicienId).userId,id)
 this._router.navigateByUrl("/refresh", { skipLocationChange: true }).then(() => {
  console.log(decodeURI(this._location.path()));
  this._router.navigate([decodeURI(this._location.path())]);
  });
// addCommentaire


}
onajoutPublication(){
  // this.technicienService.addCommentaire(this.formaddCommentaire.value,JSON.parse(this.technicienId).userId,id)
  this.technicienService.addPublication(this.formaddPublication.value.contenu,JSON.parse(this.technicienId).userId,"public")
 // addCommentaire
 this._router.navigateByUrl("/refresh", { skipLocationChange: true }).then(() => {
  console.log(decodeURI(this._location.path()));
  this._router.navigate([decodeURI(this._location.path())]);
  });
 
 }

}
