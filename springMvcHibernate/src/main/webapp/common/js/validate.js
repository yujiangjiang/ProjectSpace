/*Ext.onReady(function() {
	
});*/
var timeTest = /^([1-9]|1[0-9]):([0-5][0-9])(\s[a|p]m)$/i;
Ext.apply(Ext.form.field.VTypes, {
	time : function(val, field) {
		return timeTest.test(val);
	},
	timeText : '时间无效，12：:33 PM',
	timeMask : /[\d\s:amp]/i
});