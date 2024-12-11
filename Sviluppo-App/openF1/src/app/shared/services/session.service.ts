import { inject, Injectable } from '@angular/core';
import { ApiService } from './api.service';
import { sessions } from '../interfaces/session';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class SessionService {
  
  private _api = inject(ApiService);

  constructor() { }

  getSessions(attributes?: Partial<sessions>):Observable<sessions[]>{
    return this._api.apiGet<sessions>(`/sessions`, attributes);
  }

}
