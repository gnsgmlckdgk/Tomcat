package net.myplanBasket.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.myplanBasket.db.MyPlanBasketDAO;

public class MyPlanBasketDeleteAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("BasketDeleteAction");
		//세션값 가져오기
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		//세션값 없으면 ./MemberLogin.me 이동
		ActionForward forward=new ActionForward();
		if(id==null){
			forward.setRedirect(true);
			forward.setPath("./MemberLogin.me");
			return forward;
		}
		//  가져오기
		int myplans_id = -1;
		int travel_id = -1;
		if(request.getParameter("myplans_id")!=null) {
			myplans_id =Integer.parseInt(request.getParameter("myplans_id"));
		}else {
			travel_id = Integer.parseInt(request.getParameter("travel_id"));
		}
		
		// 디비객체 생성 basketdao
		System.out.println("basket삭제 확인");
		MyPlanBasketDAO basketdao=new MyPlanBasketDAO();
		//메서드호출 basketDelete(b_num)
		if(myplans_id!=-1) {
			basketdao.basketDelete(myplans_id);
		}else {
			basketdao.zzimBasketDelete(id, travel_id);
		}
		
		//이동 ./BasketList.ba
		forward.setRedirect(true);
		forward.setPath("./MyPlan.pln?plan_nr=100");
		return forward;
	}
}
