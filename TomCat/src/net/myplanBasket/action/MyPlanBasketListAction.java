package net.myplanBasket.action;

import java.util.List;
import java.util.StringTokenizer;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.myplanBasket.db.MyPlanBasketBean;
import net.myplanBasket.db.MyPlanBasketDAO;

public class MyPlanBasketListAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MyPlanBasketListAction");
		
		//세션 가져오기
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		//세션값 없으면  ./MemberLogin.me
		ActionForward forward=new ActionForward();
		
		
		
		if(id==null){
			forward.setRedirect(true);
			forward.setPath("./MemberLoginAction.me");
			return forward;
		}
		//BasketDAO 객체 생성 basketdao
		MyPlanBasketDAO basketdao=new MyPlanBasketDAO();
		
		//Vector vector= 메서드호출  getBasketList(String id)
		//  => Vector vector=new Vector();
		
		Vector vector=basketdao.getBasketList(id);
		String gold = basketdao.getMemberGold(id);
		
		//List basketList = vector 첫번째데이터
		List basketList=(List)vector.get(0);
		
		//List goodsList = vector 두번째데이터
		List goodsList=(List)vector.get(1);
		
		// 저장 basketList goodsList
		request.setAttribute("basketList", basketList);
		request.setAttribute("goodsList", goodsList);
		request.setAttribute("gold", gold);
		
		
/*		if(plan_nr==1){
		
			MyPlanBasketDAO mpbd=new MyPlanBasketDAO();
			Vector vector1= mpbd.getBasketList_Plan_nr(mpbb);
		
			List basketList1=(List)vector1.get(0);
			List goodsList1=(List)vector1.get(1);
			
		
			request.setAttribute("basketList", basketList1);
			request.setAttribute("goodsList", goodsList1);
	
			// System.out.println("이거이거"+basketList1);
	
			for (int i = 0; i < basketList1.size(); i++) {
				MyPlanBasketBean mpbb1 = (MyPlanBasketBean) basketList1.get(i);
				System.out.println(mpbb1.getDay_nr());
				System.out.println(mpbb1.getItem_nr());
				System.out.println(mpbb1.getPlan_nr());
	
				StringTokenizer st = new StringTokenizer(mpbb1.getDay_nr(), "@");
				int n = st.countTokens(); // 남아있는 토큰의 개수를 반환
				for (int j = 0; j < n; j++) {
					System.out.println(st.nextToken());
				}
				StringTokenizer st1 = new StringTokenizer(mpbb1.getItem_nr(), "@");
				int n1 = st1.countTokens(); // 남아있는 토큰의 개수를 반환
				for (int j1 = 0; j1 < n1; j1++) {
					System.out.println(st1.nextToken());
				}
	
				StringTokenizer st2 = new StringTokenizer(mpbb1.getPlan_nr(), "@");
				int n2 = st2.countTokens(); // 남아있는 토큰의 개수를 반환
				for (int j2 = 0; j2 < n2; j2++) {
					System.out.println(st2.nextToken());
				}

		}
		
	}//plan_nr==1 끝
		*/
		
		System.out.println("myplanbasketlistaction 진입");
		forward.setRedirect(false);
		forward.setPath("./myplan/myplan.jsp");
		return forward;
	
	}
}

