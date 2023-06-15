<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.net.*" %>
<%@ page import ="dao.*" %>
<%@ page import ="vo.*" %>
<%@ page import="java.util.*" %>
<%@ page import = "com.oreilly.servlet.MultipartRequest" %>
<%@ page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>

<%
	// 인코딩 처리
	request.setCharacterEncoding("UTF-8");

	// ANSI CODE	
	final String RESET = "\u001B[0m"; 
	final String LIM = "\u001B[41m";
	final String KIM = "\u001B[42m";
	final String SONG = "\u001B[43m";
	final String YANG = "\u001B[44m";

	// 요청분석 : 로그인 아이디가 관리자레벨2 일때만 상품 추가 가능
	
	// 에러메시지 담을 때 사용할 변수
	String msg = null;

	/* 세션 유효성 검사 */
	
	
	
	CategoryDao ctgrDao = new CategoryDao(); // CategoryDao 객체 생성
	ArrayList<Category> categoryList = ctgrDao.categoryList(); // categoryList 메서드 호출하여, 옵션에 표시할 categoryList 객체 가져오기

	ProductDao productDao = new ProductDao();
	ProductImgDao productImgDao = new ProductImgDao();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addProduct</title>
<style>
	table,td,th {border: 1px solid #000000; border-collapse: collapse;}
</style>
</head>
<body>
	<h1>상품 추가 페이지</h1>
	<!-- 에러메세지 -->
	<div>
	<%
		if(request.getParameter("msg") != null){
	%>
		<%=request.getParameter("msg")%>
	<%
		}
	%>
	</div>
	
	<!-- 새로운 상품 정보 입력 -->
	<form action="<%=request.getContextPath()%>/product/addProductAction.jsp" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td>category_name</td>
				<td>
					<select class="form-select" name="categoryName">
					<%
						for(Category category : categoryList) {
					%>
						<option value="<%=category.getCategoryName()%>"><%=category.getCategoryName()%></option>
					<% 
						}
					%>
					</select>
				</td>
			</tr>
			<tr>
				<td>product_name</td>
				<td><input type="text" name="productName"></td>
			</tr>
			<tr>
				<td>product_price</td>
				<td>
					<input type="text" name="productPrice">
				</td>
			</tr>
			<tr>
				<td>product_status</td>
				<td>
					<input type="radio" name="productStatus" class="pstatus" value="일시품절" required>일시품절
					<input type="radio" name="productStatus" class="pstatus" value="판매중" required>판매중
					<input type="radio" name="productStatus" class="pstatus" value="단종" required>단종
				</td>
			</tr>
			<tr>
				<td>product_stock</td>
				<td><input type="text" name="productStock"></td>
			</tr>
			<tr>
				<td>product_info</td>
				<td>
					<input type="text" name="productInfo">
				</td>
			</tr>
			<tr>
				<td>product_img</td>
				<td>
					<input type="file" name="productImg" required="required">
				</td>
			</tr>
		</table>
		<button type="submit">상품추가</button>
	</form>
</body>
</html>