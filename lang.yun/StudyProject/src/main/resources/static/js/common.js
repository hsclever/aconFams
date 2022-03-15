var Common = {}

//NULL 체크
Common.isNull = function(obj){
	if($(obj).val() == undefined || $(obj).val() == null || $(obj).val() == ''){
		return true;
	}else{
		return false;
	}
}

//ajax call
Common.ajax = function(url, params, successFn){
	Common.ajax(url, params, successFn, null, null);
}

//ajax call
Common.ajax = function(url, params, successFn, errorFn, opt){
	$.ajax({
		url : url
		, data : params
		, dataType : $(opt).hasOwnProperty('dataType') ? opt.dataType : 'json'
		, type : $(opt).hasOwnProperty('type') ? opt.type : 'post'
		, success : function(data){
			successFn(data);
		}
		, error : function(e){
			if(errorFn){
				errorFn(e);
			}else{
				console.log(e);
			}
		}
	});
}