;(function($){
	$.extend({
		"change":function(i){
			if($("#hd"+i).val() == "on") {
				if(i == 1) {
					mainLight.visible = false;
				}else {
					for(j=0; j<=7; j++) {
						spotLight[j].visible = false;
					}
				}
				$("#hd"+i).val("off");
			}else {
				if(i == 1) {
					mainLight.visible = true;
				}else {
					for(j=0; j<=7; j++) {
						spotLight[j].visible = true;
					}
				}
				$("#hd"+i).val("on");
			}
/*			if($("#hd1").val()=="off" && $("#hd2").val()=="off") {
				reflect.visible = false;
			}else {
				reflect.visible = true;
			}*/
		}
	});
})(jQuery);