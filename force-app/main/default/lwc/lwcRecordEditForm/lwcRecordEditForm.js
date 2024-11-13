import { LightningElement } from 'lwc';

export default class LwcRecordEditForm extends LightningElement {

    handleSuccess(event){
        const newRecordId = event.detail.id;
        console.log('New Contact vreated with Id: ' + newRecordId);
    }
    handleError(event){
        consoleerror('Error creating new Contact: ' + event.detail.message);
    }
}