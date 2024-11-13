public with sharing class CasePickListValues extends AbstractPicklistValues {
    private static CasePickListValues theInstance;
    private CasePickListValues(){
        super();
    }    
    public static CasePickListValues getInstance(){
        if(theInstance == null){
            theInstance = new CasePickListValues();
        }
        return theInstance;
    }
    public Schema.SObjectType getObjectType(){
        return Case.sObjectType();
    }

    public Schema.PicklistEntry statusNew{
        get { return getPicklistValue(Case.Status, 'New'); }
    }
    public Schema.PicklistEntry typeMechanical{
        get { return getPicklistValue(Case.Type,'Mechanical'); }
    }
    public Schema.PicklistEntry typeElectrical{
        get { return getPicklistValue(Case.Type,'Electrical'); }
    }
    public Schema.PicklistEntry typeEletronic{
        get { return getPicklistValue(Case.Type,'Eletronic'); }
    }
    public Schema.PicklistEntry typeStructural{
        get { return getPicklistValue(Case.Type,'Structural'); }
    }
    public Schema.PicklistEntry typeOther{
        get { return getPicklistValue(Case.Type,'Other'); }
    }
}