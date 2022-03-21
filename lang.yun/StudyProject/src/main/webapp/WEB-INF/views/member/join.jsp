<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������</title>
<%@ include file="/WEB-INF/views/include/common.jsp" %>

<script type="text/javascript">
$(function(){
	//�̸��� ������ ����
	Common.getCodeGrp($('#email2'), 'E_DOMAIN', [{CODE:"", CODE_NAME:"�����Է�"}]);
	//��ȭ��ȣ ���� ����
	Common.getCodeGrp($('#phone1'), 'PHONE', null);
	
	//���̵� �Է°� �����
	$('#userId').on('change', function(){
		//�ߺ�üũ �� �Է°��� ����Ǹ� �ٽ� üũ
		if($('#btn_chkId').prop('disabled')){
			$('#btn_chkId').prop('disabled', false);
		}
	});
	
	//ȸ�� ����
	$('#btn_join').on('click', function(){
		//���̵� �ߺ�üũ Ȯ��
		if(!$('#btn_chkId').prop('disabled')){
			alert('���̵� �ߺ�üũ�� ���ּ���.'); return;
		}
		
		//��й�ȣ Ȯ��
		if($('#userPw').val() != $('#userPw_confirm').val()){
			alert('��й�ȣ�� ���� �ʽ��ϴ�.'); return;
		}
		
		var email = '';
		if(!validEmail()){
			alert('�̸��� ������ �ùٸ��� �ʽ��ϴ�.'); return;
		}else{
			if($('#email2').val() != ''){
				email = $('#email1').val()+'@'+$('#email2').val();
			}else{
				email = $('#email1').val();
			}
		}
		
		var params = {
				userId : $('#userId').val()
				,userPw : $('#userPw').val()
				,userPw_confirm : $('#userPw_confirm').val()
				,email  : email
		}
		//����
		Common.ajax('/doJoin'
				, params
				, function(data){
					if(data.RESULT == 'SUCCESS'){
						alert('���Կ� �����߽��ϴ�.\n�α��� �������� �̵��մϴ�.');
						location.href = '/main';
					}else{
						alert(data.RESULT_MSG); return;
					}
				}
		);
	});
});

//���̵� �ߺ� üũ
function idCheck(){
	if(Common.isNull($('#userId'))){
		alert('���̵� �Է����ּ���.');
	}else{
		var params = {
				userId : $('#userId').val()
		}
		Common.ajax('/idCheck'
				,params,
				function(data){
					if(data){
						alert('������� ���̵��Դϴ�.\n�ٸ� ���̵� ������ּ���.');
						$('#userId').focus();
					}else{
						alert('��� ������ ���̵��Դϴ�.');
						$('#btn_chkId').prop('disabled', true);
					}
				}
		);
	}
}

//�̸��� üũ 
function validEmail(){
	var email = '';
	
	if($('#email2').val() != ''){
		email = $('#email1').val()+'@'+$('#email2').val();
	}else{
		email = $('#email1').val();
	}
	
	var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	if (email.match(regExp) != null) {
	    return true;
	}else{
	    return false;
	}
}
</script>
</head>
<body>
<form id="frm" method="post">
	<div>
		<div>
			<ul>
				<li>���̵�: <input type="text" id="userId" placeholder="���̵� �Է����ּ���." /><button type="button" id="btn_chkId" onclick="javascript:idCheck();">�ߺ�Ȯ��</button></li>
				<li>��й�ȣ: <input type="password" id="userPw" placeholder="��й�ȣ�� �Է����ּ���." /></li>
				<li>��й�ȣȮ��: <input type="password" id="userPw_confirm" placeholder="��й�ȣ�� Ȯ�����ּ���." /></li>
				<li>�̸���: <input type="text" id="email1" placeholder="�̸����� �Է����ּ���" />
					<select id="email2">
					</select>
				</li>
				<li>�ڵ���:
					<select id="phone1"></select><input type="number" id="phone2" placeholder="�޴������ڸ�"/><input type="number" id="phone3" placeholder="�޴������ڸ�"/>
				</li>
			</ul>
		</div>
		<div>
			<button type="button" id="btn_join">ȸ�� ����</button>
		</div>
	</div>
</form>
</body>
</html>