<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>addCustomer</title>

    <!-- Google Font -->
    <link href="<%=request.getContextPath() %>https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		// 시작시 id 입력 폼에 포커스
		$('#id').focus();

			// id유효성 체크
			$('#id').blur(function() { // blur : 커서를 읽음
				let id = $(this).val();
				if ($('#id').val().length < 4) {
					$('#idMsg').text('아이디는 4자이상이어야 합니다');
					$('#id').focus();
				} else if (!/^[a-z]+$/.test(id) && !/^[a-z0-9]+$/.test(id) && !/^[0-9]+$/.test(id)) {
					$('#idMsg').text('아이디는 영문 소문자와 숫자로만 구성되어야 합니다');
					$('#id').focus();
				} else {
					console.log($('#id').val()); 
					$('#idMsg').text(''); // 텍스트를 지움
				}
			});
			
			// 아이디 중복 체크 버튼 클릭 시 동작
			$('#ckId').click(function(event) {
				 event.preventDefault(); // 버튼 클릭 시 폼 제출 중단
		
				// 요청값 변수 선언
				let id = $('#id').val();
			
				// AJAX 요청 설정
				 $.ajax({
					url: '<%=request.getContextPath() %>/id/ckIdCstmAction.jsp', // 요청할 서버 페이지의 경로
					type: 'POST', // 요청 방식 (POST 또는 GET)
					data: { id: id }, // 전송할 데이터 (id 값)
					success: function(response) {
						let msg = decodeURIComponent(response);
				
						// 메시지 표시
						$('#idMsg').text(msg);
						
						console.log(msg);
					},
					error: function(xhr, status, error) {
						// 오류 발생 시 처리할 내용
						console.log(xhr.responseText);
						console.log(status);
						console.log(error);
						alert('오류가 발생했습니다');
					}
				});	
			});
		
			// pw유효성 체크
			$('#pw').blur(function(){
				if ($('#pw').val().length < 4) {
					$('#pwMsg').text('비밀번호는 4자이상이어야 합니다');
					$('#pw').focus();
				} else {
					$('#pwMsg').text('');
					$('#ckPw').focus();
				}
			});
			
			// ckPw유효성 체크
			$('#ckPw').blur(function(){
				if ($('#ckPw').val() != $('#pw').val()) {
					$('#ckPwMsg').text('비밀번호를 확인하세요');
					$('#ckpw').focus();
				} else {
					$('#ckPwMsg').text('');
					$('#cstmName').focus();
				}
			});
			
			// 유효성 체크 함수
		    function validateForm() {	
		    	let allCheck = true;
		    	
		    	// id유효성 체크
				if ($('#id').val().length < 1) { 
					$('#id').focus();
					allCheck = false;
				}
		    	
				// pw유효성 체크
				if ($('#pw').val().length < 1) { 
					$('#pw').focus();
					allCheck = false;
				} 
				
				// ckPw유효성 체크
				if ($('#ckPw').val().length < 1) { 
					$('#ckPw').focus();
					allCheck = false;
				} 
				
			    // cstmName유효성 체크
				if ($('#cstmName').val().length < 1) { 
					$('#nameMsg').text('이름을 입력하세요');
					$('#cstmName').focus();
					allCheck = false;
				} else {
					$('#nameMsg').text('');
				}
			    	
			    // cstmAddress유효성 체크
				if ($('#cstmAddress').val().length < 1) { 
					$('#addressMsg').text('주소를 입력하세요');
				 	$('#cstmAddress').focus();
					allCheck = false;
				} else {
					$('addressMsg').text('');
				}
			    
				// cstmEmail유효성 체크
				if ($('#cstmEmail').val().length < 1) { 
					$('#emailMsg').text('이메일을 입력하세요');
					$('#cstmEmail').focus();
					allCheck = false;
				} else {
		          $('emailMsg').text('');
				}
				
				// cstmBirth유효성 체크
				 if ($('#cstmBirth').val().length < 1) {
				     $('#birthMsg').text('생일을 입력하세요');
				     $('#cstmBirth').focus();
				     allCheck = false;
				 } else {
				     $('#birthMsg').text('');
				 }
				
				// cstmPhone유효성 체크
				if ($('#cstmPhone').val().length < 1) {
					$('#phoneMsg').text('연락처를 입력하세요');
					$('#cstmPhone').focus();
					allCheck = false;
				} else {
					$('#phoneMsg').text('');
				}
				
				// cstmGender유효성 체크
				if ($('.gender:checked').length == 0) {
					$('#genderMsg').text('성별을 선택하세요');
					allCheck = false;
				} else {
					$('#genderMsg').text('');
				}
				
				// cstmGender유효성체크
				if ($('.agree:checked').length == 0) {
					alert('약관에 동의해야 가입할 수 있습니다');
					allCheck = false;
				} else {
					$('#agreeMsg').text('');
				}
			return allCheck;
		}
		
	    $('#signinBtn').click(function(e) {
	        e.preventDefault(); // 기본 동작 방지

	        if (validateForm()) {
	            $('#signinForm').submit();
	            alert('회원가입이 완료되었습니다');
	        }
	    });
	});

