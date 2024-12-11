import { Component, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { IonContent, IonSelect, IonSelectOption, IonHeader, IonTitle, IonToolbar, IonItem, IonCard, IonCardHeader, IonCardSubtitle, IonCardTitle, IonCardContent, IonLabel, IonList, IonSegmentButton, IonSegment, IonImg, IonButtons, IonBackButton } from '@ionic/angular/standalone';
import { SessionService } from 'src/app/shared/services/session.service';
import { DriverService } from 'src/app/shared/services/driver.service';
import { ActivatedRoute} from '@angular/router';
import { sessions } from 'src/app/shared/interfaces/session';
import { driver } from 'src/app/shared/interfaces/driver';
import { PositionService } from 'src/app/shared/services/position.service';
import { ChartModule } from 'primeng/chart';

export type SegmentSessionDetail = 'sessions' | 'drivers';

@Component({
  selector: 'app-session-detail',
  templateUrl: './session-detail.page.html',
  styleUrls: ['./session-detail.page.scss'],
  standalone: true,
  imports: [IonBackButton, IonButtons, IonImg, IonSegment, IonSegmentButton, IonList, IonLabel, ChartModule, IonCardContent, IonCardTitle, IonSelect, IonSelectOption, IonCardSubtitle, IonCardHeader, IonCard, IonItem, IonContent, IonHeader, IonTitle, IonToolbar, CommonModule, FormsModule]
})
export class SessionDetailPage {

  segmentValue: 'sessions' | 'drivers' = 'sessions';

  private _api = inject(SessionService);
  private _apiPosition = inject(PositionService);
  private _driverService = inject(DriverService);
  private _activatedRoute = inject(ActivatedRoute);

  topDrivers: { driver_number: number; full_name: string; position: number }[] = []; // Primi 3 piloti

  sessions: sessions[] = [];
  drivers: driver[] = [];
  selectedDrivers: number[] = [];
  sessionKey: number;
  data: any;
  options = {
    responsive: true,
    plugins: {
      legend: {
        position: 'top',
      },
    },
    scales: {
      x: {
        title: {
          display: true,
          text: 'Tempo',
        },
      },
      y: {
        title: {
          display: true,
          text: 'Posizione',
        },
      },
    },
  };

  constructor() {
    this.sessionKey = this._activatedRoute.snapshot.params['idSession'];
    this._api.getSessions({ session_key: this.sessionKey }).subscribe((data) => {
      this.sessions = data;
    });
    this._driverService.getDrivers({ session_key: this.sessionKey }).subscribe((data) => {
      this.drivers = data;
      
    });
   }



   onDriversChange(event: any) {
    this.selectedDrivers = event.detail.value;
    this.loadDriversPosition();
   }

   loadDriversPosition() {
    if (this.selectedDrivers.length === 0) {
      this.data = null;
      return;
    }

    const datasets: { label: string, data: number[], fill: boolean, borderColor: string, tension: number }[] = [];

    const driverMap = new Map<number, string>();
  this.drivers.forEach(driver => {
    driverMap.set(driver.driver_number, driver.last_name);
  });

    this.selectedDrivers.forEach((driverNumber) => {
      this._apiPosition.getDriverPosition({ session_key: this.sessionKey, driver_number: driverNumber}).subscribe((positions) => {
        const labels = positions.map(pos => new Date(pos.date).toLocaleTimeString());
        const dataSet = positions.map(pos => pos.position);

        datasets.push({
          label: driverMap.get(driverNumber) || `Pilota ${driverNumber}`,
          data: dataSet,
          fill: false, 
          borderColor: this.getRandomColor(),
          tension: 0.4
        });
        if (datasets.length === this.selectedDrivers.length) {
          this.data = {
            labels: labels,
            datasets: datasets
          };
        }
      });
    });
   }

   onSegmentChange(event: any) {
    this.segmentValue = event.detail.value as SegmentSessionDetail;
  }


   getRandomColor(): string {
    const letters = '0123456789ABCDEF';
    let color = '#';
    for (let i=0; i<6; i++) {
      color += letters[Math.floor(Math.random()*16)];
    }
    return color;
   }

}