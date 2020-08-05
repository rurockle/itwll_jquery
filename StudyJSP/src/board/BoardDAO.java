package board;

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

import jdk.nashorn.internal.ir.SetSplitState;
import member.MemberDTO;



public class BoardDAO {
	// 디비연결 메서드()
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	
	public Connection getConnection() throws Exception {
		// 1단계 드라이버 불러오기
//		Class.forName("com.mysql.jdbc.Driver");
//		// 2단계 디비연결
//		String dbUrl = "jdbc:mysql://localhost:3306/jspdb5";
//		String dbUser = "jspid";
//		String dbPass = "jsppass";
//		con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
//		return con;
		
		// 커넥션 풀(Connection Pool)
		// 데이터베이스와 연결된 Connection 객체를 미리 생성하여 풀(Pool; 기억장소)에 저장
		// 필요할 때마다 접속해서 Connection객체를 사용
		// Connection재사용, 프로그램효율, 성능 증가
		
		
		// 아파치톰캣에 내장된 프로그램 DBCP(DataBase Connection Pool) API 사용
		// 1. WebContent\META-INF context.xml 만들기  (xml파일, 서버 시작 시 기본 설정값으로 먼저 동작)
		// 1단계 DB연결드라이버, 2단계 DB연결 
		// 2.context.xml 만든 자원을 이름을 가져와서 사용
		Context init = new InitialContext();
		//javax.naming 선택 java component environment 
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");
		con = ds.getConnection();
		
		return con;
		
	}
	
	public void freeResource(){
		System.out.println("기억장소 정리하는 마무리 작업");
		if(rs!=null) try { rs.close();} catch (SQLException ex) {}
		if(pstmt!=null) try { pstmt.close();} catch (SQLException ex) {}
		if(con!=null) try { con.close();} catch (SQLException ex) {}
	}

	public void insertBoard(BoardDTO bb) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num = 0;
		try {
			// 예외발생 할 명령
			// 1단계 드라이버 불러오기 // 2단계 디비연결
			con = getConnection();
			// 3단계 max(num) sql

			String sql = "select max(num) from board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				num = rs.getInt("max(num)") + 1;
			}

			// 3단계 sql
			// 데이터베이스 board file열 추가
			// mysql에 Alter table board ADD file VARCHAR(100);
			sql = "insert into board(num,name,pass,subject,content,readcount,date,file,re_ref,re_lev,re_seq) values(?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, num);
			pstmt.setString(2, bb.getName());
			pstmt.setString(3, bb.getPass());
			pstmt.setString(4, bb.getSubject());
			pstmt.setString(5, bb.getContent());
			pstmt.setInt(6, bb.getReadcount());
			pstmt.setTimestamp(7, bb.getDate());
			// file 추가
			pstmt.setString(8, bb.getFile());
			pstmt.setInt(9, num); // 그룹번호 re_ref == 기준번호 num
			pstmt.setInt(10, 0); // re_lev = 0 답글순서
			pstmt.setInt(11, 0); // re_seq = 0 들여쓰기

