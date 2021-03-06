<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- 회원탈퇴 페이지 -->
<!-- Header -->
<jsp:include page="../inc/header.jsp" />

<!-- Main -->
<section class="memberManager">
	<div class="memberContainer">
	<%
		String id = (String)session.getAttribute("id");
		if(id==null) {
			response.sendRedirect("./Main.me");
			return;
		}
	%>
		<!-- 서브메뉴 -->
		<jsp:include page="subMenu/memberManager.jsp"/>
		
		<!-- 컨텐츠 -->
		<div class="memberContent">
			<div class="content_member_memberDelete">
			<header>
				<h1>회원탈퇴</h1><hr>
			</header>
	
				<div class="passDelete_form">
					<form action="./MemberDeleteAction.me" method="post" onsubmit="return passCheck()">
						
						<p class="delete_txt">
						사용하고 계신 <span style="color: #1fbc02;"><%=id %></span> 계정을 탈퇴할 경우 복구가
						불가능합니다.<br> 
						탈퇴후 회원 정보 및 서비스 이용기록은 모두 삭제되오니 신중하게 선택하여 주시기 바랍니다.<br>
						회원탈퇴를 위해 비밀번호를 입력해 주세요.
						</p>
						
						<label for="pass">비밀번호 입력</label><input type="password" name="pass" id="pass" maxlength="16" placeholder="6~16자 영문 대 소문자로 시작하고, 숫자, 특수문자를 사용">
				
					<!-- RSA암호화 공개키 -->
					<input type="hidden" id="delete_publicKeyModulus" value="<%=request.getAttribute("publicKeyModulus") %>">
					<input type="hidden" id="delete_publicKeyExponent" value="<%=request.getAttribute("publicKeyExponent") %>">
				
					<input type="submit" value="회원탈퇴">
				
				</form>
				
				<script type="text/javascript">
					function passCheck() {
						var pass = $('#pass').val();
						
						if(pass.length==0) {
							alert("비밀번호를 입력해주세요.");
							return false;
						}else {
							// RSA암호화
							 try {
   							// 공개키 가져오기
       						var delete_publicKeyModulus = document.getElementById("delete_publicKeyModulus").value;
      						var delete_publicKeyExponent = document.getElementById("delete_publicKeyExponent").value;
       
       						var rsa = new RSAKey();
      						rsa.setPublic(delete_publicKeyModulus, delete_publicKeyExponent);
       
       						// RSA로 암호화한다.(이름은 암호화 제외)
       						var securedPass = rsa.encrypt(pass);
       						
       						// 기존 폼에 암호화 된 값을 재입력
       						$('#pass').val(securedPass);
       						
       						var con = confirm("정말 탈퇴하시겠습니까?");
       						if(con == true) {
       							return true;
       						}else {
       							location.href="./MemberDelete.me";
       							return false;
       						}
       						
							 }catch(err) {
							 	alert(err);
						  	 }
						}
					}
				
				</script>
				
				</div>	<!-- pass_form -->
			</div> <!-- content_member_memberDelete -->
		</div>	<!-- memberContent -->
	
	</div>	<!-- memberContainer -->
</section>

<div class="clear"></div>

<!-- Footer -->
<jsp:include page="../inc/footer.jsp" />