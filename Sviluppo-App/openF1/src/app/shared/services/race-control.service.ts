import { inject, Injectable } from '@angular/core';
import { ApiService } from './api.service';
import { RaceControl } from '../interfaces/race-control';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class RaceControlService {

  private _api = inject(ApiService);

  constructor() { }

  getRaceControl(attributes?: Partial<RaceControl>):Observable<RaceControl[]>{
    return this._api.apiGet<RaceControl>(`/race_control`, attributes);
  }

  getLatestRaceControl(attributes?: Partial<RaceControl>): Observable<RaceControl[]>{
    return this._api.apiGet<RaceControl>('/race_control?session_key=latest', attributes);
  }


}
