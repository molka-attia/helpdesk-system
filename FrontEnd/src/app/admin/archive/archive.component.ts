import { Component, OnInit ,AfterViewInit, ViewChild, ElementRef } from '@angular/core';
import { HttpClient } from '@angular/common/http';

import {MatPaginator} from '@angular/material/paginator';
import {MatSort} from '@angular/material/sort';
import {MatTableDataSource} from '@angular/material/table';
//import {MatPaginatorModule} from '@angular/material/paginator';


import { FormControl, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { Ticket } from './ticket.model';
import { tickets } from './tickets-list';
import {AdminService } from '../../services/admin.service';
import { users } from '../user/users-list';
import { User } from '../user/user.model';
import { jsPDF } from "jspdf";
import * as jspdf from 'jspdf';
import html2canvas from 'html2canvas';
@Component({
  selector: 'app-archive',
  templateUrl: './archive.component.html',
  styleUrls: ['./archive.component.css']
})
export class ArchiveComponent implements OnInit {
  public ticketsList : Ticket[] = tickets;
  public showTicketDetails = false;
  public showTicketaffectation = false;
  public currentticket=tickets[0];
  public fetchedTicket=tickets;
  public fetchedTechniciens=users;
  public user:User;
  public technicienaffecte:User;
  public listtechniciens=users;
  formAffecter:FormGroup;


  // ngOnInit(): void {
  //   this.userService.getTicketscloturer().subscribe(
  //     (resultatTicket) => {
  //       this.fetchedTicket = resultatTicket;
  //        console.log(resultatTicket);
  //     }  
  //     );

  formclourer:FormGroup;
  formaddTicket:FormGroup;
  formeditTicket:FormGroup;
  public formflitrer:FormGroup;
  public showAddUserForm = false;

  public showEditTicketForm = false;
  public technicieninformer:User;
  public  date:Date;
  userType:string;
  technicienId = localStorage.getItem('user');
  fetchedgroupes: any;
  ngOnInit(): void {
    this.date=new Date();
     this.userType = JSON.parse(localStorage.getItem('user')).type;
    this.userService.getGroupes().subscribe(
      (resultatTicket) => {
        this.fetchedgroupes = resultatTicket;
         console.log(resultatTicket);
      //    this.technicienService. getPublicationsgroupe(this.fetchedgroupes[0]._id).subscribe(
      //     (resultatTicket) => {
      //       this.fetchedPublications = resultatTicket;
      //        console.log(resultatTicket);
      // }  
  // );
      });


   this.userService.getTicketscloturer().subscribe(
      (resultatTicket) => {
        this.fetchedTicket = resultatTicket;
         console.log(resultatTicket);
      }  
      );

    // this.userService.getTickets().subscribe(
    //   (resultatTicket) => {
    //     this.fetchedTicket = resultatTicket;
    //    // this.dtTrigger.next();
    //      console.log(resultatTicket);
    //   }  
    //   );
      
      this.formAffecter = new FormGroup({
        technicienid: new FormControl(null,{validators:[Validators.required]}),
 
      });
      this.formclourer = new FormGroup({
        note: new FormControl(null,{validators:[Validators.required]}),
 
      });
      this.formaddTicket = new FormGroup({
        description: new FormControl(null,{validators:[Validators.required]}),
        priorite: new FormControl(null,{validators:[Validators.required]}),
        specialite: new FormControl(null,{validators:[Validators.required]}),
      });
      this.formeditTicket = new FormGroup({
        description: new FormControl(null,{validators:[Validators.required]}),
        priorite: new FormControl(null,{validators:[Validators.required]}),
        specialite: new FormControl(null,{validators:[Validators.required]}),
     
      });
      this.formflitrer = new FormGroup({
        groupe_id : new FormControl(null,{validators:[Validators.required]}),
      });
      
  }
  displayedColumns: string[] = ['spécialité','description', 'Priorité','Date de cloturation','Date de création','consulter'];
  dataSource: MatTableDataSource<Ticket>;

 



  // @ViewChild('content') content: ElementRef;
  // public SavePDF(): void {
  //   let DATA: any = document.getElementById('htmlData');
  //   html2canvas(DATA).then((canvas) => {
  //     let fileWidth = 208;
  //     let fileHeight = (canvas.height * fileWidth) / canvas.width;
  //     const FILEURI = canvas.toDataURL('image/png');
  //     let PDF = new jsPDF('p', 'mm', 'a4');
  //     let position = 0;
  //     PDF.addImage(FILEURI, 'PNG', 0, position, fileWidth, fileHeight);
  //     PDF.save('angular-demo.pdf');
  //   });
//     let content=this.content.nativeElement;
//     let doc = new jsPDF();
//     let _elementHandlers =
//     {
//       '#editor':function(element,renderer){
//         return true;
//          }
//     };
//     // doc.fromHTML(content.innerHTML,15,15,{

//     //   'width':190,
//     //   'elementHandlers':_elementHandlers
//     // });
    
// doc.html(content.innerHtml, {
//   callback: function (doc) {
//   //  doc.save();
//   doc.save('test.pdf');
//   }})

   
  

  //}  
  public openPDF(): void {
    let DATA: any = document.getElementById('htmlData');
    html2canvas(DATA).then((canvas) => {
      let fileWidth = 240;
      let fileHeight = (canvas.height * fileWidth) / canvas.width;
      const FILEURI = canvas.toDataURL('image/png');
      let PDF = new jsPDF('p', 'mm', 'a4');
      let position = 0;
      PDF.addImage(FILEURI, 'PNG', 0, position, fileWidth, fileHeight);
      PDF.save('Liste des tickets cloturés.pdf');
    });
  }
  constructor(private userService : AdminService, private route:ActivatedRoute) {
    // Create 100 users
   // const users = Array.from({length: 100}, (_, k) => createNewUser(k + 1));
    this.userService.getTicketscloturer().subscribe(
      (resultatTicket) => {
        this.fetchedTicket = resultatTicket;
       // this.dtTrigger.next();
       this.dataSource = new MatTableDataSource(this.fetchedTicket);
       this.dataSource.paginator = this.paginator;
         console.log(resultatTicket);
      }  
      );
      
      
    // Assign the data to the data source for the table to render
    
  }
  @ViewChild(MatPaginator) paginator: MatPaginator;
  @ViewChild(MatSort) sort: MatSort;
  ngAfterViewInit() {
    this.dataSource.paginator = this.paginator;
    this.dataSource.sort = this.sort;
  }

  onefiltrerSubmit(){
    this.userService.getTicketscloturerfiltrer(this.formflitrer.value.groupe_id).subscribe(
      (resultatTicket) => {
        this.fetchedTicket = resultatTicket;
       // this.dtTrigger.next();
       this.dataSource = new MatTableDataSource(this.fetchedTicket);
       this.dataSource.paginator = this.paginator;
         console.log(resultatTicket);
      }  
      );


//getTicketsfiltrer(id:String)


    // this.currentgroupe=this.formflitrer.value.groupe_id;
    // this.technicienService. getPublicationsgroupe(this.formflitrer.value.groupe_id).subscribe(
    //   (resultatTicket) => {
    //     this.fetchedPublications = resultatTicket;
    //      console.log(resultatTicket);
   
        

    //   });
    }







  // onCloturerTiket(userId:string){

  //   this.userService.EditCloturer(this.formclourer.value.note,userId);
  //   this.showTicketcloturation = false;
  //   this.showTicketDetails = false
   
  // }

  oneEditAffecter(userId:string){

    this.userService.EditAffecter(this.formAffecter.value.technicienid,userId);
    this.userService.getUser(this.formAffecter.value.technicienid) .subscribe(
      (resultat:any) => {
        console.log(resultat);
        this.technicieninformer = resultat;
       // this.userService.envoyermailechinformer(resultat);
      });
    this.showTicketaffectation = false;

   
  }
  
  onClickShowForm2(ticket:Ticket){
    this.showTicketDetails = true;
    this.currentticket=ticket;

this.userService.getUser(this.currentticket.demandeur) .subscribe(
  (resultat:any) => {
    console.log(resultat);
    this.user = resultat;
  
  });
  this.userService.getUser(this.currentticket.assignetech) .subscribe(
    (resultat:any) => {
      console.log(resultat);
      this.technicienaffecte = resultat;
    
    }
    );
  }
  onClickCloseForm2(){
 
    
    this.showTicketDetails = false;
  }

  async onClickShowAffecter(ticket:Ticket){
    this.showTicketaffectation = true;
    this.currentticket=ticket;
      await    this.userService.getTechniciens().subscribe(
        (resultatTicket) => {
          this.listtechniciens = resultatTicket;
           console.log(resultatTicket);
        }  
        );
     // this.router.navigate(['dash-respo/events']);
   

  }


  // onClickShowcloturation(ticket:Ticket){
  //   this.showTicketDetails = false;
  //   this.showTicketcloturation = true;
  //   this.currentticket=ticket;
      
  //    // this.router.navigate(['dash-respo/events']);
   

  // }
  onAddSubmit(){
    this.userService.addTicket(this.formaddTicket.value.description,this.formaddTicket.value.priorite,this.formaddTicket.value.specialite,JSON.parse(this.technicienId).userId);
     this.showAddUserForm = false;
    // this.router.navigate(['dash-respo/events']);
   }
  // onClickClosecloturation(){
  //   this.showTicketcloturation = false;
  // }
  onClickCloseAffecter(){
    this.showTicketaffectation = false;
  }
  onDeleteTiket(user:string){
    // this.route.paramMap.subscribe(params=>{
      // const userId=params.get("id");
      // const userId=id;
      //  console.log(user.id)
      //  this.currentuser=user;
       this.userService.DeleteTicket(user);
    //this.router.navigate(['admin/user']);
  // })
  }



  onEditSubmit(user:string){
     
    this.userService.EditTicket(this.formeditTicket.value.description,this.formeditTicket.value.priorite,this.formeditTicket.value.specialite,user);
     this.showEditTicketForm = false;
    // this.router.navigate(['dash-respo/events']);
   }
   onClickCloseFormEdit(){
     this.showEditTicketForm = false;
   }


  // onClickShowForm(){
  //   this.showAddUserForm = true;
  //   this.userService.getGroupes().subscribe(
  //     (resultatTicket) => {
  //       this.fetchedgroupes = resultatTicket;
  //        console.log(resultatTicket);
  //     }  
  //     );
  // }
  onClickCloseForm(){
    this.showAddUserForm = false;
  } 
  // onClickShowFormEdit(){
  //   this.userService.getGroupes().subscribe(
  //     (resultatTicket) => {
  //       this.fetchedgroupes = resultatTicket;
  //        console.log(resultatTicket);
  //     }  
  //     );
  
  //   this.showTicketDetails = false;
   
  //   this.showEditTicketForm = true;
  //   //this.id=user;
  // }
 

  applyFilter(event: Event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();

    if (this.dataSource.paginator) {
      this.dataSource.paginator.firstPage();
    }
  }
}


/** Builds and returns a new User. */
// function createNewUser(id: number): UserData {
//   const name =
//     NAMES[Math.round(Math.random() * (NAMES.length - 1))] +
//     ' ' +
//     NAMES[Math.round(Math.random() * (NAMES.length - 1))].charAt(0) +
//     '.';
  

//   return {
//     spécialité: id.toString(),
//     Description: name,
//     Priorité: Math.round(Math.random() * 100).toString(),
//     affecter: FRUITS[Math.round(Math.random() * (FRUITS.length - 1))],
//     Datedecréation:FRUITS[Math.round(Math.random() * (FRUITS.length - 1))],
//   };
// } 




 








//       this.formAffecter = new FormGroup({
//         technicienid: new FormControl(null,{validators:[Validators.required]}),
 
//       });
    
      
//   }
//   // onCloturerTiket(userId:string){

//   //   this.userService.EditCloturer(userId);
//   //   this.showTicketDetails = false
   
//   // }

//   oneEditAffecter(userId:string){

//     this.userService.EditAffecter(this.formAffecter.value.technicienid,userId);
//     this.showTicketaffectation = false;
   
//   }
  
//   onClickShowForm2(ticket:Ticket){
//     this.showTicketDetails = true;
//     this.currentticket=ticket;
// ticket.opened="opened";
// this.userService.getUser(this.currentticket.demandeur) .subscribe(
//   (resultat:any) => {
//     console.log(resultat);
//     this.user = resultat;
  
//   });
//   this.userService.getUser(this.currentticket.assignetech) .subscribe(
//     (resultat:any) => {
//       console.log(resultat);
//       this.technicienaffecte = resultat;
    
//     }
//     );
//   }
//   onClickCloseForm2(){
 
    
//     this.showTicketDetails = false;
//   }

//   async onClickShowAffecter(ticket:Ticket){
//     this.showTicketaffectation = true;
//     this.currentticket=ticket;
//       await    this.userService.getTechniciens().subscribe(
//         (resultatTicket) => {
//           this.listtechniciens = resultatTicket;
//            console.log(resultatTicket);
//         }  
//         );
//      // this.router.navigate(['dash-respo/events']);
   

//   }
//   onClickCloseAffecter(){
//     this.showTicketaffectation = false;
//   }
//   onDeleteTiket(user:string){
//     // this.route.paramMap.subscribe(params=>{
//       // const userId=params.get("id");
//       // const userId=id;
//       //  console.log(user.id)
//       //  this.currentuser=user;
//        this.userService.DeleteTicket(user);
//        this.showTicketDetails = false;
//     //this.router.navigate(['admin/user']);
//   // })
//   }
// }

