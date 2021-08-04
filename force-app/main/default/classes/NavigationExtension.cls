/*______________________________________________________________
* NavigationExtension.vfp
*_________________________________________________________________
*An Extension class made for fully Navigating from each of the
*team's pages without going back and forth with checking previews
*each time we want to demonstrate the whole site. Shows various
*buttons that allow you to change pages easily.
*_________________________________________________________________
*Author: Jawad Chowdhury
*Created: 7/28/21
*Last Modified: 8/3/21
*_________________________________________________________________*/




public class NavigationExtension {
    public NavigationExtension(ApexPages.StandardController navi) { }

    public PageReference Homep() {
        return Page.Homepage;
    }
    
      
    public PageReference Dealerp() {
        return Page.DealershipPage;
    }
        
    public PageReference Pricep() {
        return Page.PricebookEntryPage;
    }
    
    public PageReference Campep() {
        return Page.CampaignPage;
    }
     /*   
    public PageReference HomePage() {
        return Page.Test1;
    }
    */
    public NavigationExtension(DealershipController deal) { }
    
}