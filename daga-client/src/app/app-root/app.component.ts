import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { VERSION } from '../../version';

@Component({
  selector: 'app-root',
  imports: [RouterOutlet],
  templateUrl: './app.component.html',
  styleUrl: './app.component.scss',
})
export class AppComponent {
  version = VERSION;
}
