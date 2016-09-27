<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- JSTL core 변수지원, 흐름제어, URL처리 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- JSTL functions은 JSTL에서 제공하는 각종 함수를 사용해서 문자열이나, 컬렉션들을 처리 --><!-- fn태그는 단독으로 사용할 수 없고 EL 표현식 내에서 사용 -->
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
	<link rel="stylesheet" type="text/css" href="/resources/css/detailPage.css"/>
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
		$(function(){
			
			/* 사원리스트 페이지로 이동 */
			$("#list_btn").click(function(){
				location.href = "/firstTest/main_List.do";
			});
			
			// 수정버튼 클릭 시 처리 이벤트
			$("#updatePage_btn").click(function(){
				var goUrl = "";	
				goUrl = "/firstTest/updatePage.do";
				$("#f_data").attr("action", goUrl);
				$("#f_data").submit();
			});
			
			// 삭제버튼 클릭 시 처리 이벤트
			$("#delete_btn").click(function(){
				/* 확인창을 띄워서 확인을 누르면 삭제, 취소를 누르면 취소 */
				if (confirm("정말 삭제하시겠습니까?") == true){    //확인
					var goUrl = "";	
					goUrl = "/firstTest/delete.do";
					$("#f_data").attr("action", goUrl);
					$("#f_data").submit();
				}else{   //취소
				    return;
				}
			});
			
		});
	</script>
</head>
<body>
<form name="f_data" id="f_data" method="GET">
	<input type="hidden" name="p_num" value="${p_Detail.p_num}">
</form>
<div id="containerDiv">
<div id="containerDiv2">
	<header>
		<div id="headerDiv">
			<h2>개 인 이 력 카 드</h2>
		</div>
	</header>
	<section>
		<div id="sectionDiv1">
			<table id="p_table">
				<tr>
					<th>
						<label>성명</label>
					</th>
					<td>
						<label>${p_Detail.p_name}</label>
					</td>
					<th>
						<label>주민등록번호</label>
					</th>
					<td colspan="3">
						<label>${p_Detail.p_number}</label>
					</td>
					<th>
						<label>성별</label>
					</th>
					<td>
						<label>${p_Detail.p_sex}</label>
					</td>
				</tr>
				<tr>
					<th>
						<label>소속회사</label>
					</th>
					<td  colspan="3">
						<label>${p_Detail.p_company}</label>
					</td>
					<th>
						<label>입사일</label>
					</th>
					<td colspan="3">
						<label>${p_Detail.p_join}</label>
					</td>
				</tr>
				<tr>
					<th>
						<label>부서</label>
					</th>
					<td>
						<label>${p_Detail.p_dept}</label>
					</td>
					<th>
						<label>직위</label>
					</th>
					<td>
						<label>${p_Detail.p_position}</label>
					</td>
					<th>
						<label>병역</label>
					</th>
					<td>
						<label>${p_Detail.pm_complete}</label>
					</td>
					<th>
						<label>결혼</label>
					</th>
					<td>
						<label>${p_Detail.p_marriage}</label>
					</td>
				</tr>
				<tr>
					<th colspan="2" class="yellow">
						<label>병역 입대일 ~ 제대일</label>
					</th>
					<td colspan="2">
						<label>${p_Detail.pm_start} &nbsp; ~ &nbsp; ${p_Detail.pm_end}</label>
					</td>
					<th colspan="2">
						<label>역종,병과</label>
					</th>
					<td colspan="2">
						<label>${p_Detail.pm_branch}</label>
					</td>
				</tr>
			</table>
		</div>
		<div id="sectionDiv2">
			<table id="p2_table">
				<tr>
					<th class="yellow">
						<label>전화</label>
					</th>
					<td colspan="2">
						<label>(유선) ${p_Detail.p_phone}</label>
					</td>
					<td colspan="2">
						<label>(무선) ${p_Detail.p_cell}</label>
					</td>
				</tr>
				<tr>
					<th class="yellow">
						<label>E-Mail</label>
					</th>
					<td colspan="4">
						<label>${p_Detail.p_email}</label>
					</td>
				</tr>
				<tr>
					<th class="yellow">
						<label>주소</label>
					</th>
					<td colspan="4">
						<label>${p_Detail.p_addr}</label>
					</td>
				</tr>
			</table>
		</div>
		<div id="sectionDiv3">
			<table id="edu_table">
				<c:choose>
					<c:when test="${not empty edu_List}">
						<c:forEach var="edu_background" items="${edu_List}" varStatus="status">
							<tr align="center" >
								<td>
									<span> ${edu_background.edu_name} </span>
									&nbsp;&nbsp;<span>  ${edu_background.edu_inout} </span>
									&nbsp;&nbsp;<span> ${edu_background.edu_date} </span>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td align="center">등록된 학교가 존재하지 않습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
		</div>
		<div id="sectionDiv4">
			<table id="l_table">
				<tr>
					<th class="yellow">
						<label>자격증명</label>
					</th>
					<th class="yellow">
						<label>취득일</label>
					</th>
				</tr>
				<c:choose>
					<c:when test="${not empty l_List}">
						<c:forEach var="license" items="${l_List}" varStatus="status">
							<tr align="center" >
								<td>
									<span>${license.l_name}</span>
								</td>
								<td>
									<span>${license.l_date}</span>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="2" align="center">등록된 자격증이 존재하지 않습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
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
				</tr>
				<tr>
					<th class="yellow">
						<label>시작일</label>
					</th>
					<th class="yellow">
						<label>종료일</label>
					</th>
				</tr>
				<c:choose>
					<c:when test="${not empty c_List}">
						<c:forEach var="career" items="${c_List}" varStatus="status">
							<tr align="center" >
								<td colspan="2">
									<span>${career.c_name}</span>
								</td>
								<td>
									<span>${career.c_start}</span>
								</td>
								<td>
									<span>${career.c_end}</span>
								</td>
								<td>
									<span>${career.c_position}</span>
								</td>
								<td colspan="2">
									<span>${career.c_dept}</span>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
					<tr>
						<td colspan="7" align="center">등록된 경력이 존재하지 않습니다.</td>
					</tr>
					</c:otherwise>
				</c:choose>
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
				</tr>
				<c:choose>
					<c:when test="${not empty t_List}">
						<c:forEach var="training" items="${t_List}" varStatus="status">
							<tr align="center" >
								<td>
									<span>${training.t_name}</span>
								</td>
								<td>
									<span>${training.t_start}</span>
								</td>
								<td>
									<span>${training.t_end}</span>
								</td>
								<td>
									<span>${training.t_institution}</span>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="4" align="center">등록된 교육이력이 존재하지 않습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
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
				</tr>
				<c:choose>
					<c:when test="${not empty s_List}">
						<c:forEach var="skill" items="${s_List}" varStatus="status">
							<tr align="center" >
								<td colspan="2">
									<label>${skill.s_ability}</label>
								</td>
								<td>
									<label>${skill.s_level}</label>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="3" align="center">등록된 기술이 존재하지 않습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
		</div>
	</section>
	<footer>
		<div id="footerDiv">
			<input type="button" value="사원리스트" id="list_btn" name="list_btn"  class="btn btn-primary"> <br/><br/>
			<input type="button" value="수정" id="updatePage_btn" name="updatePage_btn" class="btn btn-success"/>
			<input type="button" value="삭제" id="delete_btn" name="delete_btn" class="btn btn-danger"/>
		</div>
	</footer>
</div>
</div>
<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
<script src="/resources/js/bootstrap.min.js"></script>
</body>
</html>