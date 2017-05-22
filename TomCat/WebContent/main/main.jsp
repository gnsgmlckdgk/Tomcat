<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String id = "";
	if (session.getAttribute("id") != null) {
		id = (String) session.getAttribute("id");
	}

	String nick = "";
	if (session.getAttribute("nick") != null) {
		nick = (String) session.getAttribute("nick");
	}
%>
<!-- Header -->
<jsp:include page="../inc/header.jsp" />

<!-- Banner -->
<section id="banner">
	<h2>TomCat</h2>
	<p>
		임시 메인화면 입니다. <br /> 현재 session의 id는
		<%=id%>, nick은
		<%=nick%>입니다.
	</p>
	<ul class="actions">
		<li><a href="./BoardList1.bb" class="button special big">함께해요</a></li>
		<li><a href="./PlanMain.pl" class="button special big">여행 일정
				플래너</a></li>
		<li><a href="./BoardList.bo" class="button special big">인생샷그램</a></li>
		<li><a href="#" class="button special big">Q & A</a></li>
	</ul>

	<br> 아래는 연습용 버튼입니다.
	<ul class="actions">
		<!-- 테스트용 버튼들. -->
		<li><a href="./MemberJoin.me" class="button special big">회원가입</a></li>


		<%
			if (!id.equals("")) {
		%>
		<li><a href="./MyPlan.pln?plan_nr=100" class="button special big">나의일정관리</a></li>
		<%
			} else if (id.equals("")) {
		%>
		<li><a onclick="popupToggle()" class="button special big">나의일정관리</a></li>

		<%
			}
		%>

		<li><form action="./PlanRegion.pl" method="get">
				<input type="text" name="region" style="background-color: white"
					placeholder="암거나 검색"> <input type="submit" value="검색"
					class="button special">
			</form></li>

		<li><a href="./CountryList.pl" class="button special big">국가
				DB</a></li>
		<li><a href="./CityList.pl" class="button special big">도시 DB</a></li>
		<li><a href="./PlanSpot.pl?travel=자갈치" class="button special big">추천장소
				상세보기</a></li>
		<li><a href="./chat_test/broadcast.jsp"
			class="button special big">채팅 테스트</a></li>
	</ul>
	<!-- 테스트용 버튼들 끝. -->
</section>

<!-- One -->
<!-- <section id="one" class="wrapper style1"> -->
<!-- 	<div class="container 75%"> -->
<!-- 		<div class="row 200%"> -->
<!-- 			<div class="6u 12u$(medium)"> -->
<!-- 				<header class="major"> -->
<!-- 					<h2>Maecenas luctus lectus</h2> -->
<!-- 					<p>Perspiciatis doloremque recusandae dolor</p> -->
<!-- 				</header> -->
<!-- 			</div> -->
<!-- 			<div class="6u$ 12u$(medium)"> -->
<!-- 				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Non -->
<!-- 					ea mollitia corporis id, distinctio sunt veritatis officiis dolore -->
<!-- 					reprehenderit deleniti voluptatibus harum magna, doloremque alias -->
<!-- 					quisquam minus, eaque. Feugiat quod, nesciunt! Iste quos ipsam, -->
<!-- 					iusto sit esse.</p> -->

<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </section> -->

<!-- Carousel -->

<script src="assets/js/main/jquery.min.js"></script>
<script src="assets/js/main/jquery.dropotron.min.js"></script>
<script src="assets/js/main/jquery.scrolly.min.js"></script>
<script src="assets/js/main/jquery.onvisible.min.js"></script>
<script src="assets/js/main/skel.min.js"></script>
<script src="assets/js/main/util.js"></script>
<script src="assets/js/main/main.js"></script>

<section class="carousel">
	<div class="reel">

		<%
			int i = 1;
			while (i <= 11) {
				if (i != 6) {
					int ii = i % 6;
		%>

		<article>
			<a href="#" class="image featured"><img
				src="images/pic0<%=ii%>.jpg" alt="" /></a>
			<header>
				<h3>
					<a href="#"><%=ii %></a>
				</h3>
			</header>
			<p><%=ii %></p>
		</article>


		<%
			}
				i = i + 1;
			}
		%>
	</div>
</section>
<!-- Carousel end-->

