import { api, LightningElement, track, wire } from 'lwc';
import getRelated from '@salesforce/apex/relatedProjAssignmentsServices.getRelated';

const columns = [
    {label: 'Project Assignment Name', fieldName: 'Name', type: 'text'},
    {label: 'Project', fieldName: 'Project__r.Name', type: 'text'},
];

export default class RelatedProjAssignments extends LightningElement {
    @track projAssigns=[];
    @api recordId;
    columns = columns;
    error;

    connectedCallback() {
        getRelated({id: this.recordId})
        .then(response => {
            this.projAssigns = response;
            console.log('Success');
        })
        .catch(error => {
            console.log('Error: ' + error);
        });
    }
}