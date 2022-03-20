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

//코드 그룹
Common.getCodeGrp = function(obj, groupId, opt){
	$(obj).empty();
	Common.ajax('getCodeGrp'
	, { groupId : groupId }
	, function(rs){
		var option = '<option value="_code_">_code_name_</option>';
		$.each(rs, function(){
			var html = option.replace('_code_', this.CODE)
								.replace('_code_name_', this.CODE_NAME);
			$(obj).append(html);
		});
		
		if(opt){
			$.each(opt, function(){
				var html = option.replace('_code_', this.CODE)
									.replace('_code_name_', this.CODE_NAME);
				$(obj).append(html);
			});
		}
	});
	
}