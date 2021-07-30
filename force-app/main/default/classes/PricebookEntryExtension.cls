/****************"PricebookEntryExtension.apxc"*****************
VisualForce page that displays pagianted Price Book information
for dealership products.
****************************************************************
Author: Evan DeVizio
Created: 7/29/21
Last Modified: 7/30/21
*/

public class PricebookEntryExtension {
    
    public List<PriceBookEntry> priceBookEntryList;
    public Integer offset = 0;	// determines the pagination offset
    public Integer queryLimit = 15; // how many records per page
    public Integer totalRecordCount;
    
    public PricebookEntryExtension(ApexPages.StandardController sc) {
        priceBookEntryList = new List<PriceBookEntry>();
    	totalRecordCount = [SELECT count() FROM PricebookEntry];
    }
    
    public List<PriceBookEntry> getPriceBookEntryList() {
        // data bound to pageBlockTable
        priceBookEntryList = [SELECT Product2Id, UnitPrice, PriceBook2Id FROM PriceBookEntry LIMIT :queryLimit OFFSET :offset];
        return priceBookEntryList;
    }
    
    public Boolean getPrev() {
        // disable Prev button if offset is negative 
        if (((offset - queryLimit) < 0 )) {
            return true;
        }
        else {
            return false;
        }
    }
    
    public Boolean getNext() {
        // disable Next button if offset goes beyond record count 
        if (((offset + queryLimit) > totalRecordCount)) {
            return true;
        }
        else {
            return false;
        }
    }
    
    public PageReference nextPage() {
        offset += queryLimit;
        return null;
    }
    
    public PageReference prevPage() {
        offset -= queryLimit;
        return null;
    }
    
    public PageReference firstPage() {
        offset = 0;
        return null;
    }
    
    public PageReference lastPage() {
    	offset = totalRecordCount - math.mod(totalRecordCount, queryLimit);
        return null;
    }
}