import { Component } from '@angular/core';

@Component({
  selector: 'app-footer',
  imports: [],
  templateUrl: './footer.component.html',
  styleUrl: './footer.component.scss'
})
export class FooterComponent {
  currentYear = new Date().getFullYear();
  
  socialLinks = [
    { label: 'LinkedIn', url: 'https://www.linkedin.com/in/shivani-shaha/', icon: 'linkedin' },
    { label: 'GitHub', url: 'https://github.com/shivanishaha', icon: 'github' },
    { label: 'Email', url: 'mailto:shivani24.shaha@gmail.com', icon: 'envelope' }
  ];
}
