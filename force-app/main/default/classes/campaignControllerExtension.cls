/*
Title: CampaignControllerExtension
Author: Rafael Loustaunau
Description: Extension Class for the Campaign VisualForce Page. Queries for the list of campaigns and creates variables used in the 
Visualforce page
LastUpdated: 8/3/21
*/








public class campaignControllerExtension {

    public Campaign campaign { get;set; }
    List<Campaign> campaigns{get;set;}
	
    private String Name;
    private Decimal expectedRevenue;
    private String status;
    


    
    public List<Campaign> getCampaigns() {
        if(campaigns == null){
            campaigns = [SELECT Name, status,NumberOfResponses,ExpectedRevenue FROM campaign LIMIT 10];
        }
        return campaigns;
    }
    
    
   public  campaignControllerExtension(ApexPages.StandardController stdController){
         this.campaign = (Campaign)stdController.getRecord();
        
    }


}
