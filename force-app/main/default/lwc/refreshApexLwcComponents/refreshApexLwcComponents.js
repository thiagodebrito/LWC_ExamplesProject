import { LightningElement, wire } from 'lwc';
import getContactList from '@salesforce/apex/ContactController.getContactList';  
import { refreshApex } from '@salesforce/apex';

export default class RefreshApexLwcComponents extends LightningElement {
    records;
    wiredRecords;

    @wire(getContactList)
    wiredListContacts(value){
        this.wiredRecords = value;
        if(value.data){
            this.records = data;
        }
        else if(value.error){
            console.log(value.error);
        }
    }

    handleRefresh(){
        refreshApex(this.wiredRecords);
    }
}