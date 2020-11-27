package vo;

public class NoticeActionForward {
	/*
	 * 서블릿에서 클라이언트로부터 요청을 받아 처리 후
	 * View 페이지로 포워딩 할 때
	 * 이동할 View 페이지의 URL(주소)과 
	 * 포워딩 방식(Redirect or Dispatcher) 을 다루기 위한 클래스
	 */
	
	private String path; // 포워딩 할 View 페이지 URL을 저장
	private boolean Redirect; // 포워딩 방식 저장
	// true : Redirect방식, false : Dispatcher 방식
	
	
	// Getter/ Setter정의
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public boolean isRedirect() { //is 자동으로붙여서 변수선언시에 is안붙여도된다.
		return Redirect;
	}
	public void setRedirect(boolean redirect) {
		Redirect = redirect;
	}
	
	

	
}
