package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	
	Connection con = null;
	PreparedStatement pstmt=null;
	ResultSet rs = null;
	
	//디비연결 메서드()
	public Connection getConnection() throws Exception{
		Context init = new InitialContext();
		//javax.naming 선택 java component environment 
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");
		con = ds.getConnection();
		
		return con;
	}
	
	
	// insertMember(자바빈주소)
	public void insertMember(MemberDTO mb) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			// 예외발생 할 명령
			//1단계 드라이버 불러오기	// 2단계 디비연결
			con=getConnection();
			//3단계 sql 
			String sql="insert into member(id,pass,name,reg_date) values(?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, mb.getId());
			pstmt.setString(2, mb.getPass());
			pstmt.setString(3, mb.getName());
			pstmt.setTimestamp(4, mb.getReg_date());
			//4단계 실행
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			System.out.println("기억장소 정리하는 마무리 작업");
			if(pstmt!=null) try { pstmt.close();} catch (SQLException ex) {}
			if(con!=null) try { con.close();} catch (SQLException ex) {}
		}
	}// insertMember()
	
	// getMember(id)
	public MemberDTO getMember(String id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		MemberDTO mb=new MemberDTO();
//		select * from member where id='kim';
		// id  | pass | name   | reg_date
		// kim | 1111 | 김길동 | 2020-06-11 15:36:44
		// MemberBean 안에 id  | pass | name   | reg_date 저장해서 리턴
//		mb.setId(디비에서 가져온 id);
		try {
			//1단계 드라이버 불러오기	// 2단계 디비연결
			con=getConnection();
			 //  sql    select  id에 해당하는 회원정보 가져오기
			 // 3단계 연결정보를 이용해서 sql구문 만들고 실행할 객체생성 => PreparedStatement
			 String sql="select * from member where id=?";
			 pstmt=con.prepareStatement(sql);
			 pstmt.setString(1, id);
			 // 4단계 실행 결과 => ResultSet rs  
			 rs=pstmt.executeQuery();
			 //  if rs에 처음위치에서 다음행으로 이동  데이터가 있으면  True
			 //  출력 아이디 : 비밀번호 : 이름 : 가입날짜:
			 	if(rs.next()){
			 		mb.setId(rs.getString("id"));
			 		mb.setPass(rs.getString("pass"));
			 		mb.setName(rs.getString("name"));
			 		mb.setReg_date(rs.getTimestamp("reg_date"));
			 	}
//			 	
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			//마무리
			System.out.println("기억장소 정리하는 마무리 작업");
			if(pstmt!=null) try { pstmt.close();} catch (SQLException ex) {}
			if(con!=null) try { con.close();} catch (SQLException ex) {}
			if(rs!=null) try { rs.close();} catch (SQLException ex) {}
		}
		
		return mb;
	}
	
	// userCheck(id,pass)
	public int userCheck(String id,String pass) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		//신호값 정하기 1 : 아이디 비밀번호 일치,  0 : 비밀번호 틀림, -1 : 아이디없음  
		int check=-1;
		try {
			//1단계 드라이버 불러오기	// 2단계 디비연결
			con=getConnection();
			// sql    select id에 해당하는 회원정보 가져오기
			// 3단계 연결정보를 이용해서 sql구문 만들고 실행할 객체생성 => PreparedStatement
			String sql="select * from member where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			// 4단계 실행 결과 => ResultSet rs 
			rs=pstmt.executeQuery();
			// 5단계 rs에 저장된 데이터 있는 확인 .next() 다음행으로 이동 데이터 있으면 True
//			                         // 아이디 있음
//			                         없으면 False
//			                         // 아이디 없음
			if(rs.next()){
//				out.println("아이디있음");
				// if 폼에서 가져온 비밀번호 디비에서 가져온 비밀번호 비교  .equals()
				//  맞으면 "비밀번호 맞음" 틀리면 "비밀번호 틀림"
				if(pass.equals(rs.getString("pass"))){
//					out.println("비밀번호 맞음");
					check=1;
					// 폼아이디,비밀번호 디비에저장된 아이디 비밀번호 일치하면 =>
					// 로그인 인증 => 모든 페이지 상관없이 값이 유지되는 세션값 생성
					// 세션값 생성 "id",id
//			 		session.setAttribute("id", id);
//			 		// main.jsp 이동
//			 		response.sendRedirect("main.jsp");
						
				}else{
//					out.println("비밀번호 틀림");
					check=0;
				}
			}else{
//				out.println("아이디없음");
				check=-1;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			//마무리
			System.out.println("기억장소 정리하는 마무리 작업");
			if(pstmt!=null) try { pstmt.close();} catch (SQLException ex) {}
			if(con!=null) try { con.close();} catch (SQLException ex) {}
			if(rs!=null) try { rs.close();} catch (SQLException ex) {}
		}
		return check;
	}
	
	//updateMember(mb)
	public void updateMember(MemberDTO mb) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			//1단계 드라이버 불러오기	// 2단계 디비연결
			con=getConnection();
			// 3단계 sql update만들고 실행할수 있는 객체생성
			String sql="update member set name=? where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, mb.getName());
			pstmt.setString(2, mb.getId());
			// 4단계 실행
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			//마무리
			System.out.println("기억장소 정리하는 마무리 작업");
			if(pstmt!=null) try { pstmt.close();} catch (SQLException ex) {}
			if(con!=null) try { con.close();} catch (SQLException ex) {}
			if(rs!=null) try { rs.close();} catch (SQLException ex) {}
		}
	}
	
	// deleteMember(id)
	public void deleteMember(String id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			//1단계 드라이버 불러오기	// 2단계 디비연결
			con=getConnection();
			// 3단계 sql update만들고 실행할수 있는 객체생성
			String sql="delete from member where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			// 4단계 실행
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			//마무리
			System.out.println("기억장소 정리하는 마무리 작업");
			if(pstmt!=null) try { pstmt.close();} catch (SQLException ex) {}
			if(con!=null) try { con.close();} catch (SQLException ex) {}
			if(rs!=null) try { rs.close();} catch (SQLException ex) {}
		}
	}
	
	// getMemberList()
	public List getMemberList() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List memberList=new ArrayList();
		try {
			//1단계 드라이버 불러오기	// 2단계 디비연결
			con=getConnection();
			 //  sql    select  id에 해당하는 회원정보 가져오기
			 // 3단계 연결정보를 이용해서 sql구문 만들고 실행할 객체생성 => PreparedStatement
			 String sql="select * from member";
			 pstmt=con.prepareStatement(sql);
			 // 4단계 실행 결과 => ResultSet rs  
			 rs=pstmt.executeQuery();
			 //  while rs에 처음위치에서 다음행으로 이동  데이터가 있으면  True
			 //  출력 아이디 : 비밀번호 : 이름 : 가입날짜:
			 	while(rs.next()){
			 		MemberDTO mb =new  MemberDTO();
			 		mb.setId(rs.getString("id"));
			 		mb.setPass(rs.getString("pass"));
			 		mb.setName(rs.getString("name"));
			 		mb.setReg_date(rs.getTimestamp("reg_date"));
			 		// 배열 한칸에 한사람의 정보 주소를 저장
			 		memberList.add(mb);
			 	}
//			 	
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			//마무리
			System.out.println("기억장소 정리하는 마무리 작업");
			if(pstmt!=null) try { pstmt.close();} catch (SQLException ex) {}
			if(con!=null) try { con.close();} catch (SQLException ex) {}
			if(rs!=null) try { rs.close();} catch (SQLException ex) {}
		}
		return memberList;
	}
	
}// 클래스
