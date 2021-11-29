<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.net.URLEncoder" %>
<%@ page import = "java.io.File" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "com.oreilly.servlet.MultipartRequest" %>
<%@ page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import = "product.ProductDAO" %>
<%@ page import = "product.ProductDTO" %>
<%@ page import = "java.io.PrintWriter"%>
<%@ page import = "javax.servlet.ServletException" %>
<%@ page import = "javax.servlet.http.HttpServletRequest" %>
<%@ page import = "javax.servlet.http.HttpServletResponse" %>
<%@ page import = "util.SHA256"%>
<%
	String filename="";
	int sizeLimit = 15*1024*1024;
	
	//String realPath = request.getServletContext().getRealPath("images");
	String realPath = "C://Users//apem5//OneDrive//바탕 화면//JspWebProject//src//main//webapp//images";
		File dir = new File(realPath);
	if(!dir.exists()) {
		dir.mkdirs();
		System.out.println("폴더가 생성되었습니다.");
	}
	
	MultipartRequest multipartRequest = null;
	multipartRequest = new MultipartRequest(request, realPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
	
	filename = multipartRequest.getFilesystemName("imgUrl_1");
	filename = new String(filename.getBytes("8859_1"), "utf-8");
	String productId = "0";
	String productName = null;
	int companyId = 0;
	int price = 0;
	int soldCount = 0;
	String detail = null;
	String imgUrl_1 = realPath;
%>
<%=multipartRequest.getOriginalFileName("imgUrl_1") %>
<%=filename %>
<c:out value='${pageContext.request.contextPath}'/>/images/<%=filename %>
<%-- imgUrl_1 = realPath --%>
<img src="<c:out value='${pageContext.request.contextPath}'/>/images/<%=filename%>" />
	<%
		System.out.println(multipartRequest.getOriginalFileName("imgUrl_1"));
		System.out.println(imgUrl_1);
		request.setCharacterEncoding("UTF-8");
		String userID = null;
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if(userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 해주세요.');");
			script.println("location.href = 'userLogin.jsp';");
			script.println("</script>");
			script.close();
			return;
		}
		if(multipartRequest.getParameter("productId") != null) {
			productId = multipartRequest.getParameter("productId");
		} 
		if(multipartRequest.getParameter("productName") != null) {
			productName = multipartRequest.getParameter("productName");
		}
		if(multipartRequest.getParameter("companyId") != null) {
			try {
				companyId = Integer.parseInt(multipartRequest.getParameter("companyId"));	
			} catch (Exception e) {
				System.out.println("회사 넘버 오류");
			}
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('companyId 입력 오류');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
			return;
		}
		if(multipartRequest.getParameter("price") != null) {
			try {
				price = Integer.parseInt(multipartRequest.getParameter("price"));	
			} catch (Exception e) {
				System.out.println("가격 오류");
			}
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('price 입력 오류');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
			return;
		}
		if(multipartRequest.getParameter("soldCount") != null) {
			try {
				soldCount = Integer.parseInt(multipartRequest.getParameter("soldCount"));	
			} catch (Exception e) {
				System.out.println("수량 오류");
			}
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('soldCount 입력 오류');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
			return;
		}
		if(multipartRequest.getParameter("detail") != null) {
			detail = multipartRequest.getParameter("detail");
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('detail 입력 오류');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
			return;
		}
		imgUrl_1 = filename;
		if (productName == null || companyId == 0 || price == 0 ||
				soldCount == 0 || detail == null || imgUrl_1 == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
			return;
		}
		ProductDAO productDAO = new ProductDAO();
		int result = productDAO.insertProduct(new ProductDTO(0, productName, companyId, price,
				soldCount, detail, imgUrl_1, userID));
		if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('제품 등록에 실패했습니다.');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
			return;
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'index.jsp';");
			script.println("</script>");
			script.close();
		}
	%>