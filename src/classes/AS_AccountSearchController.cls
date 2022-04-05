public with sharing class AS_AccountSearchController {
    @AuraEnabled
    public static List<Account> searchAccounts(String searchTerm) {
        List<Account> accounts = new List<Account>();
            accounts = Database.query(createQuery(searchTerm));
        return accounts;
    }

    @AuraEnabled
    public static Account getSelectedAccountInfo(List<Account> accountsList, Integer rowIndex) {
        Account account = new Account();
        account = accountsList.get(rowIndex);
        return account;
    }

    public static String createQuery(String searchTerm) {
        System.debug('searchTerm: ' + searchTerm); 
        String searchQuery = 'SELECT Id, Name, Phone, Website, AccountNumber, Industry, ' +
                'BillingStreet, BillingCity, BillingCountry, ' +
                'BillingState, BillingPostalCode, Location__c FROM Account';
        if (string.isNotEmpty(searchTerm)) {
                searchQuery += ' WHERE Name LIKE \'%' + string.escapeSingleQuotes(searchTerm) + '%\'';
        }
        searchQuery += ' ORDER BY Name LIMIT 1000';
        return searchQuery;
    }
}