package bean;

public class BeanDAO1 {
	//데이터베이스 insert 하는 기능 => 메서드 insertMember() 만들기
	public void insertMember(BeanTest1 bt1) {
		System.out.println("BeanDAO1 insertMember()");
		// name 받아서 
		//디비 1드라이버,2디비연결,3insert ,4실행  
		System.out.println("BeanTest1주소를 전달 받아서 name출력 : "+bt1.getName());
	}
}
