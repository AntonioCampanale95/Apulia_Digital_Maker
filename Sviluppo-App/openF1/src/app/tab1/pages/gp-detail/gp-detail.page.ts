import { CommonModule } from '@angular/common';
import { Component, inject } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { ActivatedRoute, Router, RouterModule } from '@angular/router';
import { IonContent, IonHeader, IonItem, IonLabel, IonSegment, IonSegmentButton, IonTitle, IonToolbar, IonButton, IonImg, IonButtons, IonBackButton } from '@ionic/angular/standalone';
import { sessions } from 'src/app/shared/interfaces/session';
import { SessionService } from 'src/app/shared/services/session.service';

export type SegmentMeetingDetail = 'sessions' | 'drivers';

@Component({
  selector: 'app-gp-detail',
  templateUrl: './gp-detail.page.html',
  styleUrls: ['./gp-detail.page.scss'],
  standalone: true,
  imports: [IonBackButton, IonButtons, IonImg, IonButton, IonItem, IonLabel, IonSegmentButton, IonSegment, IonContent, IonHeader, IonTitle, IonToolbar, CommonModule, FormsModule, RouterModule]
})
export class GpDetailPage {


  meetingKey: number;
  sessions: sessions[] = [];

  private _api = inject(SessionService);
  private _router = inject(Router);
  private _activatedRoute = inject(ActivatedRoute);

  constructor() {
    this.meetingKey = this._activatedRoute.snapshot.params['idMeeting'];
    this._api.getSessions({meeting_key : this.meetingKey}).subscribe((data) => {
      this.sessions = data;
    });
  }

  openDetailPage(sessionKey: string) {
    this._router.navigate([`/tabs/tab2/${sessionKey}`]);
  }


}
