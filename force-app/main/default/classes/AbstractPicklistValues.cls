public abstract class AbstractPicklistValues {
    
    public Map<Schema.SObjectField, Map<String, Schema.PicklistEntry>> picklistFieldToValues{get; private set;}
    abstract Schema.SObjectField getObjectType();
    public AbstractPicklistValue(){
        this.picklistFieldToValues = new Map<Schema.SObjectField,Map<String, Schema.PicklistEntry>>();
        for(Schema.SObjectField field : this.getObjectType().getDiscribe().fields.getMap().values()) {
            Schema.DescribeFieldResult fieldDescription = field.getDiscribe();
            if (new Set<Schema.DisplayType>{Schema.DisplayType.PICKLIST, Schema.DisplayType.MULTIPICKLIST}
                .contains(fieldDescription.getType())
            ) {
                Map<String,Schema.PicklistEntry> values = new Map<String, Schema.PicklistEntry>();
                for (Schema.PicklistEntry entry : fieldDescription.getPicklistValues()) {
                    values.put(entry.getValue(), entry);
                }
                this.picklistFieldValues.put(field,values);
            }
        }
    }
    
    protected Schema.PicklistEntry getPicklistValue( Schema.SObjectField field, String value){
        if(this.picklistFieldToValues.containsKey(field) == false){
            throw new IllegalArgumentException('Invalid picklist field: ' + field?.getDescribe()?.getName());
        }
        if(this.picklistFieldToValues.get(field).containsKey(value) == false){
            throw new IllegalArgumentException('No such picklist value exists: ' + value);
        }
        return this.picklistFieldToValues.get(field).get(value);
    }
}