package bean;

public class BeanTest1 {
	// 자바빈(JavaBean,DTO) : 전달할 데이터를 담아서 다른 파일에 전달 시켜줌
	// 멤버변수  데이터 은닉,캡슐화
	private String name;
	
	// 메서드(멤버함수)  set() get()  alt shfit s -> r
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
