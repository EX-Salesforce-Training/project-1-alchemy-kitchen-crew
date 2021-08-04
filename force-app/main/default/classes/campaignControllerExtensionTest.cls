@isTest
public class campaignControllerExtensionTest {

   
    @isTest static void testdataTableCon(){
        
        Campaign cc= new Campaign(name='Test Campaign');
		insert cc;        
        PageReference testPage = Page.CampaignPage;
        
        Test.setCurrentPage(testPage);
        
      	ApexPages.StandardController sc = new ApexPages.StandardController(cc);
        campaignControllerExtension ext= new campaignControllerExtension(sc);
        
        system.debug(ext.getCampaigns());
        
        List<Campaign> cl = [SELECT Name from Campaign where Name Like '%Test%' Limit 1];
        System.assertEquals(1,cl.size());


	
		     
        
    }

}