</script>
</head>
<body>
	<!------------ 상단 네비 바 ------------>
	<!-- 상단 네비 바(메인메뉴) -->
	<div>
		<jsp:include page="/inc/mainMenu.jsp"></jsp:include>
	</div>
	
	<!-- 회원가입 폼 -->
	<div class="container">
		<div class="checkout__form">
			<h4>회원가입</h4>
				<!-- id_list -->
				<form id="signinForm" method="post" action="<%=request.getContextPath() %>/customer/addCustomerAction.jsp">
					<div class="row">
						<div class="col-lg-8 col-md-6">
							<div class="row">
								<div class="col-lg-8">
									<div class="checkout__input">
										<p>아이디<span>*</span></p>
                                    	<input type="text" name="id" id="id" placeholder="아이디를 입력하세요">
										<span id="idMsg" class="msg"></span>
									</div>
								</div>
								<div class="col-lg-4">
                                    <div class="checkout__input">
                                        <p>중복확인<span>*</span></p>
                                        <button type="button" id="ckId" class="site-btn">중복확인</button>
                                    </div>
                                </div>
                             </div>
							<div class="checkout__input">
								<p>비밀번호<span>*</span></p>
								<input type="password" name="pw" id="pw" placeholder="4자 이상의 비밀번호를 입력하세요">
								<span id="pwMsg" class="msg"></span>
							</div>
							<div class="checkout__input">
  								<p>비밀번호 확인<span>*</span></p>
								<input type="password" name="ckPw" id="ckPw" placeholder="비밀번호를 한번 더 입력하세요">
								<span id="ckPwMsg" class="msg"></span>
							</div>
							<!-- customer -->
							<div class="checkout__input">
								<p>이름<span>*</span></p>
								<input type="text" name="cstmName" id="cstmName" placeholder="이름을 입력하세요">
								<span id="nameMsg" class="msg"></span>
							</div>
							<div class="checkout__input">
								<p>주소<span>*</span></p>
								<input type="text" name="cstmAddress" id="cstmAddress" placeholder="주소를 입력하세요">
								<span id="addressMsg" class="msg"></span>
							</div>
							<div class="checkout__input">
								<p>이메일<span>*</span></p>
								<input type="email" name="cstmEmail" id="cstmEmail" placeholder="abc@example.com">
								<span id="emailMsg" class="msg"></span>
							</div>
							<div class="checkout__input">
								<p>생일<span>*</span></p>
								<input type="date" name="cstmBirth" id="cstmBirth">
								<span id="birthMsg" class="msg"></span>
							</div>
							<div class="checkout__input">
								<p>연락처<span>*</span></p>
								<input type="tel" name="cstmPhone" id="cstmPhone" placeholder="010-1234-5678">
								<span id="phoneMsg" class="msg"></span>
							</div>
							<div class="checkout__input">
								<p>성별<span>*</span></p>
							</div>
							<div>
								<label><input type="radio" name="cstmGender" value="M" class="gender"></label>
								<label>남</label>
								<label><input type="radio" name="cstmGender" value="F" class="gender"></label>
								<label>여</label>
								<span id="genderMsg" class="msg"></span>
							</div>
							<div class="checkout__input__checkbox">
								<p>약관동의<span>*</span></p>
								<label for="diff-acc">
									약관에 동의 하십니까?
									<input type="checkbox" id="diff-acc" name="cstmAgree" value="Y" class="agree">
									<span class="checkmark"></span>
								</label>
							</div>
							<br>
							<div class="text-center">
							<button type="button" id="signinBtn" class="site-btn">가입</button>
							</div>
							<br>
						</div>
					</div>
				</form>
		</div>
	</div>
	
	<!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/mixitup.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>
    
	<!------------ 하단 저작권 바 ------------>
	<div>
		<jsp:include page="/inc/copyRight.jsp"></jsp:include>
	</div>
 
</body>
</html>