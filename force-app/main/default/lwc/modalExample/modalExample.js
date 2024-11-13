import { api } from 'lwc';
import  LightningModal from 'lightning/modal';

export default class ModalExample extends LightningModal  {    
    @api isModalOpen = false;
    @api modalTitle;
    @api modalContent;

    closeModal(){
        this.isOpen = false;
        const closeEvent = new CustomEvent('close');
        this.dispatchEvent(closeEvent);
    }
}