@isTest (SeeAllData=false)
private class StaticUserTest {

    static TestMethod void testQueryDataLoaderUsers() {
        // Arrange
        Set<Id> dataLoaderIds = StaticUser.getDataLoaderIds();
        List<User> dataLoaderUsers = new List<User>();
        List<Static_User__mdt> staticUsers = [SELECT User_Id__c FROM Static_User__mdt WHERE User_Type__c = :StaticUser.DATA_LOADER_USER_TYPE];

        // Act
        Test.startTest();
        dataLoaderUsers = [SELECT Username FROM User WHERE Id in :dataloaderIds];
        Test.stopTest();

        // Assert
        System.assertEquals( staticUsers.size(), dataLoaderUsers.size(), 'Number of data loader should be ' + staticUsers.size());
    }

    static TestMethod void testNoEffectOnSOQLLimits() {
        // Arrange
        Integer beforeQueryCount = 0;
        Integer afterQueryCount = 0;

        // Assert

        // Act
        Test.startTest();
        beforeQueryCount = Limits.getQueries();
        Set<Id> dataLoaderIds = StaticUser.getDataLoaderIds();
        afterQueryCount = Limits.getQueries();
        Test.stopTest();

        // Assert
        System.assertEquals( beforeQueryCount, afterQueryCount, 'SOQL Queries should not change with StaticUser.getDataLoaderIds()');
    }
}