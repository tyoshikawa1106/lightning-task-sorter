({
	doInit : function(component, event, helper) {
		helper.getTasks(component);
	},
    dateSortClick : function(component, event, helper) {
        helper.selectDateSort(component);
        helper.doSortByDate(component);
    },
    titleSortClick : function(component, event, helper) {
        helper.selectTitleSort(component);
        helper.doSortByTitle(component);
    },
})