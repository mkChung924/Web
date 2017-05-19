
	function loginCheck(){
		//alert('validCheck 호출');
		//유효성검사
		//----> 적합한 데이터 : 페이지 이동
		//----> 적합하지 않은 데이터 : 페이지 이동 x
		
/* 		<유효성 검사>
		1. 아이디, 비번, 비번확인, 이름, 주민번호, 주소에 대한 빈값 체크
		2. 비번과 비번확인 일치 체크
		3. 주민번호의 숫자값 자릿수 체크
		4. 직업을 선택했는지 체크 */
		
		var f = document.frm;
		
		id = f.id.value;
		pass = f.pass.value;

		
		if(id === ''){
			alert('아이디를 입력하세요.');
			f.id.focus();
			
		} else if(pass === ''){
			alert('비밀번호를 입력하세요.')
			if(pass === '') f.pass.focus();
			
		} else { //빈칸이 없을시

			
			if(pass.length < 8){
				
				alert('비밀번호는 최소 8자리입니다.');
				
			}  else {
				//document.joinForm.submit(); //joinForm의 action에 정의된 페이지로 이동(전송).
				return true;//submit 실행
			}
			
	
		}
		return false; //submit 실행 x
	}