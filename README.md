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
* Apex Asset components for dynamic, sortable columns.# Salesforce DX Project: Next Steps

Now that you’ve created a Salesforce DX project, what’s next? Here are some documentation resources to get you started.

## How Do You Plan to Deploy Your Changes?

Do you want to deploy a set of changes, or create a self-contained application? Choose a [development model](https://developer.salesforce.com/tools/vscode/en/user-guide/development-models).

## Configure Your Salesforce DX Project

The `sfdx-project.json` file contains useful configuration information for your project. See [Salesforce DX Project Configuration](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_ws_config.htm) in the _Salesforce DX Developer Guide_ for details about this file.

## Read All About It

- [Salesforce Extensions Documentation](https://developer.salesforce.com/tools/vscode/)
- [Salesforce CLI Setup Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_intro.htm)
- [Salesforce DX Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_intro.htm)
- [Salesforce CLI Command Reference](https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference.htm)
