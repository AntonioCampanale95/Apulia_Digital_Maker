import { inject, Injectable } from '@angular/core';
import { ApiService } from './api.service';
import { driver } from '../interfaces/driver';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class DriverService {

  private _api = inject(ApiService);

  constructor() { }

  getDrivers(attributes?: Partial<driver>):Observable<driver[]>{
    return this._api.apiGet<driver>(`/drivers`, attributes);
  }

}
