# Documentation

# Opportunites
* Added lookup to Dealership
* Created A custom path using the different Stages (altered the stages to simplify)


# Products
* Record types for car, car service, and add-on features.
* Added Lookup to Opportunities
* Different Price books : WestCoast, EastCoastDealership, Bulk-Orders


# Sales Cloud - Reports and Dashboards:
* Reports: Product Average List Price (across price books), Products sold the most(based on closed-won Opps), Campaigns that have the most success(based on closed-won Opps)
* Data visualization of custom report types using Lightning dashboard components.


# Sales Cloud - Price Books:
* Standard and custom price books for marking up and discounting products.


# Support - Cases:
* Case-Queues: Car Experts, Service Experts, Feature Experts, High-Value Customers (Revenue > 1000000)
* Auto-Response: Send customers email confirming their case.
* Case-Assignment Rules: 
     1. If the case is bigger than 1,000,000, assigned to high value customer teams.
     2. Cases assigned by reason to respective case queues (car, service, feature, billing)
* Basic Web to Case Form Created
* Case Escalation Rules: When case hasn't been addressed in 3 days (within business hours) it gets escalated to Head of Support (right now just milan, need to create users)


# VisualForce Pages :
***

##  HomePage- Jawad
     * Navigation Buttons that are implemented on every page
     * Displays User Info and the current date
     * Can Create Opportunity from this page

## Dealerships Page - Milan
     * List of all the Dealerships and the top Open Opportunities based on the product price total for products related to the opportunities
     * Can click on a specific dealership name to populate the table below with all open opportunities for that specific dealership
     * Clicking on the opportunity name in the table opens up that specific opportunity record page in a new tab

## Price Book Entries Page - Evan
     * List of Products by pricebook
     * Includes pagination, and can sort by pressing columns (Product, Unit Price, Type PriceBook) 

## Campaign Page
    * Shows a list of current campaigns
    * Form for creating a new campaign
    * Hitting save directs the user to the newly created campaign page 

## CSS For VisualForce Pages
* Salesforce Lightning Design System (SLDS) components for uniform styling.
* Apex Asset components for dynamic, sortable columns.

