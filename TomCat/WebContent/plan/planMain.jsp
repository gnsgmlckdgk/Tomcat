<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 헤더 -->
<jsp:include page="../inc/header.jsp" />

<!-- 대륙지도js -->
  <link rel="stylesheet" media="all" href="./assets/css/plan/jquery-jvectormap.css"/>

  <script src="./assets/js/plan/jquery-1.8.2.js"></script>
  <script src="./assets/js/plan/jquery-jvectormap.js"></script>
  <script src="./assets/js/plan/jquery-mousewheel.js"></script>

  <script src="./assets/js/plan/src/jvectormap.js"></script>

  <script src="./assets/js/plan/src/abstract-element.js"></script>
  <script src="./assets/js/plan/src/abstract-canvas-element.js"></script>
  <script src="./assets/js/plan/src/abstract-shape-element.js"></script>

  <script src="./assets/js/plan/src/svg-element.js"></script>
  <script src="./assets/js/plan/src/svg-group-element.js"></script>
  <script src="./assets/js/plan/src/svg-canvas-element.js"></script>
  <script src="./assets/js/plan/src/svg-shape-element.js"></script>
  <script src="./assets/js/plan/src/svg-path-element.js"></script>
  <script src="./assets/js/plan/src/svg-circle-element.js"></script>
  <script src="./assets/js/plan/src/svg-image-element.js"></script>
  <script src="./assets/js/plan/src/svg-text-element.js"></script>

  <script src="./assets/js/plan/src/vml-element.js"></script>
  <script src="./assets/js/plan/src/vml-group-element.js"></script>
  <script src="./assets/js/plan/src/vml-canvas-element.js"></script>
  <script src="./assets/js/plan/src/vml-shape-element.js"></script>
  <script src="./assets/js/plan/src/vml-path-element.js"></script>
  <script src="./assets/js/plan/src/vml-circle-element.js"></script>
  <script src="./assets/js/plan/src/vml-image-element.js"></script>

  <script src="./assets/js/plan/src/map-object.js"></script>
  <script src="./assets/js/plan/src/region.js"></script>
  <script src="./assets/js/plan/src/marker.js"></script>

  <script src="./assets/js/plan/src/vector-canvas.js"></script>
  <script src="./assets/js/plan/src/simple-scale.js"></script>
  <script src="./assets/js/plan/src/ordinal-scale.js"></script>
  <script src="./assets/js/plan/src/numeric-scale.js"></script>
  <script src="./assets/js/plan/src/color-scale.js"></script>
  <script src="./assets/js/plan/src/legend.js"></script>
  <script src="./assets/js/plan/src/data-series.js"></script>
  <script src="./assets/js/plan/src/proj.js"></script>
  <script src="./assets/js/plan/src/map.js"></script>

  <script src="./assets/js/plan/world/jquery-jvectormap-asia-mill.js"></script>
  <script src="./assets/js/plan/world/jquery-jvectormap-europe-mill.js"></script>
  <script src="./assets/js/plan/world/jquery-jvectormap-north_america-mill.js"></script>
  <script src="./assets/js/plan/world/jquery-jvectormap-oceania-mill.js"></script>
  <script src="./assets/js/plan/world/jquery-jvectormap-south_america-mill.js"></script>

 <script src="./assets/js/plan/planMain_Map.js"></script>
 
<!-- 메인 -->


<!-- 아시아 -->

  <div id="map1" style="width: 60em; height: 30em;"></div>

<!-- 유럽 -->

  <div id="map2" style="width: 60em; height: 30em;"></div>

<!-- 남태평양 -->

  <div id="map3" style="width: 60em; height: 30em;"></div>

<!-- 남미 -->

  <div id="map4" style="width: 60em; height: 30em;"></div>  

<!-- 북미 -->

  <div id="map5" style="width: 60em; height: 30em;"></div>  

<!-- 대륙별 국가리스트 출력 -->
<script>
	window.onload=CountryList();
</script>

<%
	/* 대륙 리스트 */
	String[] cont = { "아시아", "유럽", "남태평양", "중남미", "북미" };
%>

<div class="clear"></div>

<section class="planMain">
	<div>
		<!-- 검색폼 -->
		<div class="Search">
			<form name="fr" action="./PlanSearch.pl" class="plan_search" method="post" onsubmit="return checkSearch();">
				<h2>어디로 여행을 가시나요?</h2>
				<select name="check" class="check_search">
					<option value="0">선택해주십시오</option>
					<option value="1">국가명</option>
					<option value="2">도시명</option>
				</select> 
				<input type="text" name="search" value="" class="search_text">
				<input type="submit" value="검색" class="serch_button">
			</form>
		</div>
		
	<hr><div class="clear"></div>
	
		<!-- 인기여행지 리스트(대륙별 도시추천) -->
		<div class="bestTrip">
			<h2>인기여행지</h2>
			<div class="bestTripMenu">
				<ul class="bestTrip_cont">
					<li><a href="#">추천</a></li>
					<li><a href="#">아시아</a></li>
					<li><a href="#">유럽</a></li>
					<li><a href="#">남태평양</a></li>
					<li><a href="#">중남미</a></li>
					<li><a href="#">북미</a></li>
				</ul>
			</div>
		
	<div class="clear"></div>
	
		<!-- 인기여행지 이미지리스트(대륙별 도시추천) -->
			<div class="bestTripimg">
			<table border="1">
					<tr>
						<td><img alt="" src="./images/pic01.jpg" width="350em" height="300em"></td>
						<td><img alt="" src="./images/pic02.jpg" width="350em" height="300em"></td>
						<td><img alt="" src="./images/pic03.jpg" width="350em" height="300em"></td>
						<td><img alt="" src="./images/pic04.jpg" width="350em" height="300em"></td>
					</tr>
					<tr>
						<td><img alt="" src="./images/pic04.jpg" width="350em" height="300em"></td>
						<td><img alt="" src="./images/pic03.jpg" width="350em" height="300em"></td>
						<td><img alt="" src="./images/pic05.jpg" width="350em" height="300em"></td>
						<td><img alt="" src="./images/pic06.jpg" width="350em" height="300em"></td>
					</tr>
				</table>
			</div>
		</div>
	
	<div class="clear"></div>
	
		<!-- 국가 리스트  -->
		<div class="countryList" >
			<h2>국가 리스트</h2>
			<%
				String[] asia={"asia","europe","oceania","south","north"};
				for (int j = 0; j < 5; j++) {
			%>
			<h3><%=cont[j]+"  "%><a onclick="popupToggle_<%=asia[j]%>()">>>지도로보기</a></h3>
			<div class="<%=cont[j]%>"></div>
			<div class="clear"></div>
			<%
				}
			%>
		</div>
		<div id="countryMap_back" onclick="popupToggle_map()"></div>
	</div>
</section>

<!-- footer -->
<jsp:include page="../inc/footer.jsp" />