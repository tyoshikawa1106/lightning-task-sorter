/**
 * Task Sorter
 * © Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
@isTest
private class TaskSorterControllerTest {

    private static User testAdminUser = TaskSorterTester.getLoginUser();

    /**
     * コンストラクタ
     */
    static testMethod void TaskSorterControllerTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            TaskSorterController cls = new TaskSorterController();
            cls.doInit();
            
            Test.stopTest();

            System.assertEquals(cls.tasks.isEmpty(), true);
        }
    }

    /**
     * コンストラクタ
     */
    static testMethod void TaskSorterControllerTest2() {
        
        System.runAs(testAdminUser) {

            Account account = TaskSorterTester.createAccount(true);
            Task task = TaskSorterTester.createTask(account.Id, false);
            task.ActivityDate = System.today();
            insert task;

            Test.startTest();
            
            TaskSorterController cls = new TaskSorterController();
            cls.doInit();
            
            Test.stopTest();

            System.assertEquals(cls.tasks.size(), 1);
        }
    }
    
    /**
     * ToDo取得
     */
    static testMethod void getTasksTest1() {
        
        System.runAs(testAdminUser) {

            Account account = TaskSorterTester.createAccount(true);
            Task task = TaskSorterTester.createTask(account.Id, false);
            task.ActivityDate = System.today();
            insert task;

            Test.startTest();
            
            List<Task> results = TaskSorterController.getTasks();
            
            Test.stopTest();

            System.assertEquals(results.size(), 1);
        }
    }
}