package net.travel.admin.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class TravelFrontController extends HttpServlet {

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uriPath = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = uriPath.substring(contextPath.length());
		
		// 이동정보 담는 객체
		ActionForward forward = null;
		// 처리담당 객체
		Action action = null;
		
		if(command.equals("/TravelAdminList.td")){ 
			// GoodsAddAction
			action=new TravelListAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/TravelAdminWriteAction.td")){
			action=new TravelAdminWriteAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		}else if(command.equals("/TravelAdminAction.td")){ 
			// GoodsAddAction
			action=new TravelAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/TravelAdminUpdate.td")) {	// 관광지 DB 수정 페이지
			
			action = new TravelAdminUpdate();
			try {
				forward = action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/TravelAdminUpdateAction.td")) {	// 관광지 DB 수정 작업 처리
			
			action = new TravelAdminUpdateAction();
			try {
				forward = action.execute(request, response);
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/TravelAdminDelete.td"))	{	// 관광지 DB에서 삭제
			
			action = new TravelAdminDeleteAction();
			try {
				forward = action.execute(request, response);
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}
		
		
		if(forward!=null) {
			if(forward.isRedirect()) {	// response방식
				response.sendRedirect(forward.getPath());
			}else {	// forward방식
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
		
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
}
