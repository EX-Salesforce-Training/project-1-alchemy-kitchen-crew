public with sharing class DealershipController {
    
    public List<Opportunity> currentDealerOpportunities {get;set;}
    
    public String currentDealerName {get;set;}
    
    public List<Dealership__c> dealerships {get;set;}
    
    public List<Wrap> wrappedDealers {get;set;}
    
    
    public DealershipController() {
        
        try {
			dealerships = [SELECT Name, City__c, State__c FROM Dealership__c];
        } 
        catch (Exception e) {
            system.debug(e);
        }
        
        wrappedDealers = new List<Wrap>();
        for(Dealership__c d : dealerships) {
            wrappedDealers.add(new Wrap(d));
        }
	}
    
    
    
    // Clicking a name of the Dealer in the top Table triggers this method
    // The link(commandlink) changes the value of currentDealerName
    // This method queries for the open opportunites that are assocaited with the specific dealership (currentDealerName)
	public  void changeDealer() {
    	currentDealerOpportunities = [SELECT Name, Amount, CloseDate,StageName  FROM Opportunity WHERE (Opportunity.Dealership__r.Name = :currentDealerName AND StageName != 'Closed')];
	}
    
    
    
    
    
    
    // Wrapper Class to contain the a Dealership and it's Top Opportunity (by amount)
    // Only getting open opportunites
    private class Wrap {
        public Dealership__c wrappedDealer {get; set;}
        public Opportunity topOpp {get;set;}
            
         public Wrap(Dealership__c d) {
           wrappedDealer = d;
             try{
                topOpp = [SELECT Name, Amount FROM Opportunity WHERE (Opportunity.Dealership__r.ID = :d.Id AND StageName != 'Closed' )
                      ORDER BY Amount DESC LIMIT 1][0];
             } 
             catch(Exception e) {
                 system.debug(e);
             }
            
          }
    }
}