import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { TechnicienComponent } from './technicien.component';
import { AllTicketsComponent } from './all-tickets/all-tickets.component';
import { TechTicketsComponent } from './tech-tickets/tech-tickets.component';
import { MainDashTechnicienComponent } from './main-dash-technicien/main-dash-technicien.component';
import { PublicationComponent } from './publication/publication.component';
import { PublicationgroupeComponent } from './publicationgroupe/publicationgroupe.component';
import{DemandeComponent}from './demande/demande.component';
import { DemandeenvoyerComponent } from './demandeenvoyer/demandeenvoyer.component';



const routes: Routes = [{ path: '', component: TechnicienComponent },
{ path: 'all-tickets', component: AllTicketsComponent },
{ path: 'tech-tickets', component: TechTicketsComponent },
{ path: 'dash', component: MainDashTechnicienComponent },
{ path: 'publications', component: PublicationComponent },
{ path: 'publicationsgroupe', component: PublicationgroupeComponent },
{ path: 'demande', component: DemandeComponent },
{ path: 'demandeenvoyer', component:  DemandeenvoyerComponent },
];
@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class TechnicienRoutingModule { }
