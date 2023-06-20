import { LightningElement, wire } from 'lwc';
import getProfitableCustomers from '@salesforce/apex/profitableCustomersController.getProfitableCustomers';

export default class ProfitableCustomers extends LightningElement {
    customers;
    error;
  
    @wire(getProfitableCustomers)
    loadCustomers({ error, data }) {
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