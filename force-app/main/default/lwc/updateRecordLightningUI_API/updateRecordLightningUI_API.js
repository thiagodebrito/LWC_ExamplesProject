import { LightningElement } from 'lwc';
import { updateRecord } from 'lightning/uiRecordApi';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import ACCOUNT_NAME from '@salesforce/schema/Account.Name';
import ACCOUNT_ID from '@salesforce/schema/Account.Id';

export default class UpdateRecordLightningUI_API extends LightningElement {
    accountId = '001XXXXXXXXXXXXXXX';
    accountName = 'Update Account Name';
    
    handleInputChange(event){
        this.accountName = event.target.value;
    }
    
    updateAccountRecord(){
        const fields = {};
        fields[ACCOUNT_ID.fieldApiName] = this.accountId;
        fields[ACCOUNT_NAME.fieldApiName] = this.accountName;

        const recordInput = {fields};

        updateRecord(recordInput)
        .then(() =>{
            console.log('Account updated sucessfully!');
        })
        .catch(error =>{
            console.error('Error updating account: ' + error.body.message);
        });
    }
}