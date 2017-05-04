package net.reply.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ReplyDAO {

	Connection con = null;
	PreparedStatement pstmt = null;
	String sql = null;
	ResultSet rs = null;


	private Connection getConnection() throws Exception {
		Connection con = null;
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mysqlDB");
		con = ds.getConnection();
		return con;
	}// getConnection

	public void insertRepley(ReplyBean rb) {		
		int re_num=0;

		try {
			con = getConnection();

			sql = "select max(re_num) from gram_reply ";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();						
			
			 if(rs.next()){re_num=rs.getInt(1)+1;}
			 System.out.println(re_num);			 


			sql = "insert into gram_reply(num,content,re_ref,re_lev,re_seq,nick,date,re_num) " + "values(?,?,?,?,?,?,now(),?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rb.getNum()); // 일반글의 글번호
			pstmt.setString(2, rb.getContent());
			pstmt.setInt(3, re_num);//re_ref 답변글 그룹==일반글의 글번호
			pstmt.setInt(4,0); // re_lev 답변글 들여쓰기, 일반글 들여쓰기 없음값 0
			pstmt.setInt(5,0);// re_seq 답변글 순서, 일반글 순서 맨위값 0
			pstmt.setString(6, rb.getNick());
			pstmt.setInt(7, re_num);

			pstmt.executeUpdate();
			 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException ex) {
				}
			}
		
		}
	}// insertRepley() end

	public int replyCount(int num) {
		ResultSet rs = null;
		int count = 0;
		try {
			con = getConnection();

			sql = "select count(*) from gram_reply where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next())
				count = rs.getInt(1);
			// 3. sql insert 디비날짜 now()
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException ex) {
				}
			}
		}
		return count;
	}// replyCount() end

	public List<ReplyBean> getReplyList(int startRow, int pageSize, int num) {
		ResultSet rs = null;
		List<ReplyBean> replyList = new ArrayList<ReplyBean>();
		try {

			// 1,2디비연결 메서드호출
			con = getConnection();
			// num 게시판 글번호 구하기
			// sql 함수 최대값 구하기 max()
			sql = "select * from gram_reply where num=? order by re_ref desc, re_seq asc limit ?, ? ";
			pstmt = con.prepareStatement(sql);	
			pstmt.setInt(1, num);
			pstmt.setInt(2, startRow - 1);
			pstmt.setInt(3, pageSize);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ReplyBean rb = new ReplyBean();
				rb.setNum(rs.getInt(1));
				rb.setContent(rs.getString(2));
				rb.setRe_lev(rs.getInt(3));
				rb.setRe_seq(rs.getInt(4));
				rb.setNick(rs.getString(5));
				rb.setDate(rs.getDate(6));
				rb.setRe_num(rs.getInt(7));
				rb.setRe_ref(rs.getInt(8));
				
				replyList.add(rb);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException ex) {
				}
			}
		}
		return replyList;
	} // getReplyList() end

	public ReplyBean getReply(int re_num) {		
		ReplyBean rb = new ReplyBean();
		try {
			con = getConnection();
			sql = "select * from gram_reply where re_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, re_num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				rb.setNum(rs.getInt("num"));
				rb.setContent(rs.getString("content"));
				rb.setRe_lev(rs.getInt("re_lev"));
				rb.setRe_seq(rs.getInt("re_seq"));
				rb.setNick(rs.getString("nick"));
				rb.setDate(rs.getDate("date"));
				rb.setRe_num(rs.getInt("re_num"));				
	
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException ex) {
				}
			}
		}
		return rb;
	}// getBoard() end

	public void deleteReply(int re_num) {
		

		try {
			con = getConnection();
				sql = "delete from gram_reply where re_num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1,re_num);
				pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException ex) {
				}
			}
		}
	} // deleteReply() end

	public void updateReply(ReplyBean rb) {
		ResultSet rs = null;
		try {
			
			con = getConnection();
					sql = "update gram_reply set content=?,nick=? where re_num=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, rb.getContent());
					pstmt.setString(2, rb.getNick());
					pstmt.setInt(3, rb.getRe_num());
					
					pstmt.executeUpdate();
					
				
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException ex) {
				}
			}
		}
	}// updateReply() end
	

	public void insertRepleyReply(ReplyBean rb) {		
		int re_num=0;

		try {
			System.out.println("insertRepleyReply의 re_ref의값:"+rb.getRe_ref());
			con = getConnection();

			sql = "select max(re_num) from gram_reply";			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();						
			
			 if(rs.next()){re_num=rs.getInt(1)+1;}

			 System.out.println(rb.getRe_ref()+"여기는DAO에 insertRepleyReply메소드 입니당");
			 
			 sql="update gram_reply set re_seq=re_seq+1 where re_ref=? and re_seq>?";			
			 pstmt = con.prepareStatement(sql);
			 pstmt.setInt(1,rb.getRe_ref());
			 pstmt.setInt(2,rb.getRe_seq());
			 
			 pstmt.executeUpdate();
	

			sql = "insert into gram_reply(num,content,re_ref,re_lev,re_seq,nick,re_num,date) " + "values(?,?,?,?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rb.getNum()); // 일반글의 글번호
			pstmt.setString(2, rb.getContent());	
			pstmt.setInt(3, rb.getRe_ref());//re_ref 기존글 그룹번호 같게함
			pstmt.setInt(4, rb.getRe_lev()+1); // re_lev 답변글 들여쓰기, 일반글 들여쓰기 없음값 0
			pstmt.setInt(5, rb.getRe_seq()+1);// re_seq 답변글 순서, 일반글 순서 맨위값 0			
			pstmt.setString(6, rb.getNick());
			pstmt.setInt(7, re_num);

			pstmt.executeUpdate();
			 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException ex) {
				}
			}
		
		}
	}// insertRepley() end
	
	
	
}