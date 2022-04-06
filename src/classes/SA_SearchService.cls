public with sharing class SA_SearchService {

    public static List<Track__c> getTracks(String searchTerm) {
        return Database.query(createQuery(searchTerm));
    }

    public static String createQuery(String searchTerm) {
        System.debug(searchTerm);
        String searchQuery = 'SELECT Id, Name, Description__c ' +
                'FROM Track__c';
        if (string.isNotEmpty(searchTerm)) {
            searchQuery += ' WHERE Name LIKE \'%' + string.escapeSingleQuotes(searchTerm) + '%\'';
        }
        searchQuery += ' ORDER BY Name LIMIT 20';
        System.debug(searchQuery);
        return searchQuery;
    }
}