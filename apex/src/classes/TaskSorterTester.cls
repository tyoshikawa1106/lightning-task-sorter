/**
 * 共通テストデータ
 * © Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
public with sharing class TaskSorterTester {
    
    /**
     * テスト実行ユーザ取得
     */
    public static User getLoginUser() {
        return new User(Id = UserInfo.getUserId());
    }
    
    /**
     * 取引先
     */
    public static Account createAccount(Boolean isInsert) {
        
        Account account = new Account(       
            Name = 'Account Name'
        );
        
        if (isInsert) {
            insert account;
        }
        
        return account;
    }
    
    /**
     * ToDo
     */
    public static Task createTask(Id prmWhatId, Boolean isInsert) {
        
        Task task = new Task(
             OwnerId = UserInfo.getUserId()
            ,Subject = 'Email'
            ,WhatId = prmWhatId
        );
        
        if (isInsert) {
            insert task;
        }
        
        return task;
    }
}