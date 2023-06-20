import { LightningElement, wire, track } from 'lwc';
import getDevelopersWithMostProjects from '@salesforce/apex/DeveloperController.getDevelopersWithMostProjects';

export default class mvpDevs extends LightningElement {
    @track chartConfiguration;
    @wire(getDevelopersWithMostProjects, {})
 getOpportunigetDevelopersWithMostProjectsties({error, data}) {
  if (error) {
   this.error = error;
   console.log('error => ' + JSON.stringify(error));
   this.chartConfiguration = undefined;
  } else if (data) {
   let chartData = [];
   let chartLabels = [];
   data.forEach(opp => {
    chartData.push(opp.Total_Billable_Projects__c);
    chartLabels.push(opp.Name);
   });

   this.chartConfiguration = {
    type: 'bar',
    data: {
     labels: chartLabels,
     datasets: [
      {
       label: 'Total Billable Projects',
       barPercentage: 1,
       barThickness: 3,
       maxBarThickness: 4,
       minBarLength: 1,
       backgroundColor: "green",
       data: chartData,
      },
     ],
    },
    options: {
    },
   };
   console.log('data => ', data);
   this.error = undefined;
  }
 }
}