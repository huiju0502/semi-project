<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="vo.*"%>
<%@ page import="java.net.*" %>
<%
	/* 인코딩 */
	request.setCharacterEncoding("utf-8");	

	/* 디버깅 색깔 지정 */
	// ANSI CODE   
	final String RESET = "\u001B[0m"; 
	final String LIM = "\u001B[41m";
	final String KIM = "\u001B[42m";
	final String SONG = "\u001B[43m";
	final String YANG = "\u001B[44m";
	
	/* 유효성 검사 */
	if(session.getAttribute("loginId") == null){
		response.sendRedirect(request.getContextPath()+"/home.jsp");
		return;
	}
	
	if(request.getParameter("addAddressName")==null
	|| request.getParameter("addAddress")==null){
		String msg = URLEncoder.encode("입력란에 모두 입력해주세요", "utf-8");
		response.sendRedirect(request.getContextPath()+"/address/addAddress.jsp?msg="+msg);
		return;
	}
	int productNo = Integer.parseInt(request.getParameter("productNo"));
	String loginId = (String)session.getAttribute("loginId");
	String addAddressName = request.getParameter("addAddressName");
	String addAddress = request.getParameter("addAddress");
	String defaultAddress = request.getParameter("defaultAddress");
	System.out.println(KIM+loginId+"<--addAddressAction parameter loginId"+RESET);
	System.out.println(KIM+addAddressName+"<--addAddressAction parameter addressName"+RESET);
	System.out.println(KIM+addAddress+"<--addAddressAction parameter address"+RESET);
	System.out.println(KIM+defaultAddress+"<--addAddressAction parameter defaultAddress"+RESET);

	/* Address 객체 생성 및 데이터 설정 */
	Address address = new Address();
	address.setId(loginId);
	address.setAddressName(addAddressName);
	address.setAddress(addAddress);
	address.setDefaultAddress(defaultAddress);
	
	// AddressDao 객체 생성
	AddressDao addressDao = new AddressDao();
	
	// 주소 추가 및 추가된 행 수 반환
	int row = addressDao.addAddress(address);
	System.out.println(row+KIM+"<--addAddressAction row"+RESET);
	
	String msg = null;
	if(row == 0){
		msg = URLEncoder.encode("추가 실패", "utf-8");
		// 실패 메시지와 함께 추가 페이지로 리다이렉트
		response.sendRedirect(request.getContextPath()+"/address/addAddress.jsp?msg="+msg);
		return;
	} else {
		// 주소 추가 성공 시 주소 목록 페이지로 리다이렉트
		response.sendRedirect(request.getContextPath()+"/address/addressList.jsp?productNo="+productNo);
		return;
	}

%>