<!-- Two -->
<!-- <section id="two" class="wrapper style2 special"> -->
<!-- 	<div class="container"> -->
<!-- 		<header class="major"> -->
<!-- 			<h2>Fusce ultrices fringilla</h2> -->
<!-- 			<p>Maecenas vitae tellus feugiat eleifend</p> -->
<!-- 		</header> -->
<!-- 		<div class="row 150%"> -->
<!-- 			<div class="6u 12u$(xsmall)"> -->
<!-- 				<div class="image fit captioned"> -->
<!-- 					<img src="./images/pic02.jpg" alt="" /> -->
<!-- 					<h3>Lorem ipsum dolor sit amet.</h3> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="6u$ 12u$(xsmall)"> -->
<!-- 				<div class="image fit captioned"> -->
<!-- 					<img src="./images/pic03.jpg" alt="" /> -->
<!-- 					<h3>Illum, maiores tempora cupid?</h3> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<ul class="actions"> -->
<!-- 			<li><a href="#" class="button special big">Nulla luctus</a></li> -->
<!-- 			<li><a href="#" class="button big">Sed vulputate</a></li> -->
<!-- 		</ul> -->
<!-- 	</div> -->
<!-- </section> -->

<!-- Three -->
<!-- <section id="three" class="wrapper style1"> -->
<!-- 	<div class="container"> -->
<!-- 		<header class="major special"> -->
<!-- 			<h2>Mauris vulputate dolor</h2> -->
<!-- 			<p>Feugiat sed lorem ipsum magna</p> -->
<!-- 		</header> -->
<!-- 		<div class="feature-grid"> -->
<!-- 			<div class="feature"> -->
<!-- 				<div class="image rounded"> -->
<!-- 					<img src="./images/pic04.jpg" alt="" /> -->
<!-- 				</div> -->
<!-- 				<div class="content"> -->
<!-- 					<header> -->
<!-- 						<h4>Lorem ipsum</h4> -->
<!-- 						<p>Lorem ipsum dolor sit</p> -->
<!-- 					</header> -->
<!-- 					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. -->
<!-- 						Labore esse tenetur accusantium porro omnis, unde mollitia totam -->
<!-- 						sit nesciunt consectetur.</p> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="feature"> -->
<!-- 				<div class="image rounded"> -->
<!-- 					<img src="./images/pic05.jpg" alt="" /> -->
<!-- 				</div> -->
<!-- 				<div class="content"> -->
<!-- 					<header> -->
<!-- 						<h4>Recusandae nemo</h4> -->
<!-- 						<p>Ratione maiores a, commodi</p> -->
<!-- 					</header> -->
<!-- 					<p>Animi mollitia optio culpa expedita. Dolorem alias minima -->
<!-- 						culpa repellat. Dolores, fuga maiores ut obcaecati blanditiis, at -->
<!-- 						aperiam doloremque.</p> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="feature"> -->
<!-- 				<div class="image rounded"> -->
<!-- 					<img src="./images/pic06.jpg" alt="" /> -->
<!-- 				</div> -->
<!-- 				<div class="content"> -->
<!-- 					<header> -->
<!-- 						<h4>Laudantium fugit</h4> -->
<!-- 						<p>Possimus ex reprehenderit eaque</p> -->
<!-- 					</header> -->
<!-- 					<p>Maiores iusto inventore fugit architecto est iste expedita -->
<!-- 						commodi sed, quasi feugiat nam neque mollitia vitae omnis, ea -->
<!-- 						natus facere.</p> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="feature"> -->
<!-- 				<div class="image rounded"> -->
<!-- 					<img src="./images/pic07.jpg" alt="" /> -->
<!-- 				</div> -->
<!-- 				<div class="content"> -->
<!-- 					<header> -->
<!-- 						<h4>Porro aliquam</h4> -->
<!-- 						<p>Quaerat, excepturi eveniet laboriosam</p> -->
<!-- 					</header> -->
<!-- 					<p>Vitae earum unde, autem labore voluptas ex, iste dolorum -->
<!-- 						inventore natus consequatur iure similique obcaecati aut corporis -->
<!-- 						hic in! Porro sed.</p> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </section> -->

<!-- Four -->
<section id="four" class="wrapper style3 special">
	<div class="container">
		<header class="major">
			<h2>Aenean elementum ligula</h2>
			<p>Feugiat sed lorem ipsum magna</p>
		</header>
		<ul class="actions">
			<li><a href="#" class="button special big">Get in touch</a></li>
		</ul>
	</div>
</section>


<!-- Footer -->
<jsp:include page="../inc/footer.jsp" />