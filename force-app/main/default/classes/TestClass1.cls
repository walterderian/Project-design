public with sharing class TestClass1 {
    public TestClass1() {

        Account ac1 = new Account();
        Account ac2 = new Account( FirstName = 'TestName1', Lastname = 'testLastname1' );
        List<Contacts> conList = new List<Contacts>();
        
        insert ac1;
        insert ac2;
        
        
    }
}
