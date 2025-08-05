import { Component, OnDestroy, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { Demande } from './demande.model';
import { demandes } from './demandes-list';
import { Ticket } from '../tech-tickets/ticket.model';
import { tickets } from '../tech-tickets/tickets-list';
import {AdminService } from '../../services/admin.service';
import { users } from '../../admin/user/users-list';
import { User } from '../../admin/user/user.model';
import { TechnicienService } from 'src/app/services/technicien.service';
import { Location } from '@angular/common';
@Component({
  selector: 'app-demande',
  templateUrl: './demande.component.html',
  styleUrls: ['./demande.component.css']
})
export class DemandeComponent implements OnInit {
  public fetchedDemandes:any;
  public fetchedTicket=tickets;
  public fetchedtechniciens=users;
  public showTicketDetails = false;
  public ticketsList : Ticket[] = tickets;
public ticket:Ticket ;
  public showTicketaffectation = false;
  public currentticket=tickets[0];
  public demandetest:Demande;
  public fetchedTechniciens=users;
  public user:User;
  public technicienaffecte:User;
  public formclourer:FormGroup;
  public showTicketcloturation = false;
  technicienId = localStorage.getItem('user');
  formaddDemande:FormGroup;
  public showAddDemandeForm = false;
  public admin;
   constructor(public _router: Router, public _location: Location,private userService : AdminService,private techService : TechnicienService, private route:ActivatedRoute,private router:Router) { }

  ngOnInit(): void {
    const type = JSON.parse(localStorage.getItem('user')).type;
    if(type=="admin"){
      this.admin=true;
 
    }
    this.techService.getdemandes(JSON.parse(this.technicienId).userId).subscribe(
      (resultatTicket) => {
        this.fetchedDemandes = resultatTicket;
         console.log(resultatTicket);
      }  
      );
    
      this.formaddDemande = new FormGroup({
        contenu: new FormControl(null,{validators:[Validators.required]}),
        recepteur_id: new FormControl(null,{validators:[Validators.required]}),
        ticket_id: new FormControl(null,{validators:[Validators.required]}),
     //  type: new FormControl(null,{validators:[Validators.required]}),
     //  user_img: new FormControl(null,{validators:[Validators.required]}),
      });
      
}
async onClickShowForm(){
  this.showAddDemandeForm = true;
  await this.userService.getTicketsTech(JSON.parse(this.technicienId).userId).subscribe(
    (resultatTicket) => {
      this.fetchedTicket = resultatTicket;
       console.log(resultatTicket);
    }  
    );
    this.userService.getTechniciens().subscribe(
      (resultatUser) => {
        this.fetchedtechniciens = resultatUser;
         console.log(resultatUser);
      }

    );
}
onClickCloseForm(){
  this.showAddDemandeForm = false;
}
onAddSubmit(){

  


 this.techService.addDemande(this.formaddDemande.value.contenu,this.formaddDemande.value.recepteur_id,JSON.parse(this.technicienId).userId,this.formaddDemande.value.ticket_id);
  
  this.showAddDemandeForm= false;
 // this.router.navigate(['dash-respo/events']);
}


onClickShowForm2(idticket:string,demande){
  this.demandetest=demande;
  // this.userService.getoneticket(idticket).subscribe(
  //   (resultatUser) => {
  //     this.ticket = resultatUser;
  //      console.log(resultatUser);
  //   }
  
  // );
  this.userService.getUser(demande.user_tickets[0].demandeur).subscribe(
    (resultat:any) => {
      console.log(resultat);
      this.user = resultat;
    
    });
  this.showTicketDetails = true;
 // getoneticket(id:string)

  this.currentticket=this.ticket;
//ticket.opened="opened";

this.userService.getUser(this.currentticket.assignetech) .subscribe(
  (resultat:any) => {
    console.log(resultat);
    this.technicienaffecte = resultat;
  
  }
  );
}







onacceptdemande(id:string,ticket:string){

  if(this.admin==true){
    this.techService.repondredemande("acceptée",id);
   
  
    this.userService.EditAffecter("",ticket);
    this._router.navigateByUrl("/refresh", { skipLocationChange: true }).then(() => {
      console.log(decodeURI(this._location.path()));
      this._router.navigate([decodeURI(this._location.path())]);
      });
  }
  else  {
    this.techService.repondredemande("acceptée",id);
   
  
      this.userService.EditAffecter(JSON.parse(this.technicienId).userId,ticket);
      this._router.navigateByUrl("/refresh", { skipLocationChange: true }).then(() => {
        console.log(decodeURI(this._location.path()));
        this._router.navigate([decodeURI(this._location.path())]);
        });
    
    }
     

   
  
 
  //repondredemande(etat:string,id:string)
}
onClickCloseForm2(){
 
    
  this.showTicketDetails = false;
}
onrefusedemande(id:string){
  this.techService.repondredemande("refusée",id);
  this._router.navigateByUrl("/refresh", { skipLocationChange: true }).then(() => {
    console.log(decodeURI(this._location.path()));
    this._router.navigate([decodeURI(this._location.path())]);
    });
}
}