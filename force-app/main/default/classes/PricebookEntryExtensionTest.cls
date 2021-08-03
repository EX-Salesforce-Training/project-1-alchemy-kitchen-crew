/**************************************************************
			  PricebookEntryExtensionTest.apxc
***************************************************************
Test class for PricebookEntryExtension, the extension on the 
standard controller for PriceBookEntry.
***************************************************************
Author: Evan DeVizio
Created: 8/2/21
Last Modified: 8/3/21
==============================================================*/
@isTest
public class PricebookEntryExtensionTest {
    public static PriceBookEntry createTestData(){
        // create test data for custom Price Book and a Product
        PriceBook2 testPB = new PriceBook2(Name = 'Test Price Book', isActive = true);
        insert(testPB);
        Product2 prod = new Product2(Name = 'Test Product', isActive = true);
   		insert(prod);
        
        // create and insert a standard PB entry for the Product
        Id standardPriceBookId = Test.getStandardPricebookId();
        PriceBookEntry standardPBE = new PriceBookEntry(Pricebook2Id = standardPriceBookId, 
                                                        Product2Id = prod.Id, 
                                                        UnitPrice = 1000, 
                                                        IsActive = true);
        insert standardPBE;
		
        // create and insert the custom PB entry
        PriceBookEntry testEntry = new PriceBookEntry(UnitPrice = 123.00,
                                                      UseStandardPrice = false,
                                                      Product2Id = prod.Id,
                                                      PriceBook2Id = testPB.Id,
                                                      isActive = true);
        insert(testEntry);
        return testEntry;        
    } 
    @isTest
    public static void testPriceChange(){
        // create a dummy Price Book Entry
		PriceBookEntry testEntry= createTestData();
        
        // instantiate page and controller
        PageReference pageReference = Page.PriceBookEntryPage;
        pageReference.getParameters().put('id', String.valueOf(testEntry.Id));
        Test.setCurrentPage(pageReference);
        
        ApexPages.StandardController sc = new ApexPages.StandardController(testEntry);
		// extension constructors require standard controller as argument
        PricebookEntryExtension ext = new PricebookEntryExtension(sc);
        
        // get the price book entries from the page
        // then test if the changed price book was retrieved
        List<PriceBookEntry> testResult = ext.getPriceBookEntryList();
        system.debug(testResult);
        Boolean pass = false;
        
        for (PriceBookEntry entry : testResult) {
            system.debug(entry.UnitPrice);
            if (entry.UnitPrice == testEntry.UnitPrice) {
                pass = true;
            }
        }
        system.assertEquals(true, pass);
    }
    @isTest 
    public static void testSortOrder(){
       PriceBookEntry testEntry = createTestData();

       // instantiate page and controller
       PageReference pageReference = Page.PriceBookEntryPage;
       Test.setCurrentPage(pageReference);
        
       ApexPages.StandardController sc = new ApexPages.StandardController(testEntry);
	   // extension constructors require standard controller as argument
       PricebookEntryExtension ext = new PricebookEntryExtension(sc);
        
       List <PriceBookEntry> testEntries = ext.getPriceBookEntryList();
        
       // sortOrder defaults to Product2Id, and sortDirection defaults to ASC
       // sort by product then check the order
       ext.sortByProduct();
       // the sortOrder should now be the Product's name
       // and sortDirection should be descending
       system.assert(ext.sortOrder == 'Product2.Name' && ext.sortDirection == 'DESC');
        
       // same procedure for other columns. sortDirection should be alternating too     
       ext.sortByRecordType();
       system.assert(ext.sortOrder == 'Product2.RecordType.Name' && ext.sortDirection == 'ASC');
        
       ext.sortByPrice();
       system.assert(ext.sortOrder == 'UnitPrice' && ext.sortDirection == 'DESC');
        
       ext.sortByPriceBook();
       system.assert(ext.sortOrder == 'PriceBook2Id' && ext.sortDirection == 'ASC');
    }
    @isTest
    public static void testPageCtrl(){
        PriceBookEntry testEntry= createTestData();
       
        // instantiate page and controller
        PageReference pageReference = Page.PriceBookEntryPage;
        Test.setCurrentPage(pageReference);
        
        ApexPages.StandardController sc = new ApexPages.StandardController(testEntry);
	    // extension constructors require standard controller as argument
        PricebookEntryExtension ext = new PricebookEntryExtension(sc);
        // page offset should become 0 on the first page
        ext.firstPage();
        system.assertEquals(0, ext.offset);
        
        // nextPage: offset += queryLimit
        // prevPage: offset -= queryLimit
        ext.offset = 0;
        ext.queryLimit = 15;
        ext.nextPage();
        system.assertEquals(15, ext.offset);
        
        ext.offset = 15;
        ext.queryLimit = 15;
        ext.prevPage();
        system.assertEquals(0, ext.offset);
        
        // getNext and getPrev buttons will be disabled if the offset
        // reaches a number that is out of bounds
        ext.totalRecordCount = 100;
    	ext.offset = 0;
        system.assertEquals(true, ext.getPrev());
        
        ext.offset = 95;
        system.assertEquals(true, ext.getNext());
        
        ext.offset = 0;
        system.assertEquals(false, ext.getNext());
        
        ext.offset = 50;
        system.assertEquals(false, ext.getPrev());
    }
}