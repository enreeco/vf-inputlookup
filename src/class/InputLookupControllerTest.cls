//Author: Enrico Murru (http://enree.co)
@isTest
private class InputLookupControllerTest {
    private static testmethod void unit_test_1(){
        
        Account acc = new Account(Name = 'Test');
        insert acc;
        
        Test.startTest();
        InputLookupController controller = new InputLookupController();
        //no value selected
        controller.valueSelected = null;
        //no id on value
        controller.valueSelected = new IDCarrier();
        //no sobject type set
        controller.valueSelected = new IDCarrier(acc.Id);
        //ok - search by name
        controller.SobjectAPIName = 'Account';
        controller.valueSelected = new IDCarrier(acc.Id);
        System.assert(controller.name == acc.Name,'Name mismatch');
        //no id selected, changed name, find the same account
        controller.nameTyped = 'Te';
        controller.valueSelected = new IDCarrier();
        System.assert(controller.name == acc.Name,'Name mismatch');
        System.assert(controller.valueSelected.value == acc.Id,'Id mismatch');
        //switch from value to null value
        controller.nameTyped = null;
        controller.valueSelected = new IDCarrier();
        System.assert(controller.valueSelected.value == null,'Id not null');
        //delete account
        Id accId = acc.Id;
        delete acc;
         controller.nameTyped = acc.Name;
        controller.valueSelected = null;
        controller.valueSelected = new IDCarrier(acc.Id);
        System.assert(controller.valueSelected.value == null,'Id not null');
        
        
		Test.stopTest();
    }
}