public class StaticUser {

    public static final String DATA_LOADER_USER_TYPE = 'Data Loader';

    // Data Loader Ids are Hard-Coded - works fine
    /*
    public static Set<Id> getDataLoaderIds() {
        Set<Id> userIds = new Set<Id>();
        String objectPrefix = '005';

        // TODO: Put these in a custom setting?
        Set<String> userIdStrings = new Set<String> {
            '1D000000c54jQAA',
            '1D000000c54nQAA'
        };

        for ( String userId : userIdStrings) {
            userIds.add( objectPrefix + userId);
        }

        return userIds;
    }
    */

    // Data Loader Ids are in Custom Metadata Type
    // Does not work as MDT data is not available in test context
    public static Set<Id> getDataLoaderIds() {
        Set<Id> userIds = new Set<Id>();

        List<Static_User__mdt> staticUsers = [SELECT User_Id__c FROM Static_User__mdt WHERE User_Type__c = :DATA_LOADER_USER_TYPE];
        for ( Static_User__mdt staticUser : staticUsers) {
            userIds.add( staticUser.User_Id__c);
        }
        return userIds;
    }
}