<%@page import="org.jsoup.nodes.Document"%>
<%@page
	import="com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException"%>
<%@page import="net.myplanBasket.action.DateList"%>
<%@page import="java.util.Vector"%>
<%@page import="net.myplanBasket.db.MyPlanBasketDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="temp.MyPlanBean"%>
<%@page import="net.travel.admin.db.TravelBean"%>
<%@page import="net.myplanBasket.db.MyPlanBasketBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<!-- 스타일 불러오기 -->
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/map/modifyNewFile9.css" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

 <style type="text/css">
	form#reg, td.tr_head {
		font-family: "나눔고딕", "맑은 고딕", sans-serif;
		font-weight: bolder; 
	}
	

</style>

</head>
<body>


	<%
		String id = (String) session.getAttribute("id");

		//1이면 plan a, 2이면 plan b, 3이면 plan c
		int plan = Integer.parseInt(request.getParameter("plan"));
	
		
	
		MyPlanBasketDAO mpbdao = new MyPlanBasketDAO();
		MyPlanBasketBean mpbb = new MyPlanBasketBean();
		
		Vector vector = mpbdao.getBasketList(id);
		// 		// List basketList = vector 첫번째데이터
		List basketList = (List) vector.get(0);
		// 		// List goodsList = vector 두번째데이터
		List goodsList = (List) vector.get(1);
		
		
		String from = null;
		String to = null;
		
		//diff_day 일간
		int diff_day = Integer.parseInt(request.getParameter("diff_day"));
	
		if(diff_day == 9999){
			
			for (int i = 0; i < basketList.size(); i++) {
				
				MyPlanBasketBean mpbb2 = (MyPlanBasketBean) basketList.get(i);
				from = mpbb2.getFirstday();
				to = mpbb2.getLastday();
				
// 				out.println("출발일=" + from);
// 				out.println("도착일=" + to);
				
				long diffDays = 0;

				try {
					SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
					Date beginDate = formatter.parse(from);
					Date endDate = formatter.parse(to);

					// 시간차이를 시간,분,초를 곱한 값으로 나누면 하루 단위가 나옴
					long diff = endDate.getTime() - beginDate.getTime();
					diffDays = diff / (24 * 60 * 60 * 1000) + 1;

// 					out.println("날짜차이=" + diffDays);

				} catch (ParseException e) {
					e.printStackTrace();
				}

				//기 저장된 일정이 몇일짜리인지 불러온다.
				diff_day = (int) diffDays;
				
				//myplans 의 i행에 몇 열까지 있는지.
				for(int k=0; k < mpbb2.getPlan_nr().split("@").length; k++){
					
// 					out.println(k + " a " + mpbb2.getPlan_nr().split("@")[k] + "<br>");
					
					//myplans의 i행, k열의 plan_nr이 선택한 plan과 같은지.
					if(Integer.parseInt(mpbb2.getPlan_nr().split("@")[k]) == plan){
						
						//선택한 plan과 같으면, 출력하자.
// 						mpbb2.getPlan_nr().split("@")[k]
						
						%>
						<script type="text/javascript">
						
							
						$('input[name=res<%=mpbb2.getDay_nr().split("@")[k]%>]').attr('value',$('input[name=res<%=mpbb2.getDay_nr().split("@")[k]%>]').val()+'<%=mpbb2.getMyplans_id()%>'+'@');
							$('input[name=plan_nr<%=mpbb2.getDay_nr().split("@")[k]%>]').attr('value',$('input[name=plan_nr<%=mpbb2.getDay_nr().split("@")[k]%>]').val()+'<%=mpbb2.getPlan_nr().split("@")[k]%>'+'@');
							$('input[name=day_nr<%=mpbb2.getDay_nr().split("@")[k]%>]').attr('value',$('input[name=day_nr<%=mpbb2.getDay_nr().split("@")[k]%>]').val()+'<%=mpbb2.getDay_nr().split("@")[k]%>'+'@');
							
						</script>
						
						<%
						

						
					}
					
				}
				
				
				
			}
			
		} else {
			//db안에 firstday가 null 이면
			//from, to 날짜값 받아오기.
			from = request.getParameter("from");
			to = request.getParameter("to");
			
		}
		
	%>


	<form action="./MyPlanModifyAction.pln" method="post"
			style="background-color: white; color: black; border: 1px solid red;" name=reg id="reg">
		<div style="width: 900px; margin: 1em; border: 1px solid green;" >
			<table>
				<tr id="tr_head" style="background-color: #fff;"> 
					<%
						if (from != null & to != null) {
					%>
					<td class="setdate" onchange="from_to()">
					출발일 : <input type="date" name="fromDate" id="fromDate" required="required" value="<%=from%>" style="width: 150px; margin-right: 10px; ">
					도착일 : <input type="date" name="toDate" id="toDate" required="required" value="<%=to%>" style="width: 150px; margin-right: 10px;">
						<%
							} else {
						%>
					<td class="setdate" onchange="from_to()">
					출발일 : <input type="date" name="fromDate" id="fromDate" required="required" style="width: 150px; margin-right: 10px;">
					도착일 : <input type="date" name="toDate" id="toDate" required="required" style="width: 150px; margin-right: 10px;;">
					</td>
					<%
						}
					%>
					<td class="set_plan" id="set_plan" onchange="from_to()">
						<select
							name="plan_nr" id="plan_nr" required="required">
								<option value="1" <%if (plan == 1) {%> selected <%}%>>Plan
									A</option>
								<option value="2" <%if (plan == 2) {%> selected <%}%>>Plan
									B</option>
								<option value="3" <%if (plan == 3) {%> selected <%}%>>Plan
									C</option>
						</select>
					</td>
					<td class="td_last">
				
						<input type="image" name="submit" src="./images/myplans/일정수정.png" width="50px" height="50px" style="vertical-align:bottom; " value="" />&nbsp;&nbsp; 
						<!-- <input type="image" name="reset" src="./images/myplans/다시등록.png" width="50px" height="50px" style="vertical-align:bottom;" value=""  /> -->
				
					</td>
				</tr>
				<%-- <input type="hidden" value="<%=diff_day%>" name="diff_day"> --%>
			</table>
			<!-- 장소 넣고 빼고 들어갈 공간. -->


			<div style="position: absolute; left: 1px; width: 300px; height: 500px; background-color: white; padding:5px 20px 20px 50px;">
				<select name=a style="width: 100%; height: 35em; margin-right: 10px;" multiple>

					<%
						if (basketList != null) {
							for (int i = 0; i < basketList.size(); i++) {

								TravelBean tb = (TravelBean) goodsList.get(i);
								MyPlanBasketBean mpbb2 = (MyPlanBasketBean) basketList.get(i);
								/*  여행지(상품) DB Bean */
					%>
					<option value="<%=mpbb2.getMyplans_id()%>" style="margin-top:10px;"><%=tb.getName()%></option>
					<%
						}
						}
					%>

				</select>

			</div>


			<div border=0 cellpadding=0 cellspacing=0 class="x_wrap"
				style="position: relative; width: 500px; overflow: auto; left: 270px; height: 610px;">


				<%
					if (diff_day != 0) {
						for (int i = 1; i <= diff_day; i++) {
				%>

				<div class="inner_x_wrap" style="border: 1px solid blue; padding:10px 25px 0 25px ;">
					<div style="color: #333; font-size: 1.2em; text-shadow: 1px 1px 3px #abc"> ▶ <%=i%>
						일차 ◀
					</div>



					<div
						style="width: 12%; float: left; vertical-align: middle; margin: auto;">
						&nbsp;
						<input class=button type=button value=' > '
							onclick="gor('b<%=i%>','res<%=i%>', 'plan_nr<%=i%>', '<%=plan%>', 'day_nr<%=i%>', '<%=i%>')">&nbsp;
						<br> &nbsp;
						<input class=button type=button value=' < '
							onclick="gol('b<%=i%>','res<%=i%>', 'plan_nr<%=i%>', '<%=plan%>', 'day_nr<%=i%>', '<%=i%>')">&nbsp;
					</div>



					<div style="width: 70%; float: left; margin:35px 0 0 50px; ">
						<select name="b<%=i%>" size=5 style="width: 100%; height: 10em;">

						</select>
					</div>

					<input type='text' name='res<%=i%>' placeholder="myplans_id">
					<input type='text' name='plan_nr<%=i%>' placeholder="plan_nr">
					<input type='text' name='day_nr<%=i%>' placeholder="day_nr">

					<div style="width: 12%; float: left; margin: auto;">
						&nbsp;<input class=button type=button value=' ↑ '
							onclick="gou('b<%=i%>','res<%=i%>', 'plan_nr<%=i%>', '<%=plan%>', 'day_nr<%=i%>', '<%=i%>')">&nbsp;
						<br> &nbsp; <input class=button type=button value=' ↓ '
							onclick="god('b<%=i%>','res<%=i%>', 'plan_nr<%=i%>', '<%=plan%>', 'day_nr<%=i%>', '<%=i%>')">&nbsp;
					</div>
				</div>

				<hr>

				<div class="clear"></div>

				<%
					}
					}
				%>


			</div>

			<!-- 장소 넣고 빼고 들어갈 공간. 끝.-->
		</div>
	</form>

</body>

</html>

