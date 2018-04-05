public class StaticUser {

    // Data Loader Ids are Hard-Coded - works fine
    public static Set<Id> getDataLoaderIds() {
        Set<Id> userIds = new Set<Id>();
        String objectPrefix = '005';

        // TODO: Put these in a custom setting?
        Set<String> userIdStrings = new Set<String> {
            '1D000000c54jQAA',
            '1D000000c54nQAA'
        };

        for ( String s : userIdStrings) {
            userIds.add( objectPrefix + s);
        }

        return userIds;
    }

    // Data Loader Ids are in Custom Metadata Type
    // Does not work as MDT data is not available in test context
    /*
    public static Set<Id> getDataLoaderIds() {
        Set<Id> userIds = new Set<Id>();

        List<Static_User__mdt> staticUsers = [SELECT Id FROM Static_User__mdt WHERE Is_Data_Loader__c = true];
        for ( Static_User__mdt su : staticUsers) {
            userIds.add( su.Id);
        }
        return userIds;
    }
    */
}