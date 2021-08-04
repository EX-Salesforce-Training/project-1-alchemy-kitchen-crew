/*______________________________________________________________
* OpportunityExtension.vfp
*_________________________________________________________________
*An Extension class made for adding Opportunities quickly through
*the main page. It's a simple extension that uses the Opportunity
*controller in conjunction to add the New Opportunity that User
*wants.
*_________________________________________________________________
*Author: Jawad Chowdhury
*Created: 8/1/21
*Last Modified: 8/4/21
*_________________________________________________________________*/

public class OpportunityExtension {
    
    ApexPages.StandardController control;
    
    public OpportunityExtension(ApexPages.StandardController opp) { 
        control = opp;
    }
    
    
    public PageReference add() {
        return control.save();
    }
    
    
}