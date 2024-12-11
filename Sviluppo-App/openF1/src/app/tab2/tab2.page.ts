import { Component, inject } from '@angular/core';
import { IonHeader, IonToolbar, IonTitle, IonContent, IonList, IonItem, IonSkeletonText, IonCard, IonCardHeader, IonCardTitle, IonCardSubtitle, IonCardContent, IonButton, IonText } from '@ionic/angular/standalone';
import { ExploreContainerComponent } from '../explore-container/explore-container.component';
import { DriverService } from '../shared/services/driver.service';
import { driver } from '../shared/interfaces/driver';
import { AlertController } from '@ionic/angular';
import { catchError, of } from 'rxjs';

@Component({
  selector: 'app-tab2',
  templateUrl: 'tab2.page.html',
  styleUrls: ['tab2.page.scss'],
  standalone: true,
  imports: [IonText, IonButton, IonCardContent, IonCardSubtitle, IonCardTitle, IonCardHeader, IonCard, IonSkeletonText, IonItem, IonList, IonHeader, IonToolbar, IonTitle, IonContent, ExploreContainerComponent]
})
export class Tab2Page {

  isLoading = false;
  isError = false;
  drivers: driver[] = [];


  private _api = inject(DriverService);
  private _alertCtrl = inject(AlertController);

  constructor() {
    this._api.getDrivers({session_key: 'latest'}).pipe(catchError((err) => {
    this.isError = true;
    this.presentAlert(err.message)
    this.isLoading = false;
    return of([]);
  })).subscribe((data) =>{
    this.isLoading = true;
    this.drivers = data;
  })
  }
  OnRefreshPage() {
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



}
