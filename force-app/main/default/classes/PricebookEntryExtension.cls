/***************************************************************
			   PricebookEntryExtension.apxc
****************************************************************
VisualForce page that displays paginated Price Book information
for dealership products. Sortable columns via facet components.
****************************************************************
Author: Evan DeVizio
Created: 7/29/21
Last Modified: 8/1/21
================================================================*/

public class PricebookEntryExtension {
    
    public List<PriceBookEntry> priceBookEntryList;
    public Integer offset = 0;	// determines the pagination offset
    public Integer queryLimit = 15; // how many records per page
    public Integer totalRecordCount;
    public String sortOrder = 'Product2Id';
    public String sortDirection = 'ASC';
    
    public PricebookEntryExtension(ApexPages.StandardController ssc) {
        priceBookEntryList = new List<PriceBookEntry>();
    	totalRecordCount = [SELECT count() FROM PricebookEntry];
    }
    
    public List<PriceBookEntry> getPriceBookEntryList() {
        // get Price Book Entries for each page
        // this variable is data bound to pageBlockTable
        priceBookEntryList = database.query('SELECT Product2Id, UnitPrice, PriceBook2Id, Product2.Name, ' + 
                                            'Product2.RecordType.Name FROM PriceBookEntry' + 
                                            ' WHERE Product2.RecordType.Name = \'Car\' OR ' + 
                                            'Product2.RecordType.Name = \'Car Service\' OR ' + 
                                            'Product2.RecordType.Name = \'Add-on\' ORDER BY ' + sortOrder + 
                                            ' ' + sortDirection + ' LIMIT ' + queryLimit + 'OFFSET ' + offset);
        return priceBookEntryList;
    }
    
    public void sortDirection() {
        // ternary operator for switching between ascending and descending results
        sortDirection = (sortDirection == 'ASC') ? 'DESC' : 'ASC';
    }
    
    public void sortByProduct() {
        sortDirection();
        sortOrder = 'Product2.Name';
    }
    
    public void sortByRecordType() {
        sortDirection();
        sortOrder = 'Product2.RecordType.Name';
    }
    
    public void sortByPrice() {
        sortDirection();
        sortOrder = 'UnitPrice';
    }
    
    public void sortByPriceBook() {
        sortDirection();
        sortOrder = 'PriceBook2Id';
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
    
    // The following methods are for retrieving the new pages:
    // =======================================================
                         
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