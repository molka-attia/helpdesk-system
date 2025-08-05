import { Component, OnDestroy, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { Groupe } from '../groupe/groupe.model';
import { groupes } from '../groupe/groupes-list';
import {AdminService } from '../../services/admin.service';
import { users } from '../user/users-list';
import { User } from '../user/user.model';
import { jsPDF } from "jspdf";
import * as jspdf from 'jspdf';
import html2canvas from 'html2canvas';

@Component({
  selector: 'app-statistique',
  templateUrl: './statistique.component.html',
  styleUrls: ['./statistique.component.css']
})
export class StatistiqueComponent implements OnInit {
  public showAddUserForm = false;
  public showMembreForm = false;
  public showaffecterForm = false;
  public showTicketDetails = false;
  public showTicketaffectation = false;
  public showEditGroupForm=false;
  //  public currentgroupe=groupes[0];
  public cuurentgroupe:string ;
  public fetchedTicket=groupes;
  public fetchedgroupecloturer=groupes;
  public fetchedTechniciens=users;
  public user:User;
  public technicienaffecte:User;
 // public listtechniciens :any;
  formajouter:FormGroup;
  formaddGroupe:FormGroup;
  formEditGroupe:FormGroup;

  constructor(private userService : AdminService, private route:ActivatedRoute,private router:Router) { }

  public currentuser=users[0];
  public fetchedUser=users;
  public fetchedUserTicket=users;
  public fetchedusertickettotal=users;
  public listtechniciens=users;

 ngOnInit(): void {
 
   this.userService.gettechnicienticketspercent().subscribe(
     (resultatUser) => {
       this.fetchedUser = resultatUser;
     
        console.log(resultatUser);
     }
   );
   
   this.userService.gettechnicienticketspercentallticket().subscribe(
    (resultatUser) => {
      this.fetchedUserTicket = resultatUser;
    
       console.log(resultatUser);
    }
  );
//gettechnicienticketstotalpercentallticket
this.userService.gettechnicienticketstotalpercentallticket().subscribe(
  (resultatUser) => {
    this.fetchedusertickettotal = resultatUser;
  
     console.log(resultatUser);
  }
);}
public openPDF(): void {
  let DATA: any = document.getElementById('htmlData');
  html2canvas(DATA).then((canvas) => {
    let fileWidth = 220;
    let fileHeight = (canvas.height * fileWidth) / canvas.width;
    const FILEURI = canvas.toDataURL('image/png');
    let PDF = new jsPDF('p', 'mm', 'a4');
    let position = 0;
    PDF.addImage(FILEURI, 'PNG', 0, position, fileWidth, fileHeight);
    PDF.save('performance des techniciens.pdf');
  });
}
}
