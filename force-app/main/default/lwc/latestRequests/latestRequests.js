import { LightningElement, wire } from 'lwc';
import getLatestRequests from '@salesforce/apex/RequestsController.getLatestRequests';

export default class LatestRequests extends LightningElement {
    requests;
    error;

    @wire(getLatestRequests)
    wiredRequests({ error, data }) {
        if (data) {
            this.requests = data;
            this.error = undefined;
        } else if (error) {
            this.requests = undefined;
            this.error = error;
            console.error('Error retrieving latest requests:', error);
        }
    }

    get showData() {
        return this.requests && this.requests.length > 0;
    }
}