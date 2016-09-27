<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- JSTL core 변수지원, 흐름제어, URL처리 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- JSTL functions은 JSTL에서 제공하는 각종 함수를 사용해서 문자열이나, 컬렉션들을 처리 --><!-- fn태그는 단독으로 사용할 수 없고 EL 표현식 내에서 사용 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 커스텀테그 - 스크립트 코드와 EL을 혼합해서 사용하는 대신 또 다른태그를 만들어서 사용할 수 있도록 지원한다. -->
<%@ taglib prefix="tag" uri="myTag" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>사원 리스트</title>
<!-- 부트스트랩 -->
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
    <!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<!-- head테그에서 <style>로 css를 사용하지 않고   /resources/css/mainPage.css 에서 따로 css파일을 만들어서 링크를 걸어줌 -->
<link rel="stylesheet" type="text/css" href="/resources/css/firstTest.css"/>
<!-- jquery를 cdm방식으로 연결해준다. -->
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<script type="text/javascript" src="/resources/js/main_common.js"></script>
<script type="text/javascript">
	$(function(){
		
		// 검색 후 검색 대상과 검색 단어 출력
		if("<c:out value='${data.keyword}'/>"!=""){
			$("#keyword").val("<c:out value='${data.keyword}'/>");
			$("#search").val("<c:out value='${data.search}'/>");
		}
		
		// 한 페이지에 보여줄 레코드 수 조회 후 선택한 값 그대로 유지하기 위한 설정
		if("<c:out value='${data.pageSize}'/>" != ""){
			$("#pageSize").val("<c:out value='${data.pageSize}'/>");
		}
		
		// 검색 대상이 변경될 때마다 처리 이벤트
		$("#search").change(function(){
			if($("#search").val()=="all"){
				$("#keyword").val("전체 데이터 조회합니다.");
			} else if($("#search").val()!="all"){
				$("#keyword").val("");
				$("#keyword").focus();
			}
		});
		
		// 검색 버튼 클릭 시 처리 이벤트
		$("#searchData").click(function(){
			if($("#search").val()!="all"){
				if(!chkSubmit($('#keyword'),"검색어를")) return;
			}
			goPage(1);
		}); 
		
		// 한 페이지에 보여줄 레코드 수 변경될 때마다 처리 이벤트
		$("#pageSize").change(function(){
			goPage(1);
		});
		
		// 사원등록 버튼 클릭 시 처리 이벤트(id: writeForm)
		$("#writeForm").click(function(){
			location.href = "/firstTest/inputPage.do";
		});
		
		// 제목 클릭시 상세 페이지 이동을 위한 처리 이벤트 (class: goDetail)
		 $(".goDetail").click(function(){
			//글제목을 클릭하면 클릭한 글제목의 글번호를 받아와서 이 함수안에서 선언한 sqb_no에 집어넣는다.
			//var p_num = $(this).parents("tr").attr("data-num"); 
			var p_num = $(this).attr("data-num"); //tr을 누르면 그 tr에 있는 data-num 요소를 var p_num에 저장
			/* .val() 함수는 양식(form) 요소들의 값을 위해 많이 사용되는 함수. 
			만일 <select multiple="multiple">라는 태그에 val() 함수를 사용하면 선택된 옵션(option)들의 value를 배열(array)로 반환해 줌. */
			//id가  p_num인 곳에  위의 p_num값을 준다.
			$("#p_num").val(p_num);
			// 상세 페이지로 이동하기 위해 form 추가 (id: detailForm)
			$("#detailForm").attr({
				"method":"get",
				"action":"/firstTest/detailPage.do"
			});
			$("#detailForm").submit();
		}); 
		
			
	});
	
	// 정렬 버튼 클릭 시 처리 함수
	function setOrder(order_by){
		$("#order_by").val(order_by);
		if($("#order_sc").val()=='DESC'){
			$("#order_sc").val('ASC');
		} else {
			$("#order_sc").val('DESC');
		}
		goPage(1);
	} 
	
	// 검색과 한 페이지에 보여줄 레코드 수 처리 및 페이징을 위한 실질적인 처리 함수
	function goPage(page){
		
		$("#page").val(page);
		$("#f_search").attr({
			"method":"get",
			"action":"/firstTest/main_List.do"
		});
		$("#f_search").submit();
	}
