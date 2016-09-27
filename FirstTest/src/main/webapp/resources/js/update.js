function updateData() {
	if (!uvalidateForm()) {
		return;
	}
	if (confirm('수정을 진행하시겠습니까?')) {
		updateForm.action = "/firstTest/update.do"
		updateForm.submit();
	}
}

// 정규식
function uvalidateForm() {
	
	// 이름
	if (updateForm.p_name.value.replace(/\s/g, "") == "") {
		$("#warningSpan").text("성명을 입력해주세요.").css("color", "red");
		setTimeout(function(){$("#warningSpan").text("");}, 3000);
		updateForm.p_name.focus();
		return false;
	} else if (updateForm.p_name.value.search(/[A-Za-z0-9]/g) >= 0) {
		$("#warningSpan").text("한글로 입력해 주세요.").css("color", "red");
		setTimeout(function(){$("#warningSpan").text("");}, 3000);
		updateForm.p_name.focus();
		return false;
	} else {
		$("#warningSpan").text("");
	}
	
	//주민등록번호
	if (updateForm.p_number.value.replace(/\s/g, "") == "") {
		$("#warningSpan").text("주민등록번호를 입력해주세요.").css("color", "red");
		setTimeout(function(){$("#warningSpan").text("");}, 3000);
		updateForm.p_number.focus();
		return false;
	} else if (check_jumin()==false) {
		$("#warningSpan").text("주민등록번호를 바르게 입력해 주세요.").css("color", "red");
		setTimeout(function(){$("#warningSpan").text("");}, 3000);
		updateForm.p_name.focus();
		return false;
	}
	else {
		$("#warningSpan").text("");
	}
	//주민등록번호의 유효성을 검사하는 함수
	function check_jumin() {
		 var ju = updateForm.p_number.value.substring(0,6);
		 var min = updateForm.p_number.value.substring(7,14);
		 var jumin = ju+min;
		 //주민등록 번호 13자리를 검사한다.
		  var fmt = /^\d{6}[1234]\d{6}$/;  //포멧 설정
		  if (!fmt.test(jumin)) {
		   return false;
		  }
		  // 생년월일 검사
		  var birthYear = (jumin.charAt(6) <= "2") ? "19" : "20";
		  birthYear += jumin.substr(0, 2);
		  var birthMonth = jumin.substr(2, 2) - 1;
		  var birthDate = jumin.substr(4, 2);
		  var birth = new Date(birthYear, birthMonth, birthDate);

		  if ( birth.getYear() % 100 != jumin.substr(0, 2) ||
		       birth.getMonth() != birthMonth ||
		       birth.getDate() != birthDate) {
		     return false;
		  }
		  // Check Sum 코드의 유효성 검사
		  var buf = new Array(13);
		  for (var i = 0; i < 13; i++) buf[i] = parseInt(jumin.charAt(i));
		 
		  multipliers = [2,3,4,5,6,7,8,9,2,3,4,5];
		  for (var sum = 0, i = 0; i < 12; i++) sum += (buf[i] *= multipliers[i]);

		  if ((11 - (sum % 11)) % 10 != buf[12]) {
		     return false;
		  }
		  return true;
		}
	
	//소속회사
	if (updateForm.p_company.value.replace(/\s/g, "") == "") {
		$("#warningSpan").text("소속회사를 입력해주세요.").css("color", "red");
		setTimeout(function(){$("#warningSpan").text("");}, 3000);
		updateForm.p_company.focus();
		return false;
	} else if (updateForm.p_company.value.search(/[A-Za-z0-9]/g) >= 0) {
		$("#warningSpan").text("한글로 입력해 주세요.").css("color", "red");
		setTimeout(function(){$("#warningSpan").text("");}, 3000);
		updateForm.p_company.focus();
		return false;
	} else{
		$("#warningSpan").text("");
	}
		
	//입사일
	if (updateForm.p_join.value.replace(/\s/g, "") == "") {
		$("#warningSpan").text("입사일을 입력해주세요.").css("color", "red");
		setTimeout(function(){$("#warningSpan").text("");}, 3000);
		updateForm.p_join.focus();
		return false;
	}else{
		$("#warningSpan").text("");
	}
	
	//부서
	if (updateForm.p_dept.value.replace(/\s/g, "") == "") {
		$("#warningSpan").text("부서를 입력해주세요.").css("color", "red");
		setTimeout(function(){$("#warningSpan").text("");}, 3000);
		updateForm.p_dept.focus();
		return false;
	}else{
		$("#warningSpan").text("");
	}
	
	//직위
	if (updateForm.p_position.value.replace(/\s/g, "") == "") {
		$("#warningSpan").text("직위를 입력해주세요.").css("color", "red");
		setTimeout(function(){$("#warningSpan").text("");}, 3000);
		updateForm.p_position.focus();
		return false;
	}else{
		$("#warningSpan").text("");
	}
	
	//입대일 제대일
	if (updateForm.pm_start.value.replace(/\s/g, "") != "" && updateForm.pm_end.value.replace(/\s/g, "") == "" || 
			updateForm.pm_start.value.replace(/\s/g, "") == "" && updateForm.pm_end.value.replace(/\s/g, "") != "") {
		$("#warningSpan").text("입대일과 제대일을 바르게 입력해주세요.").css("color", "red");
		setTimeout(function(){$("#warningSpan").text("");}, 3000);
		updateForm.pm_start.focus();
		return false;
	}else{
		$("#warningSpan").text("");
	}
	
	//전화
	var sCode = updateForm.p_phone.value.replace(/[^0-9]/g, '').substring(0,2);
	var areaCode = updateForm.p_phone.value.replace(/[^0-9]/g, '').substring(0,3);
	if(updateForm.p_phone.value.replace(/[^0-9]/g, '')!='' && sCode=='02'){
		if(updateForm.p_phone.value.replace(/[^0-9]/g, '').length < 9){
			$("#warningSpan").text("전화 번호를 바르게 입력해주세요.").css("color", "red");
			setTimeout(function(){$("#warningSpan").text("");}, 3000);
			updateForm.p_phone.focus();
			return false;
		}
	} else{
		if(areaCode!="031" && areaCode!="032" && areaCode!="033" && areaCode!="041" 
			&& areaCode!="042" && areaCode!="043" && areaCode!="044" && areaCode!="051" 
			&& areaCode!="052" && areaCode!="053" && areaCode!="054" && areaCode!="055" 
			&& areaCode!="061" && areaCode!="062" && areaCode!="063" && areaCode!="064"){
			$("#warningSpan").text("전화 번호를 바르게 입력해주세요.").css("color", "red");
			setTimeout(function(){$("#warningSpan").text("");}, 3000);
			updateForm.p_phone.focus();
			return false;
		}
	}
	
	// 휴대전화
	//var regExp = /^(?:(010-\d{4})|(01[1|6|7|8|9]-\d{3,4}))-(\d{4})$/;
	var frontNum = updateForm.p_cell.value.substring(1,4);
	if (updateForm.p_cell.value.replace(/\s/g, "") == "") {
		$("#warningSpan").text("휴대전화 번호를 입력해주세요.").css("color", "red");
		setTimeout(function(){$("#warningSpan").text("");}, 3000);
		updateForm.p_cell.focus();
		return false;
	} else if (frontNum!="010" && frontNum!="011" && frontNum!="016"
		&& frontNum!="017" && frontNum!="018" && frontNum!="019") {
		$("#warningSpan").text("휴대전화 번호를 바르게 입력하세요.").css("color", "red");
		setTimeout(function(){$("#warningSpan").text("");}, 3000);
		updateForm.p_cell.focus();
		return false;
	} else {
		$("#warningSpan").text("");
	}
	
	// 이메일
	if (updateForm.p_email.value.replace(/\s/g, "") == "") {
		$("#warningSpan").text("이메일을 입력해주세요.").css("color", "red");
		setTimeout(function(){$("#warningSpan").text("");}, 3000);
		updateForm.p_email.focus();
		return false;
	} else if(updateForm.p_email.value.search(/[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/)){
		$("#warningSpan").text("이메일을 바르게 입력해주세요.").css("color", "red");
		setTimeout(function(){$("#warningSpan").text("");}, 3000);
		updateForm.p_email.focus();
		return false;
	}
	else {
		$("#warningSpan").text("");
	}
	
	//주소
	if (updateForm.p_addr.value.replace(/\s/g, "") == "") {
		$("#warningSpan").text("주소를 입력해주세요.").css("color", "red");
		setTimeout(function(){$("#warningSpan").text("");}, 3000);
		updateForm.p_addr.focus();
		return false;
	} 
	else {
		$("#warningSpan").text("");
	}
	
	//학력 ***********동적으로 생성된 동일한 name의 값을 document.getElementsByName("")[]을 이용하여 배열로 받아와서 처리함
	var edu_table = document.getElementById("edu_table");
	var edu_size = edu_table.rows.length;
	for(var e=0; e < edu_size; e++){
		if (document.getElementsByName("edu_name")[e].value.replace(/\s/g, "") == "") {
			$("#warningSpan").text("출신학교를 입력해주세요.").css("color", "red");
			setTimeout(function(){$("#warningSpan").text("");}, 3000);
			document.getElementsByName("edu_name")[e].focus();
			return false;
		} else if (document.getElementsByName("edu_date")[e].value == "") {
			$("#warningSpan").text("입학,졸업일을 입력해 주세요.").css("color", "red");
			setTimeout(function(){$("#warningSpan").text("");}, 3000);
			document.getElementsByName("edu_date")[e].focus();
			return false;
		}else{
			$("#warningSpan").text("");
		}
	}
	
	//자격증
	var l_table = document.getElementById("l_table");
	var l_size = (l_table.rows.length)-1;
	
	if(l_size > 1){
		for(var l=1; l < l_size; l++){
			if (document.getElementsByName("l_name")[l].value.replace(/\s/g, "") == "") {
				$("#warningSpan").text("자격증명을 입력해주세요.").css("color", "red");
				setTimeout(function(){$("#warningSpan").text("");}, 3000);
				document.getElementsByName("l_name")[l].focus();
				return false;
			} else if (document.getElementsByName("l_date")[l].value == "") {
				$("#warningSpan").text("취득일을 입력해 주세요.").css("color", "red");
				setTimeout(function(){$("#warningSpan").text("");}, 3000);
				document.getElementsByName("l_date")[l].focus();
				return false;
			}else{
				$("#warningSpan").text("");
			}
		}
	}else if(l_size == 1){
		if (document.getElementsByName("l_name")[0].value.replace(/\s/g, "") == "" && document.getElementsByName("l_date")[0].value != "") {
			$("#warningSpan").text("자격증명을 입력해주세요.").css("color", "red");
			setTimeout(function(){$("#warningSpan").text("");}, 3000);
			document.getElementsByName("l_name")[0].focus();
			return false;
		} else if (document.getElementsByName("l_date")[0].value == "" && document.getElementsByName("l_name")[0].value.replace(/\s/g, "") != "") {
			$("#warningSpan").text("취득일을 입력해 주세요.").css("color", "red");
			setTimeout(function(){$("#warningSpan").text("");}, 3000);
			document.getElementsByName("l_date")[0].focus();
			return false;
		}else{
			$("#warningSpan").text("");
		}
	}else{
		$("#warningSpan").text("");
	}
	
	//경력
	var c_table = document.getElementById("c_table");
	var c_size = (c_table.rows.length)-2;
	if(c_size > 1){
		for(var c=1; c < c_size; c++){
			if (document.getElementsByName("c_name")[c].value.replace(/\s/g, "") == "") {
				$("#warningSpan").text("회사명을 입력해주세요.").css("color", "red");
				setTimeout(function(){$("#warningSpan").text("");}, 3000);
				document.getElementsByName("c_name")[c].focus();
				return false;
			} else if (document.getElementsByName("c_name")[c].value.replace(/\s/g, "") == "" 
				&& document.getElementsByName("c_start")[c].value != "") {
				$("#warningSpan").text("회사명을 입력해주세요.").css("color", "red");
				setTimeout(function(){$("#warningSpan").text("");}, 3000);
				document.getElementsByName("c_name")[c].focus();
				return false;
			} else if (document.getElementsByName("c_name")[c].value.replace(/\s/g, "") == "" 
				&& document.getElementsByName("c_end")[c].value != "") {
				$("#warningSpan").text("회사명을 입력해 주세요.").css("color", "red");
				setTimeout(function(){$("#warningSpan").text("");}, 3000);
				document.getElementsByName("c_name")[c].focus();
				return false;
			} else if (document.getElementsByName("c_name")[c].value.replace(/\s/g, "") == "" 
				&& document.getElementsByName("c_position")[c].value != "") {
				$("#warningSpan").text("회사명을 입력해 주세요.").css("color", "red");
				setTimeout(function(){$("#warningSpan").text("");}, 3000);
				document.getElementsByName("c_name")[c].focus();
				return false;
			} else if (document.getElementsByName("c_name")[c].value.replace(/\s/g, "") == "" 
				&& document.getElementsByName("c_dept")[c].value != "") {
				$("#warningSpan").text("회사명을 입력해 주세요.").css("color", "red");
				setTimeout(function(){$("#warningSpan").text("");}, 3000);
				document.getElementsByName("c_name")[c].focus();
				return false;
			} else if (document.getElementsByName("c_start")[c].value.replace(/\s/g, "") == "" 
				&& document.getElementsByName("c_name")[c].value != "") {
				$("#warningSpan").text("시작일을 입력해 주세요.").css("color", "red");
				setTimeout(function(){$("#warningSpan").text("");}, 3000);
				document.getElementsByName("c_start")[c].focus();
				return false;
			} else if (document.getElementsByName("c_start")[c].value.replace(/\s/g, "") == "" 
				&& document.getElementsByName("c_end")[c].value != "") {
				$("#warningSpan").text("시작일을 입력해 주세요.").css("color", "red");
				setTimeout(function(){$("#warningSpan").text("");}, 3000);
				document.getElementsByName("c_start")[c].focus();
				return false;
			} else if (document.getElementsByName("c_start")[c].value.replace(/\s/g, "") == "" 
				&& document.getElementsByName("c_position")[c].value != "") {
				$("#warningSpan").text("시작일을 입력해 주세요.").css("color", "red");
				setTimeout(function(){$("#warningSpan").text("");}, 3000);
				document.getElementsByName("c_start")[c].focus();
				return false;
			} else if (document.getElementsByName("c_start")[c].value.replace(/\s/g, "") == "" 
				&& document.getElementsByName("c_dept")[c].value != "") {
				$("#warningSpan").text("시작일을 입력해 주세요.").css("color", "red");
				setTimeout(function(){$("#warningSpan").text("");}, 3000);
				document.getElementsByName("c_start")[c].focus();
				return false;
			} else if (document.getElementsByName("c_end")[c].value.replace(/\s/g, "") == "" 
				&& document.getElementsByName("c_name")[c].value != "") {
				$("#warningSpan").text("종료일을 입력해 주세요.").css("color", "red");
				setTimeout(function(){$("#warningSpan").text("");}, 3000);
				document.getElementsByName("c_end")[c].focus();
				return false;
			} else if (document.getElementsByName("c_end")[c].value.replace(/\s/g, "") == "" 
				&& document.getElementsByName("c_start")[c].value != "") {
				$("#warningSpan").text("종료일을 입력해 주세요.").css("color", "red");
				setTimeout(function(){$("#warningSpan").text("");}, 3000);
				document.getElementsByName("c_end")[c].focus();
				return false;
			} else if (document.getElementsByName("c_end")[c].value.replace(/\s/g, "") == "" 
				&& document.getElementsByName("c_position")[c].value != "") {
				$("#warningSpan").text("종료일을 입력해 주세요.").css("color", "red");
				setTimeout(function(){$("#warningSpan").text("");}, 3000);
				document.getElementsByName("c_end")[c].focus();
				return false;
			} else if (document.getElementsByName("c_end")[c].value.replace(/\s/g, "") == "" 
				&& document.getElementsByName("c_dept")[c].value != "") {
				$("#warningSpan").text("종료일을 입력해 주세요.").css("color", "red");
				setTimeout(function(){$("#warningSpan").text("");}, 3000);
				document.getElementsByName("c_end")[c].focus();
				return false;
			} else if (document.getElementsByName("c_position")[c].value.replace(/\s/g, "") == "" 
				&& document.getElementsByName("c_name")[c].value != "") {
				$("#warningSpan").text("직위를 입력해 주세요.").css("color", "red");
				setTimeout(function(){$("#warningSpan").text("");}, 3000);
				document.getElementsByName("c_position")[c].focus();
				return false;
			} else if (document.getElementsByName("c_position")[c].value.replace(/\s/g, "") == "" 
				&& document.getElementsByName("c_start")[c].value != "") {
				$("#warningSpan").text("직위를 입력해 주세요.").css("color", "red");
				setTimeout(function(){$("#warningSpan").text("");}, 3000);
				document.getElementsByName("c_position")[c].focus();
				return false;
			} else if (document.getElementsByName("c_position")[c].value.replace(/\s/g, "") == "" 
				&& document.getElementsByName("c_end")[c].value != "") {
				$("#warningSpan").text("직위를 입력해 주세요.").css("color", "red");
				setTimeout(function(){$("#warningSpan").text("");}, 3000);
				document.getElementsByName("c_position")[c].focus();
				return false;
			} else if (document.getElementsByName("c_position")[c].value.replace(/\s/g, "") == "" 
				&& document.getElementsByName("c_dept")[c].value != "") {
				$("#warningSpan").text("직위를 입력해 주세요.").css("color", "red");
				setTimeout(function(){$("#warningSpan").text("");}, 3000);
				document.getElementsByName("c_position")[c].focus();
				return false;
			} else if (document.getElementsByName("c_dept")[c].value.replace(/\s/g, "") == "" 
				&& document.getElementsByName("c_name")[c].value != "") {
				$("#warningSpan").text("부서를 입력해 주세요.").css("color", "red");
				setTimeout(function(){$("#warningSpan").text("");}, 3000);
				document.getElementsByName("c_dept")[c].focus();
				return false;
			} else if (document.getElementsByName("c_dept")[c].value.replace(/\s/g, "") == "" 
				&& document.getElementsByName("c_start")[c].value != "") {
				$("#warningSpan").text("부서를 입력해 주세요.").css("color", "red");
				setTimeout(function(){$("#warningSpan").text("");}, 3000);
				document.getElementsByName("c_dept")[c].focus();
				return false;
			} else if (document.getElementsByName("c_dept")[c].value.replace(/\s/g, "") == "" 
				&& document.getElementsByName("c_end")[c].value != "") {
				$("#warningSpan").text("부서를 입력해 주세요.").css("color", "red");
				setTimeout(function(){$("#warningSpan").text("");}, 3000);
				document.getElementsByName("c_dept")[c].focus();
				return false;
			} else if (document.getElementsByName("c_dept")[c].value.replace(/\s/g, "") == "" 
				&& document.getElementsByName("c_position")[c].value != "") {
				$("#warningSpan").text("부서를 입력해 주세요.").css("color", "red");
				setTimeout(function(){$("#warningSpan").text("");}, 3000);
				document.getElementsByName("c_dept")[c].focus();
				return false;
			}else{
				$("#warningSpan").text("");
			}
		}
	}else if(c_size == 1){
		if (document.getElementsByName("c_name")[0].value.replace(/\s/g, "") == "" 
			&& document.getElementsByName("c_start")[0].value != "") {
			$("#warningSpan").text("회사명을 입력해주세요.").css("color", "red");
			setTimeout(function(){$("#warningSpan").text("");}, 3000);
			document.getElementsByName("c_name")[0].focus();
			return false;
		} else if (document.getElementsByName("c_name")[0].value.replace(/\s/g, "") == "" 
			&& document.getElementsByName("c_end")[0].value != "") {
			$("#warningSpan").text("회사명을 입력해 주세요.").css("color", "red");
			setTimeout(function(){$("#warningSpan").text("");}, 3000);
			document.getElementsByName("c_name")[0].focus();
			return false;
		} else if (document.getElementsByName("c_name")[0].value.replace(/\s/g, "") == "" 
			&& document.getElementsByName("c_position")[0].value != "") {
			$("#warningSpan").text("회사명을 입력해 주세요.").css("color", "red");
			setTimeout(function(){$("#warningSpan").text("");}, 3000);
			document.getElementsByName("c_name")[0].focus();
			return false;
		} else if (document.getElementsByName("c_name")[0].value.replace(/\s/g, "") == "" 
			&& document.getElementsByName("c_dept")[0].value != "") {
			$("#warningSpan").text("회사명을 입력해 주세요.").css("color", "red");
			setTimeout(function(){$("#warningSpan").text("");}, 3000);
			document.getElementsByName("c_name")[0].focus();
			return false;
		} else if (document.getElementsByName("c_start")[0].value.replace(/\s/g, "") == "" 
			&& document.getElementsByName("c_name")[0].value != "") {
			$("#warningSpan").text("시작일을 입력해 주세요.").css("color", "red");
			setTimeout(function(){$("#warningSpan").text("");}, 3000);
			document.getElementsByName("c_start")[0].focus();
			return false;
		} else if (document.getElementsByName("c_start")[0].value.replace(/\s/g, "") == "" 
			&& document.getElementsByName("c_end")[0].value != "") {
			$("#warningSpan").text("시작일을 입력해 주세요.").css("color", "red");
			setTimeout(function(){$("#warningSpan").text("");}, 3000);
			document.getElementsByName("c_start")[0].focus();
			return false;
		} else if (document.getElementsByName("c_start")[0].value.replace(/\s/g, "") == "" 
			&& document.getElementsByName("c_position")[0].value != "") {
			$("#warningSpan").text("시작일을 입력해 주세요.").css("color", "red");
			setTimeout(function(){$("#warningSpan").text("");}, 3000);
			document.getElementsByName("c_start")[0].focus();
			return false;
		} else if (document.getElementsByName("c_start")[0].value.replace(/\s/g, "") == "" 
			&& document.getElementsByName("c_dept")[0].value != "") {
			$("#warningSpan").text("시작일을 입력해 주세요.").css("color", "red");
			setTimeout(function(){$("#warningSpan").text("");}, 3000);
			document.getElementsByName("c_start")[0].focus();
			return false;
		} else if (document.getElementsByName("c_end")[0].value.replace(/\s/g, "") == "" 
			&& document.getElementsByName("c_name")[0].value != "") {
			$("#warningSpan").text("종료일을 입력해 주세요.").css("color", "red");
			setTimeout(function(){$("#warningSpan").text("");}, 3000);
			document.getElementsByName("c_end")[0].focus();
			return false;
		} else if (document.getElementsByName("c_end")[0].value.replace(/\s/g, "") == "" 
			&& document.getElementsByName("c_start")[0].value != "") {
			$("#warningSpan").text("종료일을 입력해 주세요.").css("color", "red");
			setTimeout(function(){$("#warningSpan").text("");}, 3000);
			document.getElementsByName("c_end")[0].focus();
			return false;
		} else if (document.getElementsByName("c_end")[0].value.replace(/\s/g, "") == "" 
			&& document.getElementsByName("c_position")[0].value != "") {
			$("#warningSpan").text("종료일을 입력해 주세요.").css("color", "red");
			setTimeout(function(){$("#warningSpan").text("");}, 3000);
			document.getElementsByName("c_end")[0].focus();
			return false;
		} else if (document.getElementsByName("c_end")[0].value.replace(/\s/g, "") == "" 
			&& document.getElementsByName("c_dept")[0].value != "") {
			$("#warningSpan").text("종료일을 입력해 주세요.").css("color", "red");
			setTimeout(function(){$("#warningSpan").text("");}, 3000);
			document.getElementsByName("c_end")[0].focus();
			return false;
		} else if (document.getElementsByName("c_position")[0].value.replace(/\s/g, "") == "" 
			&& document.getElementsByName("c_name")[0].value != "") {
			$("#warningSpan").text("직위를 입력해 주세요.").css("color", "red");
			setTimeout(function(){$("#warningSpan").text("");}, 3000);
			document.getElementsByName("c_position")[0].focus();
			return false;
		} else if (document.getElementsByName("c_position")[0].value.replace(/\s/g, "") == "" 
			&& document.getElementsByName("c_start")[0].value != "") {
			$("#warningSpan").text("직위를 입력해 주세요.").css("color", "red");
			setTimeout(function(){$("#warningSpan").text("");}, 3000);
			document.getElementsByName("c_position")[0].focus();
			return false;
		} else if (document.getElementsByName("c_position")[0].value.replace(/\s/g, "") == "" 
			&& document.getElementsByName("c_end")[0].value != "") {
			$("#warningSpan").text("직위를 입력해 주세요.").css("color", "red");
			setTimeout(function(){$("#warningSpan").text("");}, 3000);
			document.getElementsByName("c_position")[0].focus();
			return false;
		} else if (document.getElementsByName("c_position")[0].value.replace(/\s/g, "") == "" 
			&& document.getElementsByName("c_dept")[0].value != "") {
			$("#warningSpan").text("직위를 입력해 주세요.").css("color", "red");
			setTimeout(function(){$("#warningSpan").text("");}, 3000);
			document.getElementsByName("c_position")[0].focus();
			return false;
		} else if (document.getElementsByName("c_dept")[0].value.replace(/\s/g, "") == "" 
			&& document.getElementsByName("c_name")[0].value != "") {
			$("#warningSpan").text("부서를 입력해 주세요.").css("color", "red");
			setTimeout(function(){$("#warningSpan").text("");}, 3000);
			document.getElementsByName("c_dept")[0].focus();
			return false;
		} else if (document.getElementsByName("c_dept")[0].value.replace(/\s/g, "") == "" 
			&& document.getElementsByName("c_start")[0].value != "") {
			$("#warningSpan").text("부서를 입력해 주세요.").css("color", "red");
			setTimeout(function(){$("#warningSpan").text("");}, 3000);
			document.getElementsByName("c_dept")[0].focus();
			return false;
		} else if (document.getElementsByName("c_dept")[0].value.replace(/\s/g, "") == "" 
			&& document.getElementsByName("c_end")[0].value != "") {
			$("#warningSpan").text("부서를 입력해 주세요.").css("color", "red");
			setTimeout(function(){$("#warningSpan").text("");}, 3000);
			document.getElementsByName("c_dept")[0].focus();
			return false;
		} else if (document.getElementsByName("c_dept")[0].value.replace(/\s/g, "") == "" 
			&& document.getElementsByName("c_position")[0].value != "") {
			$("#warningSpan").text("부서를 입력해 주세요.").css("color", "red");
			setTimeout(function(){$("#warningSpan").text("");}, 3000);
			document.getElementsByName("c_dept")[0].focus();
			return false;
		}else{
			$("#warningSpan").text("");
		}
	}else{
		$("#warningSpan").text("");
	}
	
	//교육
	var t_table = document.getElementById("t_table");
	var t_size = (t_table.rows.length)-1;
	if(t_size > 1){
		 for(var t=1; t < t_size; t++){
			 if(document.getElementsByName("t_name")[t].value.replace(/\s/g, "")==""){
				 	$("#warningSpan").text("교육명을 입력해주세요.").css("color", "red");
				 	setTimeout(function(){$("#warningSpan").text("");}, 3000);
					document.getElementsByName("t_name")[t].focus();
					return false;
				}else if(document.getElementsByName("t_name")[t].value.replace(/\s/g, "")=="" 
					&&document.getElementsByName("t_start")[t].value !=""){
					$("#warningSpan").text("교육명을 입력해주세요.").css("color", "red");
					setTimeout(function(){$("#warningSpan").text("");}, 3000);
					document.getElementsByName("t_name")[t].focus();
					return false;
				}else if(document.getElementsByName("t_name")[t].value.replace(/\s/g, "")==""
					&& document.getElementsByName("t_end")[t].vlue!=""){
					$("#warningSpan").text("교육명을 입력해주세요.").css("color", "red");
					setTimeout(function(){$("#warningSpan").text("");}, 3000);
					document.getElementsByName("t_name")[t].focus();
					return false;
				}else if(document.getElementsByName("t_name")[t].value.replace(/\s/g, "")==""
					&& document.getElementsByName("t_institution")[t].value.replace(/\s/g, "")!=""){
					$("#warningSpan").text("교육명을 입력해주세요.").css("color", "red");
					setTimeout(function(){$("#warningSpan").text("");}, 3000);
					document.getElementsByName("t_name")[t].focus();
					return false;
				}else if(document.getElementsByName("t_start")[t].value==""
					&& document.getElementsByName("t_name")[t].value.replace(/\s/g, "")!=""){
					$("#warningSpan").text("교육시작일을 입력해주세요.").css("color", "red");
					setTimeout(function(){$("#warningSpan").text("");}, 3000);
					document.getElementsByName("t_start")[t].focus();
					return false;
				}else if(document.getElementsByName("t_start")[t].value==""
					&& document.getElementsByName("t_end")[t].value!=""){
					$("#warningSpan").text("교육시작일을 입력해주세요.").css("color", "red");
					setTimeout(function(){$("#warningSpan").text("");}, 3000);
					document.getElementsByName("t_start")[t].focus();
					return false;
				}else if(document.getElementsByName("t_start")[t].value==""
					&& document.getElementsByName("t_institution")[t].value.replace(/\s/g, "")!=""){
					$("#warningSpan").text("교육시작일을 입력해주세요.").css("color", "red");
					setTimeout(function(){$("#warningSpan").text("");}, 3000);
					document.getElementsByName("t_start")[t].focus();
					return false;
				}else if(document.getElementsByName("t_end")[t].value==""
					&& document.getElementsByName("t_name")[t].value.replace(/\s/g, "")!=""){
					$("#warningSan").text("교육종료일을 입력해주세요.").css("color", "red");
					setTimeout(function(){$("#warningSpan").text("");}, 3000);
					document.getElementsByName("t_end")[t].focus();
					return false;
				}else if(document.getElementsByName("t_end")[t].value==""
					&& document.getElementsByName("t_start")[t].value!=""){
					$("#warningSpan").text("교육종료일을 입력해주세요.").css("color", "red");
					setTimeout(function(){$("#warningSpan").text("");}, 3000);
					document.getElementsByName("t_end")[t].focus();
					return false;
				}else if(document.getElementsByName("t_end")[t].value==""
					&& document.getElementsByName("t_institution")[t].value.replace(/\s/g, "")!=""){
					$("#warningSpan").text("교육종료일을 입력해주세요.").css("color", "red");
					setTimeout(function(){$("#warningSpan").text("");}, 3000);
					document.getElementsByName("t_end")[t].focus();
					return false;
				}else if(document.getElementsByName("t_institution")[t].value.replace(/\s/g, "")==""
					&& document.getElementsByName("t_name")[t].value.replace(/\s/g, "")!=""){
					$("#warningSpan").text("교육기관을 입력해주세요.").css("color", "red");
					setTimeout(function(){$("#warningSpan").text("");}, 3000);
					document.getElementsByName("t_institution")[t].focus();
					return false;
				}else if(document.getElementsByName("t_institution")[t].value.replace(/\s/g, "")==""
					&& document.getElementsByName("t_start")[t].value!=""){
					$("#warningSpan").text("교육기관을 입력해주세요.").css("color", "red");
					setTimeout(function(){$("#warningSpan").text("");}, 3000);
					document.getElementsByName("t_institution")[t].focus();
					return false;
				}else if(document.getElementsByName("t_institution")[t].value.replace(/\s/g, "")==""
					&& document.getElementsByName("t_end")[t].value.replace(/\s/g, "")!=""){
					$("#warningSpan").text("교육기관을 입력해주세요.").css("color", "red");
					setTimeout(function(){$("#warningSpan").text("");}, 3000);
					document.getElementsByName("t_institution")[t].focus();
					return false;
				}else{
					$("#warningSpan").text("");
				}
		 }
	}else if(t_size==1){
		if(document.getElementsByName("t_name")[0].value.replace(/\s/g, "")=="" 
			&& document.getElementsByName("t_start")[0].value !=""){
			$("#warningSpan").text("교육명을 입력해주세요.").css("color", "red");
			setTimeout(function(){$("#warningSpan").text("");}, 3000);
			document.getElementsByName("t_name")[0].focus();
			return false;
		}else if(document.getElementsByName("t_name")[0].value.replace(/\s/g, "")=="" 
			&& document.getElementsByName("t_end")[0].value !=""){
			$("#warningSpan").text("교육명을 입력해주세요.").css("color", "red");
			setTimeout(function(){$("#warningSpan").text("");}, 3000);
			document.getElementsByName("t_name")[0].focus();
			return false;
		}else if(document.getElementsByName("t_name")[0].value.replace(/\s/g, "")==""
			&& document.getElementsByName("t_institution")[0].value.replace(/\s/g, "")!=""){
			$("#warningSpan").text("교육명을 입력해주세요.").css("color", "red");
			setTimeout(function(){$("#warningSpan").text("");}, 3000);
			document.getElementsByName("t_name")[0].focus();
			return false;
		}else if(document.getElementsByName("t_start")[0].value==""
			&& document.getElementsByName("t_name")[0].value.replace(/\s/g, "")!=""){
			$("#warningSpan").text("교육시작일을 입력해주세요.").css("color", "red");
			setTimeout(function(){$("#warningSpan").text("");}, 3000);
			document.getElementsByName("t_start")[0].focus();
			return false;
		}else if(document.getElementsByName("t_start")[0].value==""
			&& document.getElementsByName("t_end")[0].value!=""){
			$("#warningSpan").text("교육시작일을 입력해주세요.").css("color", "red");
			setTimeout(function(){$("#warningSpan").text("");}, 3000);
			document.getElementsByName("t_start")[0].focus();
			return false;
		}else if(document.getElementsByName("t_start")[0].value==""
			&& document.getElementsByName("t_institution")[0].value.replace(/\s/g, "")!=""){
			$("#warningSpan").text("교육시작일을 입력해주세요.").css("color", "red");
			setTimeout(function(){$("#warningSpan").text("");}, 3000);
			document.getElementsByName("t_start")[0].focus();
			return false;
		}else if(document.getElementsByName("t_end")[0].value==""
			&& document.getElementsByName("t_name")[0].value.replace(/\s/g, "")!=""){
			$("#warningSpan").text("교육종료일을 입력해주세요.").css("color", "red");
			setTimeout(function(){$("#warningSpan").text("");}, 3000);
			document.getElementsByName("t_end")[0].focus();
			return false;
		}else if(document.getElementsByName("t_end")[0].value==""
			&& document.getElementsByName("t_start")[0].value!=""){
			$("#warningSpan").text("교육종료일을 입력해주세요.").css("color", "red");
			setTimeout(function(){$("#warningSpan").text("");}, 3000);
			document.getElementsByName("t_end")[0].focus();
			return false;
		}else if(document.getElementsByName("t_end")[0].value==""
			&& document.getElementsByName("t_institution")[0].value.replace(/\s/g, "")!=""){
			$("#warningSpan").text("교육종료일을 입력해주세요.").css("color", "red");
			setTimeout(function(){$("#warningSpan").text("");}, 3000);
			document.getElementsByName("t_end")[0].focus();
			return false;
		}else if(document.getElementsByName("t_institution")[0].value.replace(/\s/g, "")==""
			&& document.getElementsByName("t_name")[0].value.replace(/\s/g, "")!=""){
			$("#warningSpan").text("교육기관을 입력해주세요.").css("color", "red");
			setTimeout(function(){$("#warningSpan").text("");}, 3000);
			document.getElementsByName("t_institution")[0].focus();
			return false;
		}else if(document.getElementsByName("t_institution")[0].value.replace(/\s/g, "")==""
			&& document.getElementsByName("t_start")[0].value!=""){
			$("#warningSpan").text("교육기관을 입력해주세요.").css("color", "red");
			setTimeout(function(){$("#warningSpan").text("");}, 3000);
			document.getElementsByName("t_institution")[0].focus();
			return false;
		}else if(document.getElementsByName("t_institution")[0].value.replace(/\s/g, "")==""
			&& document.getElementsByName("t_end")[0].value.replace(/\s/g, "")!=""){
			$("#warningSpan").text("교육기관을 입력해주세요.").css("color", "red");
			setTimeout(function(){$("#warningSpan").text("");}, 3000);
			document.getElementsByName("t_institution")[0].focus();
			return false;
		}else{
			$("#warningSpan").text("");
		}
	}else{
		$("#warningSpan").text("");
	}
	
	//기술
	var s_table = document.getElementById("s_table");
	var s_size = (s_table.rows.length)-1;
	if(s_size > 1){
		for(var s=1; s < s_size; s++){
			if(document.getElementsByName("s_ability")[s].value.replace(/\s/g, "")==""){
				$("#warningSpan").text("보유 기술명을 입력해주세요.").css("color", "red");
				setTimeout(function(){$("#warningSpan").text("");}, 3000);
				document.getElementsByName("s_ability")[s].focus();
				return false;
			}else if(document.getElementsByName("s_ability")[s].value.replace(/\s/g, "")==""
				&& document.getElementsByName("s_level")[s].value!=""){
				$("#warningSpan").text("보유 기술명을 입력해주세요.").css("color", "red");
				setTimeout(function(){$("#warningSpan").text("");}, 3000);
				document.getElementsByName("s_ability")[s].focus();
				return false;
			}else if(document.getElementsByName("s_level")[s].value==""
				&& document.getElementsByName("s_ability")[s].value.replace(/\s/g, "")!=""){
				$("#warningSpan").text("숙련도를 선택해주세요.").css("color", "red");
				setTimeout(function(){$("#warningSpan").text("");}, 3000);
				document.getElementsByName("s_level")[s].focus();
				return false;
			}else{
				$("#warningSpan").text("");
			}
		}
	}else if(s_size==1){
		if(document.getElementsByName("s_ability")[0].value.replace(/\s/g, "")==""
			&& document.getElementsByName("s_level")[0].value!=""){
			alert(document.getElementsByName("s_level")[0].value);
			$("#warningSpan").text("보유 기술명을 입력해주세요.").css("color", "red");
			setTimeout(function(){$("#warningSpan").text("");}, 3000);
			document.getElementsByName("s_ability")[0].focus();
			return false;
		}else if(document.getElementsByName("s_level")[0].value==""
			&& document.getElementsByName("s_ability")[0].value.replace(/\s/g, "")!=""){
			$("#warningSpan").text("숙련도를 선택해주세요.").css("color", "red");
			setTimeout(function(){$("#warningSpan").text("");}, 3000);
			document.getElementsByName("s_level")[0].focus();
			return false;
		}else{
			$("#warningSpan").text("");
		}
	}else{
		$("#warningSpan").text("");
	}
	
	return true;
}
