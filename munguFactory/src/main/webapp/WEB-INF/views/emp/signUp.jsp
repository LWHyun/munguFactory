<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<%
	String context = request.getContextPath();
%>
<html>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">


	//자동으로 도메인값을 넣어주는 함수 
	function changeDomain()
	{
		if($('#domain_list').val() == 'type')
		{
			$('#user_email2').val("");
			$('#user_email2').attr("readonly", false);
		}
		else
		{
			$('#user_email2').val($('#domain_list').val());
			$('#user_email2').attr("readonly", true);
		}
	}
	
	//회원 가입 유효성 체크 시 -> 유효성 확인을 통과한 후에 변동이 되는 경우를 체크하기 위해서 사용 
	 function changeId()
	{
		var v_id = $('#emp_id').val();
		
		if(v_id == "")
		{
			alert("아이디를 입력해주세요");
			id_check = false;
			return 0;
		}
		
		if(v_id.length < 5 || v_id.length > 20)
		{
			alert('아이디는 최소 6자리 최대 20자리까지 입력해주세요.');
			id_check = false;
			return 0;
		}
		
		//아이디 중복 여부를 체크하기 위한 Ajax
		$.ajax({
			url : "<%=context%>/checkEmpId",
			type : 'post',
			data : { emp_id : v_id },
			dataType : 'json',
			success:function(data)
			{
				var result = data;
				if(result == 0)
				{
					id_check = true;
				}
				else{
					id_check = false;
				}
			}
		});
		
		if(id_check == false)
		{
			alert("아이디 재확인 해 주세요");
			return 0;
		}
	} 

	//회원 가입 유효성 체크 
	function signUpCheck()
	{	
		changeId(); //회원 가입전 아이디 변동 유효성을 체크하기 위한 함수   
		var check = true;
		//주소 값들을 하나의 문자열로 구성하기 위함
		
		var address = $('#postcode').val() + " " + $('#address').val() + " /" + $('#detailAddress').val();
		var email = $('#user_email1').val() + "@" +  $('#user_email2').val()
		
		$('#emp_address').attr('value', address);
		$('#emp_email').attr('value', email);
		
		if(id_check == false)
		{
			return false;
		}
		
		if($('#emp_password').val() != $('#chk_emp_password').val())
		{
			alert('패스워드가 일치하지 않습니다. 다시 입력해주세요.');
			check = false;
		}
		
		if($('#emp_password').val().length < 8)
		{
			alert('패스워드는 보안상의 이유로 8글자 이상 입력해주세요');
			check = false;
		}
		
		if($('#dept_no').val() == "")
		{
			check = false;
		}
		
		if($('#auth_no').val() == "")
		{
			check = false;
		}
		
		if($('#position_no').val() == "")
		{
			check = false;
		}
		 
		if(check == false)
		{
			alert("체크 항목들을 확인해 주세요");
			return false;
		}
	}
	
	//아이디 중복 여부 체크
	function idCheck()
	{
		var v_id = $('#emp_id').val();
		if(v_id == "")
		{
			alert("아이디를 입력해주세요");
			id_check = false;
			return 0;
		}
		
		if(v_id.length < 5 || v_id.length > 20)
		{
			alert('아이디는 최소 6자리 최대 20자리까지 입력해주세요.');
			id_check = false;
			return 0;
		}
		
		$.ajax({
			url : "<%=context%>/checkEmpId",
			type : 'post',
			data : { emp_id : v_id },
			dataType : 'json',
			success:function(data)
			{
				var result = data;
				if(result == 0)
				{
					id_check = true;
					alert('사용 가능한 아이디 입니다.');
					$("#idCheckMsg").text('사용 가능한 아이디 입니다.');
				}
				else{
					id_check = false;
					alert('사용 불가능한 아이디 입니다.');
					$("#idCheckMsg").text('사용 불가능한 아이디 입니다.');
				}
			}
		});
	}
	
	//직원 리스트에서 직원 정보를 받아오기 위한 함수 
	function empCheck()
	{
		var v_emp_no = $('#emp_no').val();
		var v_emp_name = $('#emp_name').val();
		
		if(isNaN(v_emp_no)) 
		{ 
			alert("숫자를 입력해주세요"); 
			return 0; 
		} 
		
		if(!isNaN(v_emp_name)) 
		{ 	
			alert("문자를 입력해주세요"); 
			return 0; 
		}
		
		if(v_emp_no == "" )
		{
			alert("사원 번호를 입력해주세요");
			return 0;
		}
		
		if(v_emp_name == "")
		{
			alert("사원 이름을 입력해주세요");
			return 0;
		}
		
		console.log(v_emp_no);
		console.log(v_emp_name);
		
		$.ajax({
			url : "<%=context%>/checkSignEmp",
			type : 'post',
			data : {
				emp_no : v_emp_no, 
			},
			success:function(data)
			{
				if(data == 0)
				{	
					$.ajax({
						url : "<%=context%>/getEmpData",
						type : 'post',
						data : {
							emp_no : v_emp_no, 
							emp_name : v_emp_name
						},
						
						success:function(data)
						{
							$("#empCheckmsg").text(data.msg);
							if(data.result == 0)
							{
								alert('사원 조회에 실패 했습니다');
								$('#dept_no').attr('value','');
								$('#auth_no').attr('value','');
								$('#posit_no').attr('value','');
								$('#emp_hire_date').attr('value','');
							}
							else if(data.result == 1)
							{
								alert('사원 조회에 성공 했습니다');
								$('#dept_no').attr('value',data.dept_no);
								$('#auth_no').attr('value',data.auth_no);
								$("#posit_no").attr('value',data.posit_no);
								$('#emp_hire_date').attr('value',data.emp_hire_date);
							}
						}
					});
				}
				else
				{
					alert("이미 존재하는 사원 번호 입니다.");
					return 0;
				}
			}
		});
	}
	
	
	
	//주소 가져오기
	function DaumPostcode() {
		new daum.Postcode({
			oncomplete: function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수
	
				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}
	
				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if(data.userSelectedType === 'R'){
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if(data.buildingName !== '' && data.apartment === 'Y'){
						extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if(extraAddr !== ''){
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					document.getElementById("extraAddress").value = extraAddr;
	
				} else {
					document.getElementById("extraAddress").value = '';
				}
	
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('postcode').value = data.zonecode;
				document.getElementById("address").value = addr;
	
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("detailAddress").focus();
	
				// 우편변호와 도로명주소에 'focus' class 추가
				document.getElementById("postcode").parentNode.classList.add('focus');
				document.getElementById("address").parentNode.classList.add('focus');
			}    
		}).open();
	}
