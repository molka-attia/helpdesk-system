import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DemandeenvoyerComponent } from './demandeenvoyer.component';

describe('DemandeenvoyerComponent', () => {
  let component: DemandeenvoyerComponent;
  let fixture: ComponentFixture<DemandeenvoyerComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ DemandeenvoyerComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(DemandeenvoyerComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
