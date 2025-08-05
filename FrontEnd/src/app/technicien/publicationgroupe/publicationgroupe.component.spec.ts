import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PublicationgroupeComponent } from './publicationgroupe.component';

describe('PublicationgroupeComponent', () => {
  let component: PublicationgroupeComponent;
  let fixture: ComponentFixture<PublicationgroupeComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ PublicationgroupeComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(PublicationgroupeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
