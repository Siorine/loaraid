function show_calendar_month(obj) {
	$("#" + obj).datepicker({
		monthNames: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
		monthNamesShort: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
        changeMonth: true,
        changeYear: true,
        showButtonPanel: true,
        dateFormat: 'yymm',
        minDate:new Date('2021-01-01'),
        showMonthAfterYear :true,
        onChangeMonthYear: function (year, month, inst) {
        	$(this).val($.datepicker.formatDate('yymm', new Date(year, month - 1, 1)));
    	}
    });
    
    $("#" + obj).focus(function () {
        $(".ui-datepicker-calendar").hide();
    });
    
    $('#' + obj).datepicker('show');
}
