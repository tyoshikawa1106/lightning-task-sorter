/**
 * Task Sorter
 * © Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
public with sharing class TaskSorterController {

    private static TaskSorterDao dao = new TaskSorterDao();
    // ToDo
    public List<Task> tasks {get; set;}

    /**
     * コンストラクタ
     */
    public TaskSorterController() {
    
    }
    
    /**
     * 初期処理
     */
    public void doInit() {
        this.tasks = dao.getTasks();
    }
    
    /**
     * ToDo取得
     */
    @AuraEnabled
    public static List<Task> getTasks() {
        return dao.getTasks();
    }
}