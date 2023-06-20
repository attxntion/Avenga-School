import { LightningElement, wire } from 'lwc';
import getLatestProjects from '@salesforce/apex/ProjectController.getLatestProjects';

export default class LatestProjects extends LightningElement {
    projects;

    @wire(getLatestProjects)
    wiredProjects({ error, data}) {
        if(data) {
            this.projects = data;
        } else if(error) {
            console.error('Error retrieving latest projects:', error);
        }
    }
}