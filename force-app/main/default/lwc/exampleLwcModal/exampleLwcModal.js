import { LightningElement, track } from 'lwc';

export default class ExampleLwcModal extends LightningElement {
    @track data = [
        {id:'1',name:'thiago',email:'thiago@example.com'},
        {id:'2',name:'carlitos',email:'carlitos@example.com'},
        {id:'3',name:'teves',email:'teves@example.com'},
        {id:'4',name:'marli',email:'marli@example.com'},
        {id:'5',name:'jonas',email:'jonas@example.com'}
    ];
    @track columns = [
        {label:'Name', fieldName:'name',type:'text'},
        {label:'Email', fieldName:'email',type:'email'},
        {
            type:'button',
            typeAttributes: {
                label:'View Details',
                name: 'view_details',
                title: 'View Details',
                variant: 'brand'
            }
        }
    ];
    @track isModalOpen = false;
    @track modalTitle = '';
    @track modalContent ='';

    handleRowAction(event){        
        const actionName = event.detail.action.name;
        alert(this.actionName);
        const row = event.detail.row;
        alert(this.row.email);
        switch (actionName) {
            case 'view_details':
                this.modalTitle = 'Details for ' + row.name;
                this.modalContent = 'Email: ' + row.email;
                this.isModalOpen = true;
                break;
        
            default:
                break;
        }
    }
    handleModalClose(){
        this.isModalOpen = false;
    }
}