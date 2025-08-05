
import { Component, OnDestroy, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { Publication } from '../publication/publication.model';
import { publications } from '../publication/publications-list';
import { Commentaire } from '../publication/commentaire.model';
import { commentaires } from '../publication/commentaires-list';
import {TechnicienService } from '../../services/technicien.service';
import {AdminService } from '../../services/admin.service';
import { users } from '../../admin/user/users-list';
import { User } from '../../admin/user/user.model';
import { Groupe } from '../../admin/groupe/groupe.model';
import { groupes } from '../../admin/groupe/groupes-list';
import { Location } from '@angular/common';

@Component({
  selector: 'app-publicationgroupe',
  templateUrl: './publicationgroupe.component.html',
  styleUrls: ['./publicationgroupe.component.css']
})
export class PublicationgroupeComponent implements OnInit {
  public show:string;  public publicationsList : Publication[] = publications;
  public showTicketDetails = false;
  public showTicketaffectation = false;
  public currentpublication=publications[0];
  public fetchedPublications=publications;
  formaddCommentaire:FormGroup;
  formaddPublication:FormGroup;
  public currentcommentaire=commentaires[0];
  public fetchedCommentaires=commentaires;
  public fetchedgroupes=groupes;
  public fetchedgroupestech:User;
  public fetchedTechniciens=users;
  public user:User;
  public tech:User;
  public technicienaffecte:User;
  public formclourer:FormGroup;
  public formflitrer:FormGroup;
  public showTicketcloturation = false;
   id:string;
   public groupeid:string;
  public admin;
  public technicien;
  public valeurtest;
  public currentgroupe;

  
  constructor(public _router: Router, public _location: Location,private technicienService :TechnicienService,private adminService :AdminService, private route:ActivatedRoute,private router:Router) { }
  technicienId = localStorage.getItem('user');
  ngOnInit(): void {
    this.id=JSON.parse(this.technicienId).userId;
    this.adminService.getUser(JSON.parse(this.technicienId).userId).subscribe(
      (resultat:any) => {
        console.log(resultat);
        this.user = resultat;
        if(type=="admin"){
        this.adminService.getGroupes().subscribe(
          (resultatTicket) => {
            this.fetchedgroupes = resultatTicket;
             console.log(resultatTicket);
             this.technicienService. getPublicationsgroupe(this.fetchedgroupes[0]._id).subscribe(
              (resultatTicket) => {
                this.fetchedPublications = resultatTicket;
                 console.log(resultatTicket);
          }  
          );




          
      
    

        
        // for(let publication of this.fetchedPublications){
        //   this.id=publication._id;
        //   // this.adminService.getUser(publication._id).subscribe(
        //   //   (resultat:any) => {
        //   //     console.log(resultat);
        //   //     this.fetchedTechniciens = resultat;
            
        //   //   });
          
  
        // }
      });}
      if(type=="technicien"){
      this.adminService.getgroupestech(JSON.parse(this.technicienId).userId).subscribe(
        (resultatTicket) => {
          this.fetchedgroupestech = resultatTicket;
           console.log(resultatTicket);
           this.technicienService. getPublicationsgroupe(this.fetchedgroupestech.groupe_membre[0]._id).subscribe(
            (resultatTicket) => {
              this.fetchedPublications = resultatTicket;
               console.log(resultatTicket);
        }  
        );




        
    
  

      
      // for(let publication of this.fetchedPublications){
      //   this.id=publication._id;
      //   // this.adminService.getUser(publication._id).subscribe(
      //   //   (resultat:any) => {
      //   //     console.log(resultat);
      //   //     this.fetchedTechniciens = resultat;
          
      //   //   });
        

      // }
    });
      }
      }  
      );
  
  //
  const type = JSON.parse(localStorage.getItem('user')).type;
  if(type=="admin"){
    this.admin=true;

  }
  if(type=="technicien"){
    this.technicien=true;
  }
  this.formaddCommentaire = new FormGroup({
    contenu: new FormControl(null,{validators:[Validators.required]}),
  });
  
  this.formaddPublication = new FormGroup({
    contenu: new FormControl(null,{validators:[Validators.required]}),
  });
  
  this.formflitrer = new FormGroup({
    groupe_id : new FormControl(null,{validators:[Validators.required]}),
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



    onefiltrerSubmit(){
      this.currentgroupe=this.formflitrer.value.groupe_id;
      this.technicienService. getPublicationsgroupe(this.formflitrer.value.groupe_id).subscribe(
        (resultatTicket) => {
          this.fetchedPublications = resultatTicket;
           console.log(resultatTicket);
     
          
  
        });
    
    
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

       // if(this.admin==true){
          this.technicienService.addPublication(this.formaddPublication.value.contenu,JSON.parse(this.technicienId).userId,this.currentgroupe)
          this._router.navigateByUrl("/refresh", { skipLocationChange: true }).then(() => {
            console.log(decodeURI(this._location.path()));
            this._router.navigate([decodeURI(this._location.path())]);
            });
   
   
          //  }
  // else{
  //  this.technicienService.addPublication(this.formaddPublication.value.contenu,JSON.parse(this.technicienId).userId,this.user.groupe_id)
      
  // }
   // addCommentaire
   
   }
  
  }
  