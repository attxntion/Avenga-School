import { LightningElement } from 'lwc';

export default class ProgressIndicatorPathTypeWithIteration extends LightningElement {
    steps = [
        { label: 'Not Started', value: 'step-1' },
        { label: 'In Progress', value: 'step-2' },
        { label: 'Completed', value: 'step-3' },
    ];
}