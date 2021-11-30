<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="cart.CartDAO" %>
<%@ page import="cart.CartDTO" %>
<%@ page import="product.ProductDTO" %>
<%@ page import="product.ProductDAO" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>중고마켓</title>
	<!-- 부트스트랩 CSS 추가하기 -->
	<link rel="stylesheet" href="./css/bootstrap.min.css">
	<!-- 커스텀 CSS 추가하기 -->
	<link rel="stylesheet" href="./css/cart.css" type="text/css">
	<!-- js 연동 -->
	<script type="text/javascript" src="js/cart.js"></script>
</head>

<body>
<%
	String userID = null;
	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	 String productId = null;
	 if(request.getParameter("productId") != null) {
		 productId = request.getParameter("productId");
	 } else {
		 System.out.println(productId);
	 }
	 CartDAO ctDAO = new CartDAO();
	 ProductDTO pdDTO = new ProductDAO().getProduct(productId);
	 CartDTO cartData = new CartDAO().getCart(userID);
%>
	<input type="hidden" name="cmd" value="order">
            <div class="basketdiv" id="basket">
                <div class="row head">
                    <div class="subdiv">
                        <div class="check">선택</div>
                        <div class="img">이미지</div>
                        <div class="pname">상품명</div>
                    </div>
                    <div class="subdiv">
                        <div class="basketprice">가격</div>
                        <div class="num">수량</div>
                        <div class="sum">합계</div>
                    </div>
                    <div class="subdiv">
                        <div class="basketcmd">삭제</div>
                    </div>
                    <div class="split"></div>
                </div>
<%
	if (cartData == null) {
%>	
				<div class="text">
					<span style="display:block; text-align:center;">장바구니 비었습니다!</span>
				</div>
				<div class="img"><img src="./images/shipping-box.jpg"  width="720" height="720" ></div>
<%
	} else {
%>
<%
	ArrayList<CartDTO> ctList = ctDAO.ctList(userID);
	for(CartDTO c:ctList) {
		if (userID == c.getWriterId()) {
			String image = URLEncoder.encode(c.getCartImg(), "utf-8");
%>
             <!-- 1번째 item -->
                <div class="row data">
                    <div class="subdiv">
                        <div class="check"><input type="checkbox" name="buy" value="260" checked="" onclick="javascript:basket.checkItem();"></div>
                        <div class="img"><img src="./images/<%=image %>" width="60"></div>
                        <div class="pname">
                            <span><%=cartData.getCartName() %></span>
                        </div>
                    </div>

                    <div class="subdiv">
                        <div class="basketprice"><input type="hidden" name="p_price" id="p_price1" class="p_price" value="20000"><%=c.getCartPrice() %></div>
                        <div class="num"><%=c.getCartCount() %></div>
                        <div class="sum"><%=c.getCartCount() * c.getCartPrice() %></div>    
                    </div>

                    <div class="subdiv">
                        <div class="basketcmd"><a href="cartDeleteAction.jsp?cartId=<%=String.valueOf(c.getCartId()) %>" class="abutton" onclick="javascript:basket.delItem();">삭제</a></div>
                    </div>
                </div>
<%
			}
		}
	}
%>
            </div>
    
    
            <div class="right-align basketrowcmd">
                <a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delCheckedItem();">선택상품삭제</a>
                <a href="cartDeleteActionAll.jsp" class="abutton" onclick="javascript:basket.delAllItem();">장바구니비우기</a>
            </div>
            
            <!-- 선택 상품 -->
            <div id="goorder" class="">
                <div class="clear"></div>
                <div class="buttongroup center-align cmd">
                    <a href="javascript:void(0);">선택한 상품 주문</a>
                </div>
            </div>


	<!-- 제이쿼리 자바스크립트 추가하기 -->
	<script src="./js/jquery.min.js"></script>
	<!-- 파퍼 자바스크립트 추가하기 -->
	<script src="./js/popper.js"></script>
	<!-- 부트스트랩 자바스크립트 추가하기 -->
	<script src="./js/bootstrap.min.js"></script>
</body>
</html>