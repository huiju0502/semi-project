<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="dao.*" %>
<%@ page import ="vo.*" %>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%
//ANSI CODE	
final String LIM = "\u001B[41m";
final String RESET = "\u001B[0m"; 
final String KIM = "\u001B[42m";
final String SONG = "\u001B[43m";
final String YANG = "\u001B[44m";

IdDao idDao = new IdDao();

int orderNo = Integer.parseInt(request.getParameter("orderNo"));
int productNo = Integer.parseInt(request.getParameter("productNo"));
//세션 유효성 검사
if(session.getAttribute("loginId") != null) {
	// 요청값 객체에 묶어 저장
	Id loginId = new Id();
	loginId.id = (String) session.getAttribute("loginId");
	loginId.lastPw = request.getParameter("password");

	// 디버깅
	System.out.println(loginId.id + " <-- id");
	System.out.println(loginId.lastPw + " <-- lastPw");

	 
	 int row = idDao.selectId(loginId);
	 // 디버깅
	 System.out.println(row +"<removeReviewACtion row"); 
	 
    if (row == 1) {
        //  세션 아이디와 입력된 비밀번호가 일치하면 리뷰 삭제 수행
        if (request.getParameter("orderNo") != null) {
        	ReviewDao reviewDao = new ReviewDao();
        	
            //디버깅
            System.out.println(orderNo +"<removeReviewACtion orderNo");       

			// 1) 파일 삭제
			ReviewImgDao reviewImgDao = new ReviewImgDao();
			
			String dir = request.getServletContext().getRealPath("/reviewImgUpload");
		    System.out.println(dir +"< -- dir"); // getRealPath 실제위치
		    
	        int deleteImgRow = reviewImgDao.deleteReviewImgFile(orderNo, dir);
	        if (deleteImgRow == 1) {
	            System.out.println("파일 삭제 성공");
	        } else {
	            System.out.println("파일 삭제 실패" + RESET);
	        }
	        
	        //2)리뷰삭제
	        int reviewrow = reviewDao.removeReview(orderNo);
			System.out.println(reviewrow +"<removeReviewACtion reviewrow"); 
			
            response.sendRedirect(request.getContextPath() + "/product/productListOne.jsp?productNo="+productNo);}
    } else {
    	System.out.println("비밀번호가 일치하지 않습니다");  
	    %>
	    <script>
	        alert('비밀번호가 틀렸습니다. 다시 시도해주세요.');
	        window.location.href = '<%= request.getContextPath() + "/review/removeReview.jsp?productNo=" + productNo + "&orderNo=" + orderNo %>';
	    </script>
	    <% 
    }
}
%>