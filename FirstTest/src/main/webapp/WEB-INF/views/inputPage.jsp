<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>

<html>
<head>
<meta charset=UTF-8>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>사원정보 상세페이지</title>
	<!-- 부트스트랩 -->
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
    <!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
	<!-- head테그에서 <style>로 css를 사용하지 않고   /resources/css/table.css 에서 따로 css파일을 만들어서 링크를 걸어줌 -->
	<link rel="stylesheet" type="text/css" href="/resources/css/inputPage.css"/>
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript" src="/resources/js/jquery-ui.js"></script>
	<link rel="stylesheet" type="text/css" href="/resources/css/jquery-ui.css"/>
	<script type="text/javascript" src="/resources/js/jquery.mask.js"></script>
	<script type="text/javascript" src="/resources/js/register.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<!-- datepicker 한국어로 -->
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>

	<script type="text/javascript">
		$(function(){
			
			/* 입대일-제대일 */
			// 입대일(#pm_start)은 제대일(#pm_end) 이후 날짜 선택 불가
            // 제대일(#pm_end)은 입대일(#pm_start) 이전 날짜 선택 불가
            //입대일.
            $('#pm_start').datepicker({
                showOn: "focus",                     // 달력을 표시할 타이밍 (both: focus or button)
                /* buttonImage: "images/calendar.gif", */ // 버튼 이미지
                buttonImageOnly : true,             // 버튼 이미지만 표시할지 여부
                /* appendText: "(입대일을 선택해주세요.)", */
                /* buttonText: "날짜선택", */             // 버튼의 대체 텍스트
                dateFormat: "yy-mm-dd",             // 날짜의 형식
                changeYear: true,
                changeMonth: true,                  // 월을 이동하기 위한 선택상자 표시여부
                //minDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
                onClose: function( selectedDate ) {    
                    // 시작일(fromDate) datepicker가 닫힐때
                    // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                    $("#pm_end").datepicker( "option", "minDate", selectedDate );
                }                
            });
            //제대일
            $('#pm_end').datepicker({
                showOn: "focus", 
               /*  buttonImage: "images/calendar.gif",  */
                buttonImageOnly : true,
               /*  appendText: "(제대일을 선택해주세요.)", */
                /* buttonText: "날짜선택", */
                dateFormat: "yy-mm-dd",
                changeYear: true,
                changeMonth: true,
                //minDate: 0, // 오늘 이전 날짜 선택 불가
                onClose: function( selectedDate ) {
                    // 종료일(#pm_end) datepicker가 닫힐때
                    // 시작일(#pm_start)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
                    $("#pm_start").datepicker( "option", "maxDate", selectedDate );
                }                
            });

			/* 입사일-퇴사일 */
			// 입사일(#c_start)은 퇴사일(#c_end) 이후 날짜 선택 불가
            // 퇴사일(#c_end)은 입사일(#c_start) 이전 날짜 선택 불가
            //입사일.
            $('#c_start').datepicker({
                showOn: "focus",                     // 달력을 표시할 타이밍 (both: focus or button)
                /* buttonImage: "images/calendar.gif", */ // 버튼 이미지
                buttonImageOnly : true,             // 버튼 이미지만 표시할지 여부
                /* buttonText: "날짜선택", */             // 버튼의 대체 텍스트
                dateFormat: "yy-mm-dd",             // 날짜의 형식
                changeYear: true,
                changeMonth: true,                  // 월을 이동하기 위한 선택상자 표시여부
                //minDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
                onClose: function( selectedDate ) {    
                    // 시작일(#c_start) datepicker가 닫힐때
                    // 종료일(#c_end)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                    $("#c_end").datepicker( "option", "minDate", selectedDate );
                }                
            });
            //퇴사일
            $('#c_end').datepicker({
                showOn: "focus", 
               /*  buttonImage: "images/calendar.gif",  */
                buttonImageOnly : true,
                /* buttonText: "날짜선택", */
                dateFormat: "yy-mm-dd",
                changeYear: true,
                changeMonth: true,
                //minDate: 0, // 오늘 이전 날짜 선택 불가
                onClose: function( selectedDate ) {
                    // 종료일(#c_end) datepicker가 닫힐때
                    // 시작일(#c_start)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
                    $("#c_start").datepicker( "option", "maxDate", selectedDate );
                }                
            });
			/* 교육 시작일-수료일 */
			// 시작일(#t_start)은 수료일(#t_end) 이후 날짜 선택 불가
            // 수료일(#t_end)은 시작일(#t_start) 이전 날짜 선택 불가
            //시작일.
            $('#t_start').datepicker({
                showOn: "focus",                     // 달력을 표시할 타이밍 (both: focus or button)
                /* buttonImage: "images/calendar.gif", */ // 버튼 이미지
                buttonImageOnly : true,             // 버튼 이미지만 표시할지 여부
                /* buttonText: "날짜선택", */             // 버튼의 대체 텍스트
                dateFormat: "yy-mm-dd",             // 날짜의 형식
                changeYear: true,
                changeMonth: true,                  // 월을 이동하기 위한 선택상자 표시여부
                //minDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
                onClose: function( selectedDate ) {    
                    // 시작일(t_start) datepicker가 닫힐때
                    // 종료일(t_end)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                    $("#t_end").datepicker( "option", "minDate", selectedDate );
                }                
            });
            //수료일
            $('#t_end').datepicker({
                showOn: "focus", 
               /*  buttonImage: "images/calendar.gif",  */
                buttonImageOnly : true,
                /* buttonText: "날짜선택", */
                dateFormat: "yy-mm-dd",
                changeYear: true,
                changeMonth: true,
                //minDate: 0, // 오늘 이전 날짜 선택 불가
                onClose: function( selectedDate ) {
                    // 종료일(t_end) datepicker가 닫힐때
                    // 시작일(t_start)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
                    $("#t_start").datepicker( "option", "maxDate", selectedDate );
                }                
            });
			
		/* 집전화 하이픈 자동입력 함수 */	 
		/* $('#p_phone').keyup(function() {
				var key = null;
					key = $('#p_phone').val().length;
				if (key < 13) {
					if ($('#p_phone').val().substring(0, 3) == 02) {
						$('#p_phone').mask('(00) 000-0000');
					}
				} else if (key == 13) {
					if ($('#p_phone').val().substring(1, 3) == 02) {
						$('#p_phone').mask('(00) 0000-0000');
					} else {
						$('#p_phone').mask('(000) 000-0000');
					}
				} else if (key > 14) {
					$('#p_phone').mask('(000) 0000-0000');
				}
			}); */

			/* 포커스를 잃을때 이벤트 */
			/* $("#p_phone").blur(function (event) {
			    var p_phone = $(this).val();
			    $(this).val(p_phone);
			}); */
			
			
			//전화번호 자동 하이픈 (##############)
			$("#p_phone").keydown(function (event){
				var p_val = "";
				p_val = $("#p_phone").val().replace(/[^0-9]/g, '');
				var p_valLength = "";
				p_valLength = p_val.length;
				var scode = "";
				scode = p_val.substring(0,2);
				if(p_valLength < 9){
					if(scode=="02"){
						$('#p_phone').mask('(00) 000-0000');
					}else{
						$('#p_phone').mask('(000) 000-0000');
					}
				}else if(p_valLength == 9){
					if(scode=="02"){
						$('#p_phone').mask('(00) 0000-0000');
					}else{
						$('#p_phone').mask('(000) 000-0000');
					}
				}else if(p_valLength == 10){
					if(scode=="02"){
						$('#p_phone').mask('(00) 0000-0000');
					}else{
						$('#p_phone').mask('(000) 0000-0000');
					}
				}
				 $("#p_phone").keyup(function(event){
					var pu_val = "";
					pu_val = $("#p_phone").val().replace(/[^0-9]/g, '');
					var pu_valLength = "";
					pu_valLength = pu_val.length;
					var sucode = "";
					sucode = pu_val.substring(0,2);
					if(pu_valLength < 9){
						if(sucode=="02"){
							$('#p_phone').mask('(00) 000-0000');
						}else{
							$('#p_phone').mask('(000) 000-0000');
						}
					}else if(pu_valLength == 9){
						if(sucode=="02"){
							$('#p_phone').mask('(00) 000-0000');
						}else{
							$('#p_phone').mask('(000) 000-0000');
						}
					}else if(pu_valLength == 10){
						if(sucode=="02"){
							$('#p_phone').mask('(00) 0000-0000');
						}else{
							$('#p_phone').mask('(000) 000-0000');
						}
					}else if(pu_valLength == 11){
						$('#p_phone').mask('(000) 0000-0000');
					}
				});
			});
			
			//전화번호 자동 하이픈
			/* function autoHypen(str) {
				str = str.replace(/[^0-9]/g, '');
				var tmp = '';
				if (str.length < 8) {
					return str;
				} else if (str.length < 10) {
					if(str.substring(0,2)=='02'){
						tmp = '';
						tmp += '(';
						tmp += str.substring(0, 2);
						tmp += ')';
						tmp += ' '+str.substring(2, 5);
						tmp += '-'+str.substring(5);
						return tmp;
					}else{
						tmp = '';
						tmp += '(';
						tmp += str.substring(0, 3);
						tmp += ')';
						tmp += ' '+str.substring(3,6);
						tmp += '-'+str.substring(6);
						return tmp;
					}
				} else if (str.length < 11) {
					if(str.substring(0,2)=='02'){
						tmp = '';
						tmp += '(';
						tmp += str.substring(0, 2);
						tmp += ')';
						tmp += ' '+str.substring(2, 6);
						tmp += '-'+str.substring(6, 10);
						return tmp;
					}else{
						tmp = '';
						tmp += '(';
						tmp += str.substring(0, 3);
						tmp += ')';
						tmp += ' '+str.substring(3, 6);
						tmp += '-'+str.substring(6);
						return tmp;
					}
				} else if(str.length >= 11){
					if(str.substring(0,2)=='02'){
						tmp = '';
						tmp += '(';
						tmp += str.substring(0, 2);
						tmp += ')';
						tmp += ' '+str.substring(2, 6);
						tmp += '-'+str.substring(6, 10);
						return tmp;
					}else{
						tmp = '';
						tmp += '(';
						tmp += str.substring(0, 3);
						tmp += ')';
						tmp += ' '+str.substring(3, 7);
						tmp += '-'+str.substring(7, 11);
						return tmp;
					}
				}
				return str;
			}
			var p_phone = document.getElementById('p_phone');
			p_phone.onkeyup = function(event) {
				event = event || window.event;
				var tval = this.value.trim();
				this.value = autoHypen(tval);
			} */
			
			/* 주민번호 중복검사 */
			var jumin = 0; //주민번호 중복검사를 안했을때나 중복일때 0, 중복검사후 중복이 아니면 1
			var checkAjaxSetTimeout;
			$('#p_number').keyup(function() {
				clearTimeout(checkAjaxSetTimeout);
				checkAjaxSetTimeout = setTimeout(function() {
					if ($('#p_number').val().length > 6) {
						var p_number = $('#p_number').val();
						// ajax 실행
						$.ajax({
							url : "/firstTest/juminOverlap.do",
							type : "GET",
							data : {
								p_number : p_number
							},
							cache : false,
							async : false,
							dataType : "text",
							error : function() {
								alert("주민번호 중복검사 애러");
							},
							success : function(response) {
								if (response == '0') {
									jumin = 1;//주민번호가 검사후에 중복이 아니면 1
									$("#warningSpan").text("주민번호가 중복되지 않습니다.");
									setTimeout(function(){$("#warningSpan").text("");}, 3000);
								} else {
									$("#warningSpan").text("주민번호가 중복이 됩니다. 다시 입력 해주세요.").css("color", "red");
									setTimeout(function(){$("#warningSpan").text("");}, 3000);
									return false;
								}
							}
						}); // end ajax
					}
				}, 1000); //end setTimeout
			}); // end keyup
			
			/* 이메일 중복검사 */
			var mail = 0; //이메일 중복검사를 안했을때나 중복일때 0, 중복검사후 중복이 아니면 1
			var checkAjaxSetTimeout_2;
			$('#p_email').keyup(function() {
				clearTimeout(checkAjaxSetTimeout_2);
				checkAjaxSetTimeout_2 = setTimeout(function() {
					if ($('#p_email').val().length > 8) {
						var p_email = $('#p_email').val();
						// ajax 실행
						$.ajax({
							url : "/firstTest/mailOverlap.do",
							type : "GET",
							data : {
								p_email : p_email
							},
							cache : false,
							async : false,
							dataType : "text",
							error : function() {
								alert("이메일 중복검사 애러");
							},
							success : function(response) {
								if (response == '0') {
									mail = 1;//이메일 주소가 검사후에 중복이 아니면 1
									$("#warningSpan").text("이메일이 중복되지 않습니다.");
									setTimeout(function(){$("#warningSpan").text("");}, 3000);
								} else {
									$("#warningSpan").text("이메일이 중복이 됩니다. 다시 입력 해주세요.").css("color", "red");
									setTimeout(function(){$("#warningSpan").text("");}, 3000);
									$("#p_email").value("");
									writeForm.p_email.focus();
									return false;
								}
							}
						}); // end ajax
					}
				}, 1000); //end setTimeout
			}); // end keyup
			
			/* 입사일, 입.졸업일, 자격증취득일 */
			$(function() {
				$("#p_join, #edu_date, #l_date").datepicker({
					dateFormat : 'yy-mm-dd',
					changeYear : true,
					changeMonth : true,
				});
			});
			
			/* ========= 자격증 테이블 ====================================================================== */

			/* 자격증테이블 추가삭제  */
			$(function() {
				$(document).on(
						"click",
						"#l_add_btn",
						function() { //동적으로 생성된 버튼의 이벤트는 이런식으로 준다...
							// clone
							$.trClone = $("#l_table tr:last").clone().html();
							$.newTr = $("<tr>" + $.trClone + "</tr>");

							// append
							$("#l_table").append($.newTr).find(
									"tr:last input[type='text']").val("");

							// add Button 추가
							$.btnAdd = $(document.createElement("input"));
							$.btnAdd.attr({
								id : "l_add_btn",
								name : "l_add_btn",
								type : "button",
								value : "+"
							});
							/* $.btnAdd.attr.addClass("l_add_btn"); */
							$("#l_table tr:last td:last").html("");
							$("#l_table tr:last td:last").append($.btnAdd);
							/* 동적으로 추가된 데이트피커 */
							//id를 제거하여 추가된 데이트피커가 그 전의 데이트피커에 영향을 주지않게함
							$(document).find("input[name=l_date]").removeClass(
									'hasDatepicker').removeAttr('id')
									.datepicker({
										dateFormat : 'yy-mm-dd',
										changeYear : true,
										changeMonth : true,
									});
							// delete Button 추가
							$.btnDelete = $(document.createElement("input"));
							$.btnDelete.attr({
								id : "l_del_btn",
								name : "l_del_btn",
								type : "button",
								value : "-"
							});
							$("#l_table tr:last td:last").html("");
							$("#l_table tr:last td:last").append($.btnDelete);
							// 삭제 버튼에 클릭 이벤트 추가
							$("#l_table tr>td:last>input[id='l_del_btn']").on(
									'click', function() {
										$(this).parent().parent().remove();
									});
							$("#l_add_btn").parent().css("width","17px");
							$("#l_del_btn").parent().css("width","17px");
						});
				// 초기화
				/* $("#tableReset").on("click",function(){ 
				     $("#frmTest").each(function(){ this.reset(); });
				
				     $("input[name='btnRemove']").each(function () {
				         $(this).trigger('click');
				     });
				 }); */
			});
			
			/* ===================================================================================== */
			/* ========= 기술 테이블 ====================================================================== */
			/* 기술테이블 추가삭제  */
			$(function() {
				$(document).on(
						"click",
						"#s_add_btn",
						function() { //동적으로 생성된 버튼의 이벤트는 이런식으로 준다...
							// clone
							$.trClone = $("#s_table tr:last").clone().html();
							$.newTr = $("<tr>" + $.trClone + "</tr>");

							// append
							$("#s_table").append($.newTr).find(
									"tr:last input[type='text']").val("");

							// add Button 추가
							$.btnAdd = $(document.createElement("input"));
							$.btnAdd.attr({
								id : "s_add_btn",
								name : "s_add_btn",
								type : "button",
								value : "+"
							});
							/* $.btnAdd.attr.addClass("s_add_btn"); */
							$("#s_table tr:last td:last").html("");
							$("#s_table tr:last td:last").append($.btnAdd);
							// delete Button 추가
							$.btnDelete = $(document.createElement("input"));
							$.btnDelete.attr({
								id : "s_del_btn",
								name : "s_del_btn",
								type : "button",
								value : "-"
							});
							$("#s_table tr:last td:last").html("");
							$("#s_table tr:last td:last").append($.btnDelete);
							// 삭제 버튼에 클릭 이벤트 추가
							$("#s_table tr>td:last>input[id='s_del_btn']").on(
									'click', function() {
										$(this).parent().parent().remove();
									});
							/* 해당 테이블의 행의 개수 */
							/* var table = document.getElementById("l_table");
							alert(table.rows.length); */
							$("#s_add_btn").parent().css("width","17px");
							$("#s_del_btn").parent().css("width","17px");
						});
				// 초기화
				/* $("#tableReset").on("click",function(){ 
				     $("#frmTest").each(function(){ this.reset(); });
				
				     $("input[name='btnRemove']").each(function () {
				         $(this).trigger('click');
				     });
				 }); */
			});
			/* ===================================================================================== */
			/* ========= 학력 테이블 ====================================================================== */
			/* 학력테이블 추가삭제  */
			$(function() {
				$(document).on(
								"click",
								"#edu_add_btn",
								function() { //동적으로 생성된 버튼의 이벤트는 이런식으로 준다...
									// clone
									$.trClone = $("#edu_table tr:last").clone()
											.html();
									$.newTr = $("<tr>" + $.trClone + "</tr>");
									// append
									$("#edu_table").append($.newTr).find(
											"tr:last input[type='text']").val(
											"");
									// add Button 추가
									$.btnAdd = $(document
											.createElement("input"));
									$.btnAdd.attr({
										id : "edu_add_btn",
										name : "edu_add_btn",
										type : "button",
										value : "+"
									});
									/* $.btnAdd.attr.addClass("l_add_btn"); */
									$("#edu_table tr:last td:last").html("");
									$("#edu_table tr:last td:last").append(
											$.btnAdd);
									/* 동적으로 추가된 데이트피커 */
									//id를 제거하여 추가된 데이트피커가 그 전의 데이트피커에 영향을 주지않게함
									$(document).find("input[name=edu_date]")
											.removeClass('hasDatepicker')
											.removeAttr('id').datepicker({
												dateFormat : 'yy-mm-dd',
												changeYear : true,
												changeMonth : true,
											});
									// delete Button 추가
									$.btnDelete = $(document
											.createElement("input"));
									$.btnDelete.attr({
										id : "edu_del_btn",
										name : "edu_del_btn",
										type : "button",
										value : "-"
									});
									$("#edu_table tr:last td:last").html("");
									$("#edu_table tr:last td:last").append(
											$.btnDelete);
									// 삭제 버튼에 클릭 이벤트 추가
									$("#edu_table tr>td:last>input[id='edu_del_btn']")
										.on('click',function() {$(this).parent().parent().remove();});
									$("#edu_add_btn").parent().css("width","17px");
									$("#edu_del_btn").parent().css("width","17px");
								});
				// 초기화
				/* $("#tableReset").on("click",function(){ 
				     $("#frmTest").each(function(){ this.reset(); });
				
				     $("input[name='btnRemove']").each(function () {
				         $(this).trigger('click');
				     });
				 }); */
			});
			/* ===================================================================================== */
			/* ========= 경력 테이블 ====================================================================== */
			/* 경력테이블 추가삭제  */
			$(function() {
				$(document).on("click","#c_add_btn",function() { //동적으로 생성된 버튼의 이벤트는 이런식으로 준다...
									// clone
									$.trClone = $("#c_table tr:last").clone()
											.html();
									$.newTr = $("<tr>" + $.trClone + "</tr>");

									// append
									$("#c_table").append($.newTr).find(
											"tr:last input[type='text']").val(
											"");

									// add Button 추가
									$.btnAdd = $(document
											.createElement("input"));
									$.btnAdd.attr({
										id : "c_add_btn",
										name : "c_add_btn",
										type : "button",
										value : "+"
									});
									/* $.btnAdd.attr.addClass("l_add_btn"); */
									$("#c_table tr:last td:last").html("");
									$("#c_table tr:last td:last").append(
											$.btnAdd);
									/* 동적으로 추가된 데이트피커 */
									//id를 제거하여 추가된 데이트피커가 그 전의 데이트피커에 영향을 주지않게함
									$(document)
											.find("input[name=c_start]")
											.removeClass('hasDatepicker')
											.removeAttr('id')
											.datepicker(
													{
														showOn : "focus", // 달력을 표시할 타이밍 (both: focus or button)
														/* buttonImage: "images/calendar.gif", */// 버튼 이미지
														buttonImageOnly : true, // 버튼 이미지만 표시할지 여부
														/* appendText: "(입대일을 선택해주세요.)", */
														/* buttonText: "날짜선택", */// 버튼의 대체 텍스트
														dateFormat : "yy-mm-dd", // 날짜의 형식
														changeYear : true,
														changeMonth : true, // 월을 이동하기 위한 선택상자 표시여부
														//minDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
														onClose : function(
																selectedDate) {
															// 시작일(fromDate) datepicker가 닫힐때
															// 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
															$(this)
																	.parent()
																	.parent()
																	.find(
																			"input[name=c_end]")
																	.datepicker(
																			"option",
																			"minDate",
																			selectedDate);
														}
													});
									$(document)
											.find("input[name=c_end]")
											.removeClass('hasDatepicker')
											.removeAttr('id')
											.datepicker(
													{
														showOn : "focus",
														/*  buttonImage: "images/calendar.gif",  */
														buttonImageOnly : true,
														/*  appendText: "(제대일을 선택해주세요.)", */
														/* buttonText: "날짜선택", */
														dateFormat : "yy-mm-dd",
														changeYear : true,
														changeMonth : true,
														//minDate: 0, // 오늘 이전 날짜 선택 불가
														onClose : function(
																selectedDate) {
															// 종료일(#pm_end) datepicker가 닫힐때
															// 시작일(#pm_start)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
															$(this)
																	.parent()
																	.parent()
																	.find(
																			"input[name=c_start]")
																	.datepicker(
																			"option",
																			"maxDate",
																			selectedDate);
														}
													});
									// delete Button 추가
									$.btnDelete = $(document
											.createElement("input"));
									$.btnDelete.attr({
										id : "c_del_btn",
										name : "c_del_btn",
										type : "button",
										value : "-"
									});
									$("#c_table tr:last td:last").html("");
									$("#c_table tr:last td:last").append(
											$.btnDelete);
									// 삭제 버튼에 클릭 이벤트 추가
									$("#c_table tr>td:last>input[id='c_del_btn']")
											.on('click',function() {$(this).parent().parent().remove();});
									$("#c_add_btn").parent().css("width","17px");
									$("#c_del_btn").parent().css("width","17px");
								});
				// 초기화
				/* $("#tableReset").on("click",function(){ 
				     $("#frmTest").each(function(){ this.reset(); });
				
				     $("input[name='btnRemove']").each(function () {
				         $(this).trigger('click');
				     });
				 }); */
			});

		/* ===================================================================================== */
			/* ========= 교육연수 테이블 ====================================================================== */
			/* 교육연수테이블 추가삭제  */

			$(function() {
				$(document)
						.on(
								"click",
								"#t_add_btn",
								function() { //동적으로 생성된 버튼의 이벤트는 이런식으로 준다...
									// clone
									$.trClone = $("#t_table tr:last").clone()
											.html();
									$.newTr = $("<tr>" + $.trClone + "</tr>");

									// append
									$("#t_table").append($.newTr).find(
											"tr:last input[type='text']").val(
											"");

									// add Button 추가
									$.btnAdd = $(document
											.createElement("input"));
									$.btnAdd.attr({
										id : "t_add_btn",
										name : "t_add_btn",
										type : "button",
										value : "+"
									});
									/* $.btnAdd.attr.addClass("l_add_btn"); */
									$("#t_table tr:last td:last").html("");
									$("#t_table tr:last td:last").append(
											$.btnAdd);
									/* 동적으로 추가된 데이트피커 */
									//id를 제거하여 추가된 데이트피커가 그 전의 데이트피커에 영향을 주지않게함
									$(document)
											.find("input[name=t_start]")
											.removeClass('hasDatepicker')
											.removeAttr('id')
											.datepicker(
													{
														showOn : "focus", // 달력을 표시할 타이밍 (both: focus or button)
														/* buttonImage: "images/calendar.gif", */// 버튼 이미지
														buttonImageOnly : true, // 버튼 이미지만 표시할지 여부
														/* appendText: "(입대일을 선택해주세요.)", */
														/* buttonText: "날짜선택", */// 버튼의 대체 텍스트
														dateFormat : "yy-mm-dd", // 날짜의 형식
														changeYear : true,
														changeMonth : true, // 월을 이동하기 위한 선택상자 표시여부
														//minDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
														onClose : function(
																selectedDate) {
															// 시작일(fromDate) datepicker가 닫힐때
															// 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
															$(this)
																	.parent()
																	.parent()
																	.find(
																			"input[name=t_end]")
																	.datepicker(
																			"option",
																			"minDate",
																			selectedDate);
														}
													});
									$(document)
											.find("input[name=t_end]")
											.removeClass('hasDatepicker')
											.removeAttr('id')
											.datepicker(
													{
														showOn : "focus",
														/*  buttonImage: "images/calendar.gif",  */
														buttonImageOnly : true,
														/*  appendText: "(제대일을 선택해주세요.)", */
														/* buttonText: "날짜선택", */
														dateFormat : "yy-mm-dd",
														changeYear : true,
														changeMonth : true,
														//minDate: 0, // 오늘 이전 날짜 선택 불가
														onClose : function(
																selectedDate) {
															// 종료일(#pm_end) datepicker가 닫힐때
															// 시작일(#pm_start)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
															$(this)
																	.parent()
																	.parent()
																	.find(
																			"input[name=t_start]")
																	.datepicker(
																			"option",
																			"maxDate",
																			selectedDate);
														}
													});
									// delete Button 추가
									$.btnDelete = $(document
											.createElement("input"));
									$.btnDelete.attr({
										id : "t_del_btn",
										name : "t_del_btn",
										type : "button",
										value : "-"
									});
									$("#t_table tr:last td:last").html("");
									$("#t_table tr:last td:last").append(
											$.btnDelete);
									// 삭제 버튼에 클릭 이벤트 추가
									$(
											"#t_table tr>td:last>input[id='t_del_btn']")
											.on(
													'click',
													function() {
														$(this).parent()
																.parent()
																.remove();
													});

									/* 해당 테이블의 행의 개수 */
									/* var table = document.getElementById("l_table");
									alert(table.rows.length); */
									$("#l_add_btn").parent().css("width","17px");
									$("#l_del_btn").parent().css("width","17px");
								});
				// 초기화
				/* $("#tableReset").on("click",function(){ 
				     $("#frmTest").each(function(){ this.reset(); });
				
				     $("input[name='btnRemove']").each(function () {
				         $(this).trigger('click');
				     });
				 }); */
			});
			/* ===================================================================================== */
			
			/* 저장버튼을 누르면 주민번호와 이메일의 중복검사 상태를 확인 후에 유효성검사에 넘긴다 유효성 검사후에 DB에 저장함*/
			$("#input_btn").click(function(){
				if(jumin!=1){
					alert("주민번호를 확인해주세요.");
				}else if(mail!=1){
					alert("이메일을 확인해주세요.");
				}else{
					insertData();
				}
			});
			
			/* 취소버튼클릭시 메인화면으로 이동 */
			$("#cencle_btn").click(function() {
				location.href = "/firstTest/main_List.do";
			});
			
			
			
		});

		/* ====== 유효성검사 =========================================================================== */
				
		/* 텍스트박스에 숫자와 편집키만 허용하는 함수 */
		function onlyNumber(event) {
			event = event || window.event;
			var keyID = (event.which) ? event.which : event.keyCode;
			if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105)
					|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39) {
				return;
			} else {
				return false;
			}
		}

		/* jquery mask */
		$(document).ready(function() {
			$('#p_number').mask('000000-0000000');
			$('#p_cell').mask('(000) 0000-0000');
		});

		/* 다음 우편번호 주소 검색API */
		function DaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
							// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
							var extraRoadAddr = ''; // 도로명 조합형 주소 변수
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraRoadAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraRoadAddr += (extraRoadAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraRoadAddr !== '') {
								extraRoadAddr = ' (' + extraRoadAddr + ')';
							}
							// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
							if (fullRoadAddr !== '') {
								fullRoadAddr += extraRoadAddr;
							}
							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							var addr = "";
							addr = "(" + data.zonecode + ") " + fullRoadAddr;

							document.getElementById('p_addr').value = addr;
							/* document.getElementById('p_addr').value = data.zonecode; //5자리 새우편번호 사용
							document.getElementById('p_addr').value = fullRoadAddr;
							document.getElementById('sample4_jibunAddress').value = data.jibunAddress; */

							// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
							if (data.autoRoadAddress) {
								//예상되는 도로명 주소에 조합형 주소를 추가한다.
								var expRoadAddr = data.autoRoadAddress
										+ extraRoadAddr;
								document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
										+ expRoadAddr + ')';
							} else if (data.autoJibunAddress) {
								var expJibunAddr = data.autoJibunAddress;
								document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
										+ expJibunAddr + ')';
							} else {
								document.getElementById('guide').innerHTML = '';
							}
						}
					}).open();
		}

		/* ===================================================================================== */
	</script>
