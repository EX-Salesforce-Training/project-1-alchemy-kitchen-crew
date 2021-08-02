public class DealershipController {
    
    public List<Opportunity> currentDealerOpportunities {get;set;}
    
    public String currentDealerID {get;set;}
    
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
    
    
    
    
	public  void changeDealer() {
    	currentDealerOpportunities = [SELECT Name, Amount, CloseDate,StageName  FROM Opportunity WHERE (Opportunity.Dealership__r.Id = :currentDealerID AND StageName != 'Closed')];
        Dealership__c d = [SELECT Name FROM Dealership__c WHERE Id = :currentDealerId];
        currentDealerName = d.Name;
	}
    
    
    
    
    
    
    
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