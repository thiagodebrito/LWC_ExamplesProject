import { LightningElement } from 'lwc';

export default class ParentComponent extends LightningElement {    
    userDetails = {
        name: 'Johm Doe',
        email: 'john.doe@example.com'
    };

    updateEmail(){
        this.userDetails.email = 'new.email@example.com';
        alert('teste ' + this.userDetails.email);
    }    
}