@isTest (SeeAllData=false)
private class StaticUserTest {

    static TestMethod void testGetDataLoaderIds() {
        // Arrange
        Set<Id> dataLoaderIds = new Set<Id>();
        Integer expectedSize = 2;

        // Act
        Test.startTest();
        dataLoaderIds = StaticUser.getDataLoaderIds();
        Test.stopTest();

        // Assert
        System.assertEquals( expectedSize, dataLoaderIds.size(), 'Should be 2 dataloader ids');

    }

    static TestMethod void testQueryDataLoaderUsers() {
        // Arrange
        Set<Id> dataLoaderIds = StaticUser.getDataLoaderIds();
        List<User> dataLoaderUsers = new List<User>();
        Integer expectedSize = 2;
        System.debug( 'dataLoaderIds is ' + dataLoaderIds);

        // Act
        Test.startTest();
        dataLoaderUsers = [SELECT Username FROM User WHERE Id in :dataloaderIds];
        Test.stopTest();

        // Assert
        System.assertEquals( expectedSize, dataLoaderUsers.size(), 'Should be 2 dataloader users queried');
    }
}