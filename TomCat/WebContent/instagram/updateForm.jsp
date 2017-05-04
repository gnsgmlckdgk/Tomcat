
<%@page import="net.board.db.boardBean"%>
<%@page import="net.board.db.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- Header -->
<jsp:include page="../inc/header.jsp" />

<!-- 추가한 스크립트 -->
<script type="text/javascript" src="./assets/js/member/join.js"></script>	<!-- 회원가입 제약조건 및 암호화 -->

<%
//int num,String pageNum 파라미터 가져오기
String pageNum = request.getParameter("pageNum");
int num=Integer.parseInt(request.getParameter("num"));
//BoardDAO bdao 객체 생성
BoardDAO bdao=new BoardDAO();
//BoardBean bb=메서드호출 getBoard(num)
boardBean bb=bdao.getBoard(num);
%>

	<h1>WebContent/board/updateForm.jsp</h1>
	<h1>게시판 글수정</h1>
		<form action="./BoardUpdateAction.bo?pageNum=<%=pageNum%>" method="post" name="fr" enctype="multipart/form-data">
<!-- 		hidden으로 숨겨서 num값 넘겨주기 -->
		<input type="hidden" name="num" value="<%=num%>">
		글쓴이:<input type="text" name="name" value="<%=bb.getNick()%>"><br> 
		제목:<input type="text" name="subject" value="<%=bb.getSubject()%>"><br>
<!-- 		textarea는 value값이 없움 -->
		내용:<textarea rows="10" cols="20" name="content"><%=bb.getContent()%></textarea><br>
		파일첨부:<input type="file" name="image1"><%=bb.getImage1()%><br><br>
				<input type="submit" value="글수정"><br> 
		
	</form>


</body>
<jsp:include page="../inc/footer.jsp" />