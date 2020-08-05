package bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class BeanDAO2 {
//	insertStudent()
	public void insertStudent(BeanTest2 bt2) {
		System.out.println("BeanDAO2 insertStudent() 받아온 num값 : "+bt2.getNum());
		System.out.println("BeanDAO2 insertStudent() 받아온 name값 : "+bt2.getName());
		try {
			// 예외발생 할 명령
			//1단계 드라이버 불러오기
			Class.forName("com.mysql.jdbc.Driver");
			// 2단계 디비연결
			String dbUrl ="jdbc:mysql://localhost:3306/jspdb5"; 
			String dbUser="jspid";
			String dbPass="jsppass";
			Connection con=DriverManager.getConnection(dbUrl,dbUser,dbPass);
			//3단계 sql 
			String sql="insert into student(num,name) values(?,?)";
			PreparedStatement pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, bt2.getNum());
			pstmt.setString(2, bt2.getName());
			//4단계 실행
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace(); // 예외처리
		}finally {
			//마무리 작업
		}
	}
}
