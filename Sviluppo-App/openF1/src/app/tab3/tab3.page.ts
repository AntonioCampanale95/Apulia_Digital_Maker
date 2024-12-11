import { Component, inject } from '@angular/core';
import { IonHeader, IonToolbar, IonTitle, IonContent } from '@ionic/angular/standalone';
import { ExploreContainerComponent } from '../explore-container/explore-container.component';
import { WeatherService } from '../shared/services/weather.service';
import { CommonModule } from '@angular/common';
import { GrandPrixService } from '../shared/services/grand-prix.service';
import { grandPrix } from '../shared/interfaces/grand-prix';

@Component({
  selector: 'app-tab3',
  templateUrl: 'tab3.page.html',
  styleUrls: ['tab3.page.scss'],
  standalone: true,
  imports: [IonHeader, IonToolbar, IonTitle, IonContent, ExploreContainerComponent, CommonModule],
})
export class Tab3Page {

  weatherData: any;
  gp: grandPrix[] = [];

  private gpService = inject(GrandPrixService);

  private weatherService = inject(WeatherService);

  constructor() {
    this.weatherService.getLatestWeather().subscribe((data) => {
      this.weatherData = data;
      console.log(data);
    });
    this.gpService.getLatestGP().subscribe((data) => {
      this.gp = data;
      console.log(data)
    });
  }

   getTrackName(): string {
    return this.gp.length > 0 ? this.gp[0].meeting_official_name : 'N/A';
  }

  

}
