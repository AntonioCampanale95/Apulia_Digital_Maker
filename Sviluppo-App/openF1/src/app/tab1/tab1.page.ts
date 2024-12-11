import { Component, inject } from '@angular/core';
import { IonHeader, IonToolbar, IonTitle, IonContent, IonItem, IonLabel, IonList, IonButton, IonSelect, IonSelectOption, IonCard, IonCardContent, IonCardHeader, IonCardTitle, IonCardSubtitle } from '@ionic/angular/standalone';
import { ExploreContainerComponent } from '../explore-container/explore-container.component';
import { GrandPrixService } from '../shared/services/grand-prix.service';
import { grandPrix } from '../shared/interfaces/grand-prix';
import { Router, RouterModule } from '@angular/router';
import { AlertController } from '@ionic/angular';
import { catchError, of } from 'rxjs';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-tab1',
  templateUrl: 'tab1.page.html',
  styleUrls: ['tab1.page.scss'],
  standalone: true,
  imports: [IonCardSubtitle, IonCardTitle, IonCardHeader, IonCardContent, IonCard, IonButton, IonList, IonLabel, IonItem, IonHeader, IonToolbar, IonTitle, IonContent, ExploreContainerComponent, IonSelect, IonSelectOption, RouterModule, FormsModule],
})
export class Tab1Page {

  isLoading = false;
  isError = false;

  years: number[] = [];
  selectedYear: number | null = null;
  grandPrix: grandPrix[] = [];

  private _api = inject(GrandPrixService);
  private _alertCtrl = inject(AlertController);
  private _router = inject(Router);

  constructor() {
    this._api.getGrandPrix().pipe(catchError((err) => {
    this.isError = true;
    this.presentAlert(err.message);
    this.isLoading = false;
    return of([]);
  })
  ).subscribe((data) => {
    this.isLoading = false;
    this.grandPrix = data;
    this.years = Array.from(new Set(data.map(gp => gp.year))).sort((a,b) => b - a);
  });
}

OnRefreshPage(){
  location.reload();
}
async presentAlert(message: string) {
  const alert = await this._alertCtrl.create({
    header: 'OPS',
    message: `Si è verificato un errore: ${message}`,
    buttons: ['OK'],
  });
  await alert.present();
}

getFilteredGrandPrix() {
  if (this.selectedYear) {
    return this.grandPrix.filter(gp => gp.year === this.selectedYear);

  }
  return this.grandPrix;
}
}