</script>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 	<div class="container">
 	<div class="row justify-content-center">
    	<div class="col-xl-7 col-lg-12 col-md-9" style="height:100% !important">
	    	<div class="card o-hidden border-0 shadow-lg my-5">
	        	<div class="card-body p-0">
	          		<div class="p-5">
		<form action="/empSignUp" method="post">
			<div class="form-group textbox">
				<label for="emp_no">사번</label>
				<input type="text" class="form-control" id="emp_no" name ="emp_no" required="required" ></p>
			</div>
			
			<div class="form-group textbox">
				<label for="emp_name">이름</label>
				<input type="text" class="form-control" id="emp_name" name ="emp_name" required="required" ></p>
				<input type="button" class="btn btn-primary" onclick="empCheck()" value="사원 확인"> <p id="empCheckmsg"></p>
			</div>
			
			<div class="form-group textbox">
				<label for="emp_id">아이디</label>
				<input type="text" class="form-control" id="emp_id" name ="emp_id" required="required" ></p>
				<input type="button" class="btn btn-primary" onclick="idCheck()" value="아이디 중복 확인"> <p id="idCheckMsg"></p> 
			</div>
			
			<div class="form-group textbox">
				<label for="emp_passwoed">비밀번호</label>
				<input type="password" class="form-control" id="emp_password" name="emp_password" required="required" ></p>
			</div>
			
			<div class="form-group textbox">
				<label for="chk_emp_password">비밀번호 확인</label>
				<input type="password" class="form-control" id="chk_emp_password" name="chk_emp_password" required="required" ></p>
			</div>
			
			<div class="form-group textbox">
				<table>
					<tr>
						<th><label for="user_email">이메일</label><br><sub>* 필수항목</sub></th>
						<td><input type="text" class="form-control" name="user_email1" id="user_email1" required="required" style="width: auto; display: inline;"> @ <input type="text" class="form-control" name="user_email2" id="user_email2" required="required" style="width: auto; display: inline;">
							<select name="email" class="form-select" id="domain_list" onclick="changeDomain()" >
								<option value="naver.com">naver.com</option>
								<option value="daum.net">daum.net</option>
								<option value="gmail.com">gmail.com</option>
								<option value="type" selected="selected">직접 입력</option>
							</select></p>
						</td>
					</tr>
				</table>
			</div>
		
			<!-- 주소 -->
			<div class="form-group textbox">
			<div class="form-group textbox mr-3"> 
				</p><label for="postcode">우편번호</label>
				<a href="#" data-toggle="tooltip" data-placement="left" title="필수입력사항"></a>
				<input type="text" class="form-control" id="postcode" name="member_address1" readonly tabindex="-1">	</p>
			</div>
			<div class="form-group textbox">
				<input type="button" class="btn btn-primary" onclick="DaumPostcode()" value="우편번호 찾기"></p>
			</div>
			</div>
			<div class="form-group textbox">
				<label for="address">주소</label>
				<input type="text" class="form-control" id="address" name="member_address2" readonly tabindex="-1"></p>
			</div>
			<div class="form-group textbox">
				<label for="detailAddress">상세주소</label>
				<input type="text" class="form-control" id="detailAddress" name="member_address3">	
				<input type="hidden" id="extraAddress" placeholder="참고항목">
			</div>
			
			<div class="form-group textbox">
				<label for="emp_gender">성별</label>
				남자 <input type="radio" name="emp_gender" value="남자" checked="checked">
				여자 <input type="radio" name="emp_gender" value="여자" >
			</div>
			
			<div class="form-group textbox">
				<input type="hidden" id="posit_no" name="posit_no"> <p/>
				<input type="hidden" id="auth_no" name="auth_no"> <p/>
				<input type="hidden" id="dept_no" name="dept_no"> <p/>
				<!-- 임시 날짜 -->
				<input type="hidden" id="emp_hire_date" name="emp_hire_date"> <p/>
				<input type="hidden" id="emp_address" name ="emp_address"> <p/>
				<input type="hidden" id="emp_email" name = "emp_email"> <p/> 
			</div>
			

			<input type="submit" onclick="return signUpCheck()" value="회원 가입">
		</form>
		</div>
		</div>
		</div>
		</div>
		</div>
	</div>
</body>
</html>