			// 4단계 실행
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			freeResource();
		}
	}// insertBoard() 종료
	
	
	public void reInsertBoard(BoardDTO bb) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num = 0;
		try {
			// 예외발생 할 명령
			// 1단계 드라이버 불러오기 // 2단계 디비연결
			con = getConnection();
			// 3단계 max(num) sql

			String sql = "select max(num) from board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				num = rs.getInt("max(num)") + 1;
			}
			
			// 3단계 sql 기준 답글 순서 재배치 update
			// 같은 그룹이면서 내 밑에 답글이 있는 경우 
			// re_ref가 같고 re_seq 보다 큰값(내 밑에 답글이 있음) ==> re_seq 순서값 1증가
			sql="update board set re_seq=re_seq+1 where re_ref=? and re_seq > ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, bb.getRe_ref());
			pstmt.setInt(2, bb.getRe_seq());
			//4 실행
			pstmt.executeUpdate();
			
			// 3단계 sql
			// 데이터베이스 board file열 추가
			// mysql에 Alter table board ADD file VARCHAR(100);
			sql = "insert into board(num,name,pass,subject,content,readcount,date,file,re_ref,re_lev,re_seq) values(?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			pstmt.setString(2, bb.getName());
			pstmt.setString(3, bb.getPass());
			pstmt.setString(4, bb.getSubject());
			pstmt.setString(5, bb.getContent());
			pstmt.setInt(6, bb.getReadcount());
			pstmt.setTimestamp(7, bb.getDate());
			// file 추가
			pstmt.setString(8, bb.getFile());
			pstmt.setInt(9, bb.getRe_ref()); // 그룹번호 re_ref == 기준번호 num(그대로)
			pstmt.setInt(10, bb.getRe_lev()+1); // re_lev = 0 답글순서  기존값+1
			pstmt.setInt(11, bb.getRe_seq()+1); // re_seq = 0 들여쓰기  기존값+1(순서)

			// 4단계 실행
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			freeResource();
		}
	}// reInsertBoard(); 종료
	
	
	
	// 제네릭 사용(설정하지 않으면 Object타입으로 저장되어, list.jsp에서 형변환이 필요하게 됨)
	public List<BoardDTO> getBoardList(int startRow, int pageSize) {
		
		List<BoardDTO> boardList = new ArrayList();

		try {
			// 1단계 드라이버 불러오기 // 2단계 디비연결
			con = getConnection();
										//mysql LIMIT 시작행-1,개수
//			String sql = "SELECT * FROM board ORDER BY num DESC";
//			String sql = "SELECT * FROM board ORDER BY num DESC LIMIT ?, ?";
			// 번호를 기준으로 내림차순
			// 답글(그룹기준 re_ref 내림차순 똑같은 번호 있을 때 re_seq 답글 순서: 오름차순 정리
			// mysql에서는 limit 처음번호~나중번호 키워드를 이용해서 글을 잘라올 수 있음 
			String sql = "SELECT * FROM board ORDER BY re_ref DESC, re_seq limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow-1); //시작하는 행은 포함하지 않기 때문
			pstmt.setInt(2, pageSize);
			// 4단계 실행 결과 => ResultSet rs
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardDTO bb = new BoardDTO();
				// DB에서 가져온 데이터를 저장함
				bb.setNum(rs.getInt("num"));
				bb.setName(rs.getString("name"));
				bb.setPass(rs.getString("pass"));
				bb.setSubject(rs.getString("subject"));
				bb.setContent(rs.getString("content"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setDate(rs.getTimestamp("date"));
				// 답글
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_seq(rs.getInt("re_seq"));
				
				
				// 배열 한칸에 게시판 글 한 개를 저장
				boardList.add(bb);
			}
//			 	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 마무리
			System.out.println("기억장소 정리하는 마무리 작업");
			freeResource();
		}
		return boardList;

	} // getBoardList() 종료

	
	public BoardDTO getBoard(int num) {
		
		BoardDTO bb = new BoardDTO();

		try {
			// 1단계 드라이버 불러오기 // 2단계 디비연결
			con = getConnection();
			// sql select id에 해당하는 회원정보 가져오기
			// 3단계 연결정보를 이용해서 sql구문 만들고 실행할 객체생성 => PreparedStatement
			String sql = "select * from board where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			// 4단계 실행 결과 => ResultSet rs
			rs = pstmt.executeQuery();
			// if rs에 처음위치에서 다음행으로 이동 데이터가 있으면 True
			// 출력 아이디 : 비밀번호 : 이름 : 가입날짜:
			if (rs.next()) {

				bb.setNum(rs.getInt("num"));
				bb.setName(rs.getString("name"));
				bb.setPass(rs.getString("pass"));
				bb.setSubject(rs.getString("subject"));
				bb.setContent(rs.getString("content"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setDate(rs.getTimestamp("date"));
				bb.setFile(rs.getString("file"));
				// 답글 달 변수 
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_seq(rs.getInt("re_seq"));
				
			}
//			 	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 마무리
			freeResource();
				
		}

		return bb;
	}// getBoard() 종료	
	
	
	// updateReadcount(num)
	public void updateReadcount(int num) {
		
		try {
			// 1,2단계 디비연결 메서드호출 
			con=getConnection();
			// 3단계 조회수 +1증가 update readcount= readcount+1 조건
			String sql="update board set readcount=readcount+1 where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			// 4단계 실행
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			System.out.println("기억장소 정리하는 마무리 작업");
			freeResource();
		}
	} //updateReadcount(num) 종료
		
	
	
	public void updateBoard(BoardDTO bb) {
	
		try {
			con = getConnection();
			String sql = "UPDATE board SET name=?, subject=?, content=? WHERE num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,  bb.getName());
			pstmt.setString(2,  bb.getSubject());
			pstmt.setString(3,  bb.getContent());
			pstmt.setInt(4, bb.getNum());  
						
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			 e.printStackTrace();
		} finally {
			freeResource();
		}
		
	} // updateBoard() 끝
	
	public int numCheck(BoardDTO bb) {
		
		//신호값 정하기 1 : 아이디 비밀번호 일치,  0 : 비밀번호 틀림, -1 : 넘버없음
		int check = -1;
		try {
			//1단계 드라이버 불러오기	// 2단계 디비연결
			con=getConnection();
			// sql    select id에 해당하는 회원정보 가져오기
			// 3단계 연결정보를 이용해서 sql구문 만들고 실행할 객체생성 => PreparedStatement
			String sql="select * from board where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, bb.getNum());
			// 4단계 실행 결과 => ResultSet rs 
			rs=pstmt.executeQuery();
			// 5단계 rs에 저장된 데이터 있는 확인 .next() 다음행으로 이동 데이터 있으면 True
//			                         // num 있음
//			                         없으면 False
//			                         // num 없음
			if(rs.next()){
//				out.println("num있음");
				// if 폼에서 가져온 비밀번호 디비에서 가져온 비밀번호 비교  .equals()
				//  맞으면 "비밀번호 맞음" 틀리면 "비밀번호 틀림"
				if(bb.getPass().equals(rs.getString("pass"))){
//					out.println("비밀번호 맞음");
					check=1;
					
						
				}else{
//					out.println("비밀번호 틀림");
					check=0;
				}
			}else {
				check=-1;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			//마무리
			freeResource();
		}
		return check;
	}
	
	public void deleteBoard(BoardDTO bb) {
		
		try {
			//1단계 드라이버 불러오기	// 2단계 디비연결
			con=getConnection();
			// 3단계 sql update만들고 실행할수 있는 객체생성
			String sql="delete from board where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, bb.getNum());
			// 4단계 실행
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			//마무리
			freeResource();
		}
	}//deleteBoard종료
		
	public int getBoardCount() {
	
		int count = 0;
		
		try {
			//1단계 드라이버 불러오기	// 2단계 디비연결
			con=getConnection();
			// 3단계 sql update만들고 실행할수 있는 객체생성
			String sql="SELECT COUNT(*) FROM board";
			pstmt=con.prepareStatement(sql);
			
			// 4단계 실행
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt("count(*)"); 
				                 //열 번호 (1) 또는 출력되는 컬럼명을 기입함(cmd에서 확인)
			}
			
		} catch (Exception e) {
			e.getStackTrace();
		}finally {
			freeResource();
			
		}
		return count;
		
	}//getBoardCount() 종료
	
		
	
	
}// dao 종료
