@isTest
public class DealershipControllerTest {
	
    public static testMethod void testDealershipController() {
     
        Dealership__c testDealer = new Dealership__c();
        testDealer.Name = 'Test Dealer Location';
        testDealer.City__c = 'Test Dealer City';
        testDealer.State__c = 'ST';
        insert testDealer;
       
        Opportunity testOpp = new Opportunity();
        testOpp.Name = 'Opportunity Test';
        Date randomDate = Date.newInstance(2021, 8, 15);
        testOpp.CloseDate = randomDate;
        testOpp.Dealership__c = testDealer.Id;
        testOpp.Amount= 100000.00 ;
        testOpp.StageName = 'Prospecting';
        insert testOpp;
        
        Opportunity testOpp2 = new Opportunity();
        testOpp2.Name = 'Opportunity Test2';
        Date randomDate2 = Date.newInstance(2021, 8, 15);
        testOpp2.CloseDate = randomDate2;
        testOpp2.Dealership__c = testDealer.Id;
        testOpp2.Amount = 200000 ;
        testopp2.StageName = 'Qualification';
        insert testOpp2;
        
        Test.StartTest();
        
        PageReference pageRef = Page.DealershipPage;
        Test.setCurrentPage(pageRef);
        DealershipController testController = new DealershipController();
        Opportunity oppFromPage = testController.wrappedDealers[0].topOpp; 
        testController.currentDealerName = 'Test Dealer Location';
        testController.changeDealer();
        List<Opportunity> testOpps = testController.currentDealerOpportunities;
        system.assertEquals(testOpp2.Name, oppFromPage.Name);    
        system.assertEquals(2, testOpps.size()); 
            
        Test.StopTest();
        
    }
}