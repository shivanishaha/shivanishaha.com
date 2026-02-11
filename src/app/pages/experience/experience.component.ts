import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';

interface WorkExperience {
  company: string;
  role: string;
  period: string;
  description: string[];
}

@Component({
  selector: 'app-experience',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './experience.component.html',
  styleUrls: ['./experience.component.scss']
})
export class ExperienceComponent {
  experiences: WorkExperience[] = [
    {
      company: 'Lockheed Martin',
      role: 'Software Engineer',
      period: 'July 2025 - Present',
      description: [
        'DBA for the F-35 program, managing and optimizing large-scale databases.',
        'Leading database performance tuning initiatives, resulting in a 30% improvement in query response times.',
      ]
    },
    {
      company: 'Lockheed Martin',
      role: 'Associate Software Engineer',
      period: 'Aug 2023 - June 2025',
      description: [
        'DBA for the F-35 program, managing and optimizing large-scale databases.',
      ]
    },
    {
      company: 'Expedia Group',
      role: 'Software Engineer Intern',
      period: 'June 2022 - Aug 2022',
      description: [
        'Kotlin backend development for the Expedia Group’s travel platform, enhancing search and booking functionalities.',
      ]
    }
  ];
}