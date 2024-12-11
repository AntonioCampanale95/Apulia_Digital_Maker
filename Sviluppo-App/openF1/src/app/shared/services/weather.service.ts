import { inject, Injectable } from '@angular/core';
import { ApiService } from './api.service';
import { map, Observable } from 'rxjs';
import { weather } from '../interfaces/weather';

@Injectable({
  providedIn: 'root'
})
export class WeatherService {

  _api = inject(ApiService);

  constructor() { }

  getLatestWeather(attributes?: Partial<weather>): Observable<weather> {
    return this._api.apiGet('/weather?session_key=latest', attributes).pipe(map((data) => data[data.length - 1]))
}
}
