<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import ="vo.*" %>
<%

	//ANSI CODE	
	final String RESET = "\u001B[0m"; 
	final String LIM = "\u001B[41m";
	final String KIM = "\u001B[42m";
	final String SONG = "\u001B[43m";
	final String YANG = "\u001B[44m";

	//요청값 유효성 검사
	if(request.getParameter("id") == null
		|| request.getParameter("pw") == null
		|| request.getParameter("id").equals("")
		|| request.getParameter("pw").equals("")) {
				
		response.sendRedirect(request.getContextPath()+"/customer/removeCustomer.jsp");
		return;			
	}
	
	// 요청값 변수에 저장
	String id = request.getParameter("id"); 
	String pw = request.getParameter("pw"); 
	
	// 요청값 디버깅
	System.out.println(YANG + id + " <-- removeCustomerAction id" + RESET);
	
	// idList 객체 생성해 요청값 저장
	Id idList = new Id();
	idList.setId(id);
	idList.setLastPw(pw);
	
	// 클래스 객체 생성
	CustomerDao dao = new CustomerDao();
	
	// update 메서드 호출
	int remove = dao.updateCstmActive(idList);
	
	String msg = null;
	
		
	   // response.sendRedirect(request.getContextPath() + "/customer/removeCustomer.jsp?id=" + id);
		
	if(remove > 0){
		System.out.println(YANG + id + "탈퇴 성공" +RESET);
		response.sendRedirect(request.getContextPath() + "/id/logoutAction.jsp");
	} else {
		System.out.println(YANG + id + "탈퇴 실패" +RESET);
		%>
		<script>
			alert('비밀번호를 확인해주세요');
			history.back();
		</script>
		<%
	};
	

%>