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
<%@ page import = "cart.CartDAO" %>
<%@ page import = "cart.CartDTO" %>
<%@ page import = "java.io.PrintWriter"%>
<%@ page import = "javax.servlet.ServletException" %>
<%@ page import = "javax.servlet.http.HttpServletRequest" %>
<%@ page import = "javax.servlet.http.HttpServletResponse" %>
<%@ page import = "util.SHA256"%>
<%
	String cartId = "0";
	String cartImg = null;
	String cartName = null;
	int cartPrice = 0;
	int cartCount = 0;
	int cartSum = 0;
%>
	<%
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
		String pdId = null;
		if(request.getParameter("productId") != null) {
			pdId = request.getParameter("productId");
		} else if (pdId == "0") {
			PrintWriter script = response.getWriter();
			script.println("<script>alert('유효하지 않은 목록입니다.')</script>");
			script.println("<script>location.href='index.jsp'</script>");
		}
		ProductDTO productDTO = new ProductDAO().getProduct(pdId);
		productDTO.setWriterId(userID);
		CartDAO cartDAO = new CartDAO();
		int result = cartDAO.insertCart(productDTO);
		if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('장바구니 등록에 실패했습니다.');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
		} else {
	%>
<script type="text/javascript">
	function go() {
		document.location.href="cart.jsp?productId=<%=String.valueOf(pdId) %>";
	}
	go()
</script>
	<%
		}	
	%>		