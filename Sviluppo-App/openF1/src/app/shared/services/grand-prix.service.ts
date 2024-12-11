import { inject, Injectable } from '@angular/core';
import { ApiService } from './api.service';
import { Observable } from 'rxjs';
import { grandPrix } from '../interfaces/grand-prix';

@Injectable({
  providedIn: 'root'
})
export class GrandPrixService {
  
  private _api = inject(ApiService);

  constructor() { }

  getGrandPrix(attributes?: Partial<grandPrix>):Observable<grandPrix[]>{
    return this._api.apiGet<grandPrix>(`/meetings`, attributes);
  }

  getLatestGP(attributes?: Partial<grandPrix>): Observable<grandPrix[]>{
    return this._api.apiGet<grandPrix>('/meetings?meeting_key=latest', attributes);
  }


}
