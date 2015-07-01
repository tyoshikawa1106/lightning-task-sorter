/**
 * Task Sorter
 * © Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
@isTest
private class TaskSorterDaoTest {

    private static TaskSorterDao dao = new TaskSorterDao();
    private static User testAdminUser = TaskSorterTester.getLoginUser();

    /**
     * ToDo取得
     */
    static testMethod void getTasksTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            List<Task> results = dao.getTasks();
            
            Test.stopTest();

            System.assertEquals(results.isEmpty(), true);
        }
    }

    /**
     * ToDo取得
     */
    static testMethod void getTasksTest2() {
        
        System.runAs(testAdminUser) {

            Account account = TaskSorterTester.createAccount(true);
            Task task = TaskSorterTester.createTask(account.Id, false);
            task.ActivityDate = System.today();
            insert task;

            Test.startTest();
            
            List<Task> results = dao.getTasks();
            
            Test.stopTest();

            System.assertEquals(results.size(), 1);
        }
    }
}