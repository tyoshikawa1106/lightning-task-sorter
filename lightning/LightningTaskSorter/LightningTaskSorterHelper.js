({
	getTasks : function(component) {
        var action = component.get("c.getTasks");
        action.setCallback(this, function(data) {
            component.set("v.tasks", data.getReturnValue());
        });
        $A.enqueueAction(action);
    },
    selectDateSort : function(component) {
        var dateSort = component.find('dateSort');
        $A.util.addClass(dateSort.getElement(), 'selected');
        var titleSort = component.find('titleSort');
        $A.util.removeClass(titleSort.getElement(), 'selected');
    },
    doSortByDate : function(component) {
        var taskList = component.get("v.tasks");
        
        taskList.sort(function (a, b) {
            var aData = a.ActivityDate;
            var bData = b.ActivityDate;
            
            if (aData < bData) return -1;
            if (aData > bData) return 1;
            return 0;
        });
        component.set("v.tasks", taskList);
    },
    selectTitleSort : function(component) {
        var dateSort = component.find('dateSort');
        $A.util.removeClass(dateSort.getElement(), 'selected');
        var titleSort = component.find('titleSort');
        $A.util.addClass(titleSort.getElement(), 'selected');
    },
    doSortByTitle : function(component) {
        var taskList = component.get("v.tasks");
        
        taskList.sort(function (a, b) {
            var aData = a.Subject;
            var bData = b.Subject;
            
            if (aData < bData) return -1;
            if (aData > bData) return 1;
            return 0;
        });
        component.set("v.tasks", taskList);
    },
})