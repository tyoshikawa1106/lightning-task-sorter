/**
 * Task Sorter
 * © Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
public with sharing class TaskSorterDao {

    /**
     * コンストラクタ
     */
    public TaskSorterDao() {
        
    }

    /**
     * ToDo取得
     */
    public List<Task> getTasks() {
        return [
            SELECT
                 Id
                ,Subject
                ,ActivityDate
            FROM
                Task
            WHERE
                OwnerId =: UserInfo.getUserId()
            AND
                IsClosed = false
            AND
                ActivityDate != null
            ORDER BY ActivityDate ASC
            LIMIT 200
        ];
    }
}