</script> 
</head>
<body>
	<div id="mainPage_Container">
	<div id="mainPage_Container2">
		<div id="mainPage_Tit"><h3>사원 리스트</h3></div>
		<!-- 상세 페이지 이동을 위한 form -->
		<form name="detailForm" id="detailForm">
			<input type="hidden" name="p_num" id="p_num">
			<input type="hidden" name="page" value="${data.page}">
			<input type="hidden" name="pageSize" value="${data.pageSize}">
		</form>
		
		<%-- ================================ 리스트 시작 ================================ --%>
		<div id="mainPage_List">
		<table summary="사원 리스트">
			<colgroup>
				<col width="7%"/>
				<col width="10%"/>
				<col width="35%"/>
				<col width="15%"/>
				<col width="15%"/>
				<col width="18%"/>
			</colgroup>
			<thead>
				<tr>
					<th>
						<a href="javascript:setOrder('p_num');">번호
							<c:choose>
								<c:when test="${data.order_by=='p_num' and data.order_sc=='ASC'}">▲</c:when>
								<c:when test="${data.order_by=='p_num' and data.order_sc=='DESC'}">▼</c:when>
								<c:otherwise>▲</c:otherwise>
							</c:choose>
						</a>
					</th>
					<th>사원번호</th>
					<th>사원 이름</th>
					<th>부서</th>
					<th>직급</th>
					<th>
						<a href="javascript:setOrder('p_join');">입사일
							<c:choose>
								<c:when test="${data.order_by=='p_join' and data.order_sc=='ASC'}">▲</c:when>
								<c:when test="${data.order_by=='p_join' and data.order_sc=='DESC'}">▼</c:when>
								<c:otherwise>▲</c:otherwise>
							</c:choose>
						</a>
					</th>
					<!-- <th class="borcle">작성자</th> -->
				</tr>
			</thead>
			<tbody>
			<!-- 데이터 출력 -->
			<c:choose>
				<c:when test="${not empty main_List}">
					<c:forEach var="personal" items="${main_List}" varStatus="status">
				<tr align="center" data-num="${personal.p_num}" class="goDetail">
					<td class="listTd">${count - (status.count-1)}</td>
					<td class="listTd">${personal.p_num}</td>
					<td class="listTd">
						<span class="goDetail" style="cursor:pointer">${personal.p_name}</span>
					</td>
					<td class="listTd">${personal.p_dept}</td>
					<td class="listTd">${personal.p_position}</td>
					<td class="listTd">${personal.p_join}</td>
				</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
				<tr class="listTd">
					<td colspan="4" align="center">등록된 사원이 존재하지 않습니다.</td>
				</tr>
				</c:otherwise>
			</c:choose>
			</tbody>
		</table>
		</div>
		<%-- ================================ 리스트 종료 ================================ --%>
		<%-- ================================ 검색기능 시작(이 부분 전체 추가) ================================ --%>
		<div id="mainPage_Search">
			<form id="f_search" name="f_search">
				<input type="hidden" id="page" name="page" value="${data.page}">
				<input type="hidden" id="order_by" name="order_by" value="${data.order_by}">
				<input type="hidden" id="order_sc" name="order_sc" value="${data.order_sc}">
				<table summary="검색">
					<colgroup>
						<col width="70%"></col>
						<col width="30%"></col>
					</colgroup>
					<tr>
						<td id="btd1">
							<label>검색조건</label>
							<select id="search" name="search">
								<option value="all">전체</option>
								<option value="p_name">사원명</option>
								<option value="p_join">입사일</option>
							</select>
							<input type=text name=keyword id=keyword placeholder="검색 키워드 입력">
							<input type=button value="검색" id="searchData"  class="btn btn-info">
						</td>
						<td id="btd2">한페이지에
							<select id="pageSize" name="pageSize">
								<option value="10">10줄</option>
								<option value="20">20줄</option>
								<option value="30">30줄</option>
								<option value="50">50줄</option>
							</select>
						</td>
					</tr>
				</table>
			</form>
		</div>
		<%-- ================================ 검색기능 종료 ================================ --%>
		<%-- ================================ 글쓰기 버튼 출력 시작 ================================ --%>
		<div id="mainPage_inputBut" style="width: 100%">
			<input type="button" value="사원등록" id="writeForm"  class="btn btn-success"/>
		</div>
		<%-- ================================ 글쓰기 버튼 출력 종료 ================================ --%>
		<%-- ================================ 페이지 네비게이션 시작 ================================ --%>
		<div id="mainPage_Page">
			<tag:paging page="${param.page}" total="${total}" list_size="${data.pageSize}"/>
		</div>
		<%-- ================================ 페이지 네비게이션 종료 ================================ --%>
	</div>
	</div>
<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
<script src="/resources/js/bootstrap.min.js"></script>
</body>
</html>