</head>
<body>
<div id="containerDiv">
<div id="containerDiv2">
	<header>
		<div id="headerDiv">
			<h2>개 인 이 력 카 드 &nbsp;&nbsp;&nbsp; <span id="warningSpan"></span></h2>
		</div>
	</header>
	<section>
	<form id="writeForm" name="writeForm" method="POST">
		<div id="sectionDiv1">			
			<table id="p_table">
				<tr>
					<th>
						<label for="p_name">성명</label>
					</th>
					<td>
						<input type="text" name="p_name" id="p_name" placeholder="이름을 입력하세요." required="required" maxlength="6">
					</td>
					<th >
						<label for="p_number">주민등록번호</label>
					</th>
					<td colspan="3">
						<input type="text" name="p_number" id="p_number" maxlength="14" onkeydown="return onlyNumber(event)" placeholder="주민등록번호를 입력하세요." required="required">
					</td>
					<th>
						<label for="p_sex">성별</label>
					</th>
					<td>
						<select name="p_sex" id="p_sex" >
							<option value="남">남</option>
							<option value="여">여</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>
						<label for="p_company">소속회사</label>
					</th>
					<td  colspan="3">
						<input type="text" name="p_company" id="p_company" required="required" placeholder="소속회사를 입력하세요." maxlength="25">
					</td>
					<th>
						<label for="p_join">입사일</label>
					</th>
					<td colspan="3">
						<input type="text" id="p_join" name="p_join" required="required" readonly="readonly" placeholder="입사일을 입력하세요.">
					</td>
				</tr>
				<tr>
					<th>
						<label for="p_dept">부서</label>
					</th>
					<td>
						<input type="text" name="p_dept" id="p_dept" required="required" placeholder="부서를 입력하세요." maxlength="15">
					</td>
					<th>
						<label for="p_position">직위</label>
					</th>
					<td>
						<input type="text" name="p_position" id="p_position" required="required" placeholder="직위를 입력하세요." maxlength="7">
					</td>
					<th>
						<label for="pm_complete">병역</label>
					</th>
					<td>
						<select name="pm_complete" id="pm_complete" >
							<option value="필">필</option>
							<option value="미필">미필</option>
						</select>
					</td>
					<th>
						<label for="p_marriage">결혼</label>
					</th>
					<td>
						<select name="p_marriage" id="p_marriage" >
							<option value="미혼">미혼</option>
							<option value="기혼">기혼</option>
						</select>
					</td>
				</tr>
				<tr>
					<th colspan="2" class="yellow">
						<label for="pm_start">병역 입대일 ~ 제대일</label>
					</th>
					<td colspan="2">
						<input type="text" name="pm_start" id="pm_start" readonly="readonly" placeholder="입대일을 입력하세요.">
						<label style="font-size: 15px; font-weight: bold;"> ~ </label>
						<input type="text" name="pm_end" id="pm_end" readonly="readonly" placeholder="제대일을 입력하세요.">
					</td>
					<th colspan="2">
						<label for="pm_branch">역종,병과</label>
					</th>
					<td colspan="2">
						<input type="text" name="pm_branch" id="pm_branch" placeholder="역종, 병과를 입력하세요." maxlength="15">
					</td>
				</tr>
			</table>
		</div>
		<div id="sectionDiv2">
			<table id="p2_table">
				<tr>
					<th class="yellow">
						<label for="p_phone">전화</label>
					</th>
					<td colspan="2">
						<input type="tel" name="p_phone" id="p_phone" placeholder="집전화 번호를 입력하세요."  onkeydown="return onlyNumber(event)" maxlength="15"> <!-- onblur="chk_tel(this.value,this);" -->  
					</td>
					<td colspan="2">
						<input type="tel" name="p_cell" id="p_cell" placeholder="휴대전화 번호를 입력하세요." required="required" pattern="^\([0-9]{3}\)\s[0-9]{3}-[0-9]{4}$"> 
					</td>
				</tr>
				<tr>
					<th class="yellow">
						<label for="p_email">E-Mail</label>
					</th>
					<td colspan="4">
						<input type="email" name="p_email" id="p_email" required="required" placeholder="이메일을 입력하세요." maxlength="35">
					</td>
				</tr>
				<tr>
					<th class="yellow">
						<label for="p_addr">주소</label>
					</th>
					<td colspan="4">
						<input type="text" id="p_addr" name="p_addr" size="41" required="required" placeholder="주소를 입력하세요." onfocus="DaumPostcode()">
					</td>
				</tr>
			</table>
		</div>
		<div id="sectionDiv3">
			<table id="edu_table">
				<tr>
					<td>
						<input type="text" name="edu_name" class="edu_name" placeholder="학교명을 입력하세요.(OO 대학교)" maxlength="15">
					</td>
					<td>
						<select id="edu_inout" name="edu_inout">
							<option value="입학">입학</option>
							<option value="졸업">졸업</option>
						</select>
					</td>
					<td>
						<input type="text" name="edu_date" id="edu_date" placeholder="입학 또는 졸업일자를 입력하세요.">
					</td>
					<td class="hideTd1">
						<input type="button" id="edu_add_btn" name="edu_add_btn" value="+"/>
					</td>
					<td class="hideTd">
						
					</td>
				</tr>
				
			</table>
		</div>
		<div id="sectionDiv4" >
			<table id="l_table">
				<tr>
					<th class="yellow">
						<label>자격증명</label>
					</th>
					<th class="yellow">
						<label>취득일</label>
					</th>
					<td class="hideTd1"></td>
					<td class="hideTd"></td>
				</tr>
				<tr>
					<td>
						<input type="text" name="l_name" placeholder="자격증명을 입력하세요." maxlength="25">
					</td>
					<td>
						<input type="text" name="l_date" id="l_date" placeholder="자격증 취득일을 입력하세요.">
					</td>
					<td class="hideTd1">
						<input type="button" id="l_add_btn" name="l_add_btn" value="+"/>
					</td>
					<td class="hideTd">
						
					</td>
				</tr>
					
			</table>
		</div>
		<div id="sectionDiv5">
			<table id="c_table">
				<tr>
					<th colspan="2" rowspan="2" class="yellow">
						<label>회사명</label>
					</th>
					<th colspan="2" class="yellow">
						<label >기간(YYYY.MM - YYYY.MM)</label>
					</th>
					<th rowspan="2" class="yellow">
						<label>직위</label>
					</th>
					<th colspan="2" rowspan="2" class="yellow">
						<label>담당업무</label>
					</th>
					<td class="hideTd1"></td>
					<td class="hideTd"></td>
				</tr>
				<tr>
					<th class="yellow">
						<label>시작일</label>
					</th>
					<th class="yellow">
						<label>종료일</label>
					</th>
				</tr>
				<tr>
					<td colspan="2">
						<input type="text" name="c_name" placeholder="회사명을 입력하세요." maxlength="25">
					</td>
					<td>
						<input type="text" name="c_start" id="c_start" placeholder="입사일을 입력하세요."> 
					</td>
					<td>
						<input type="text" name="c_end" id="c_end" placeholder="퇴사일을 입력하세요."> 
					</td>
					<td>
						<input type="text" name="c_position" placeholder="직위를 입력하세요." maxlength="7"> 
					</td>
					<td colspan="2">
						<input type="text" name="c_dept" placeholder="담당업무를 입력하세요."maxlength="15">
					</td>
					<td class="hideTd1">
						<input type="button" id="c_add_btn" name="c_add_btn" value="+"/>
					</td>
					<td class="hideTd">
						
					</td>
				</tr>
				
			</table>
		</div>
		<div id="sectionDiv6">
			<table id="t_table">
				<tr>
					<th class="yellow">
						<label>교육명</label>
					</th>
					<th class="yellow">
						<label>시작일</label>
					</th>
					<th class="yellow">
						<label>종료일</label>
					</th>
					<th class="yellow">
						<label>기관</label>
					</th>
					<td class="hideTd1"></td>
					<td class="hideTd"></td>
				</tr>
				<tr>
					<td>
						<input type="text" name="t_name" placeholder="교육명을 입력하세요." maxlength="35">
					</td>
					<td>
						<input type="text" name="t_start" id="t_start" placeholder="교육시작일을 입력하세요.">
					</td>
					<td>
						<input type="text" name="t_end" id="t_end" placeholder="교육조료일을 입력하세요.">
					</td>
					<td>
						<input type="text" name="t_institution" placeholder="교육기관을 입력하세요." maxlength="25">
					</td>
					<td class="hideTd1">
						<input type="button" id="t_add_btn" name="t_add_btn" value="+"/>
					</td>
					<td class="hideTd">
						
					</td>
				</tr>
			</table>
		</div>
		<div id="sectionDiv7">
			<table id="s_table">
				<tr>
					<th colspan="2" class="yellow">
						<label>보유기술 및 외국어능력</label>
					</th>
					<th class="yellow">
						<label>숙련도(A,B,C)</label>
					</th>
					<td class="hideTd1"></td>
					<td class="hideTd"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="text" name="s_ability" placeholder="보유기술 및 외국어능력을 입력하세요." maxlength="15">
					</td>
					<td>
						<select name="s_level" id="s_level">
							<option value="">없음</option>
							<option value="A">A</option>
							<option value="B">B</option>
							<option value="C">C</option>
						</select>
					</td>
					<td class="hideTd1">
						<input type="button" id="s_add_btn" name="s_add_btn" value="+"/>
					</td>
					<td class="hideTd">
						
					</td>
				</tr>

			</table>
		</div>
		</form>
	</section>
	<footer>
		<div id="footerDiv">
			<input type="button" name="input_btn" id="input_btn" value="저장" class="btn btn-success"/>
			<input type="button" name="cencle_btn" id="cencle_btn" value="취소" class="btn btn-danger"/>
		</div>
	</footer>
</div>	
</div>

<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
<script src="/resources/js/bootstrap.min.js"></script>
</body>
</html>