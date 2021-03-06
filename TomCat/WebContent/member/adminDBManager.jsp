<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- 스타일 추가 -->
<!-- 이클립스에서 서버가 인식을 잘안하는게 불편해서 여기서 다 만들고 따로 외부파일로 만들 예정 -->
<style type="text/css">
	
	div.DBManager a {
		text-decoration: none;
	}
	
	.memberContent a {
		font-size: 16px;
	}

</style>

</head>
<body>
<%
	String id = (String)session.getAttribute("id");
	if(id==null) {
		response.sendRedirect("./Main.me");
		return;
	}
%>
<!-- Header -->
<jsp:include page="../inc/header.jsp" />
	
<!-- Main -->
<section class="memberManager">
	<div class="memberContainer">
		<!-- 서브메뉴 -->
		<jsp:include page="subMenu/memberManager.jsp"/>
		
		<!-- 컨텐츠 -->
		<div class="memberContent">
			
		<header>
			<h1>여행지 DB관리</h1><hr>
			도시, 관광지 수정 시<br>
			<span style="color: orange;">국가나 도시 변경시 이미지 이동에 오류</span>가 있어 <span style="color: red;">국가, 도시 변경은 임시로 막아놓음</span><br> 
			추후 수정 예정
		</header>
						
			<a href = "javascript:countryInput()">국가 DB 관리</a><br>
			<a href = "javascript:cityInput()">도시(지역) DB 관리</a><br>
			<a href = "javascript:travelInput()">여행지 DB 입력</a><br>
					
		</div>	<!-- memberContent -->	
	</div>	<!-- memberContainer -->
	
		<!-- 스크립트 추가 -->
		<script type="text/javascript">
			//  이까지 수정함
			function countryInput() {
				var left = (screen.width - 1200)/2;
				var availHeight = screen.availHeight-67;
				window.open("./CountryList.pl", "window", "width=1200, height="+availHeight+", top=0, left="+left);
			}
			
			function cityInput() {
				var left = (screen.width - 1200)/2;
				var availHeight = screen.availHeight-67;
				window.open("./CityList.pl", "window", "width=1200, height="+availHeight+", top=0, left="+left);
			}
			
			function travelInput() {
				var left = (screen.width - 1200)/2;
				var availHeight = screen.availHeight-67;
				window.open("./TravelAdminList.td", "window", "width=1200, height="+availHeight+", top=0, left="+left);
			}
	
		</script>
	
</section>

<!-- Footer -->
<div class="clear"></div>
<jsp:include page="../inc/footer.jsp" />
</body>
</html>