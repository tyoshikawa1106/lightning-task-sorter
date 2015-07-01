/**
 * 共通テストデータ
 * © Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
@isTest
private class TaskSorterTesterTest {
    
    private static User testAdminUser = TaskSorterTester.getLoginUser();

    /**
     * テスト実行ユーザ取得
     */
    static testMethod void getLoginUserTest() {
        
        System.runAs(testAdminUser) {
            Test.startTest();
            
            User result = TaskSorterTester.getLoginUser();
            System.assertEquals(result.Id, UserInfo.getUserId());
            
            Test.stopTest();
        }
    }
    
    /**
     * 取引先
     */
    static testMethod void createAccountTest() {

        System.runAs(testAdminUser) {
            Test.startTest();
            
            // Insertなし
            Account account = TaskSorterTester.createAccount(false);
            System.assertEquals(String.isEmpty(account.Id), true);
            
            // Insertあり
            account = TaskSorterTester.createAccount(true);
            System.assertEquals(String.isNotEmpty(account.Id), true);
            
            Test.stopTest();
        }
    }
    
    /**
     * タスク
     */
    static testMethod void createTaskTest() {
        
        System.runAs(testAdminUser) {
            Account account = TaskSorterTester.createAccount(true);
            
            Test.startTest();
            
            // Insertなし
            Task task = TaskSorterTester.createTask(account.Id, false);
            System.assertEquals(String.isEmpty(task.Id), true);
            
            // Insertあり
            task = TaskSorterTester.createTask(account.Id, true);
            System.assertEquals(String.isNotEmpty(task.Id), true);
            
            Test.stopTest();
        }
    }
}