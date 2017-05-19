function validCheck(){
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
		pass2 = f.pass2.value;
		name = f.name.value;
		jumin1 = f.jumin1.value;
		jumin2 = f.jumin2.value;
		year = f.year.value;
		month = f.month.value;
		day = f.day.value;
		zip1 = f.zip1.value;
		zip2 = f.zip1.value;
		addr = f.addr.value;
		email = f.email.value;
		job = f.job.value;
		
		var jumin1Exp = new RegExp("^[\\d]{6}","g");
		var jumin2Exp = /^[\d]{7}$/g;
		var yearExp = /^[\d]{4}$/g;
	    var zipExp = /^[\d]{3}-[\d]{3}$/g;
	    var emailExp = /^[a-zA-Z0-9]{6,15}@[a-zA-Z]+\.[a-zA-Z]+$/g;
	    
	    //alert(emailExp.test("gildong@naver.com"));
		
		
		if(id === ''){
			alert('아이디를 입력하세요!');
			f.id.focus();
			
		} else if(id.length < 6 || id.length > 12){
			alert('아이디는 6~12자리 입니다.');
			f.id.focus();
			f.id.value="";
			
		} else if(pass === '' || pass2 === ''){
			alert('비밀번호를 입력하세요.')
			if(pass === '') f.pass.focus();
			else f.pass2.focus();
			
		} else if(name ===''){
			alert('이름을 입력하세요.');
			f.name.focus();
			
		} else if( jumin1 === '' || jumin2 === ''){
			
			alert('주민등록번호를 입려하세요.');
			if(jumin1 === '') f.jumin1.focus();
			else f.jumin1.focus();
			
		} else if(year === '' || month === '' || day === ''){
			alert('생년월일을 입력하세요.');
			if(year==='') f.year.focus();
				
		} else if(addr ===''){
			alert('주소를 입려하세요.');
			f.addr.focus();
			
		} else if(email === ''){
			alert('이메일을 입력하세요.');
			f.email.focus();
			
		}else if(job === '==선택=='){
			alert('직업을 선택해주세요.');
			
		} else { //빈칸이 없을시
			
			//ssn1_ap = parseInt(ssn1.substring(0));
			ssn2_ap = jumin2.substring(0,1);
			if(pass.length < 8){
				
				alert('비밀번호는 최소 8자리입니다.');
				
			} else if(pass !== pass2){
				f.pass.value = '';
				f.pass2.value = '';
				f.pass.focus();
				alert('비밀번호가 일치하지 않습니다');
						
			} else if(isNaN(jumin1) || isNaN(jumin2)){
				alert("주민등록번호는 숫자만 입력 가능합니다.");
				
			} else if(jumin1.length < 6 || jumin2.length < 7){
				alert('주민등록번호 자릿수를 확인해주세요.');
				
			} else if(parseInt(ssn2_ap) > 4){
				f.jumin2.value ="";
				f.jumin2.focus();
				alert('잘못된 주민등록번호입니다.');
				
			} else if(isNaN(year) || isNaN(year) || isNaN(year)){
				alert('생년월일은 숫자만 가능합니다.');
				
			} else if(emailExp.test(email)){
				alert('적절하지 않은 이메일입니다.');
				f.email.value="";
				
			}else {
				//document.joinForm.submit(); //joinForm의 action에 정의된 페이지로 이동(전송).
				return true;//submit 실행
			}
			
	
		}
		return false; //submit 실행 x
	}