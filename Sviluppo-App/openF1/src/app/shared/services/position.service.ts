import { inject, Injectable } from '@angular/core';
import { ApiService } from './api.service';
import { map, Observable } from 'rxjs';
import { Position } from '../interfaces/position';

@Injectable({
  providedIn: 'root'
})
export class PositionService {

  _api = inject(ApiService);

  constructor() { }

  getDriverPosition(attributes? : Partial<Position>) : Observable<Position[]>{
    return this._api.apiGet<Position>('position', attributes);
  }


}
