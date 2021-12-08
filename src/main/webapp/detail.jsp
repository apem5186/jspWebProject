<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="product.ProductDAO" %>
<%@ page import="product.ProductDTO" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>중고마켓</title>
	<!-- 부트스트랩 CSS 추가하기 -->
	<link rel="stylesheet" href="./css/bootstrap.min.css">
	<!-- 커스텀 CSS 추가하기 -->
	<link rel="stylesheet" href="css/Detail.css" type="text/css">
</head>
<body>
<%	
	String userID = null;
	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	String pdId = null;
	if(request.getParameter("productId") != null) {
		pdId = request.getParameter("productId");
	} else if (pdId == "0") {
		PrintWriter script = response.getWriter();
		script.println("<script>alert('유효하지 않은 목록입니다.')</script>");
		script.println("<script>location.href='index.jsp'</script>");
	}
	ProductDTO data = new ProductDAO().getProduct(pdId);
	String image = URLEncoder.encode(data.getImgUrl_1(), "utf-8");
	System.out.println(image);
%>

   <!-- Header -->
   <div id="haderWrap">
    <header id="header">
       <h1><a href="index.jsp">중고마켓</a></h1>
       <nav id=lnb>
          <ul class="clearfix">
             <li><a href="userLogin.jsp">로그인</a></li>
             <li><a href="userJoin.jsp">회원가입</a></li>
             <li><a href="userLogout.jsp">로그아웃</a></li>
             <li><a href="cart.jsp">장바구니</a></li>
             <li><a href="#"><b>즐겨찾기</b></a></li>
             <li><a href="#"><b>내상점</b></a></li>
          </ul>
       </nav>

       <nav id="gnb">
          <ul class="clearfix">
             <li><a href="javascript:void(0)">시세조회</a></li>
             <li><a href="javascript:void(0)">패션의류</a></li>
             <li><a href="javascript:void(0)">모바일/태블릿</a></li>
             <li><a href="javascript:void(0)">카테고리/이벤트</a></li>
          </ul>
       </nav>
    </header>
 </div>
    
 <!-- sectionWrap 시작 -->
   <div id="sectionWrap">
      <!-- product section 시작 -->
      <section id="product" class="clearfix">
         <div class="product_img">
            <img src="./images/<%=image %>" alt="딸기 상품 이미지" style="background-size:400px; width:500px" >
         </div>
         <div class="product_tit">
			 <h3><%=data.getProductName() %></h3>
         </div>
         <div class="product_info">
            <table>
               
               <tbody>
                  <tr>
                     <th>판매가</th>
                    	<td><%=data.getPrice() %></td>
                  </tr>
                  <tr>
                     <th>배송</th>
                     <td><select><option>택배(주문 시 결제)</option><option>퀵서비스(착불)</option><option>직접수령</option></select><p>3,000원 (40,000원 이상 무료)</p></td>
                  </tr>
                  <tr>
                      <th>제조사</th>
                      <td><%=data.getCompanyId() %></td>
                  </tr>
                  <tr>
                     <th>상품정보</th>
                     <td>상세페이지 참조</td>
                  </tr>
                  <tr>
                     <th>재고수</th>
                     <td>1</td>
                  </tr>
               </tbody>
            </table>
         </div>
         <div class="product_value">
            <div class="number">
               <a href="#" class="minus"><i class="xi-minus-circle xi-2x"></i></a>
               <a href="#" class="plus"><i class="xi-plus-circle xi-2x"></i></a>
            </div>
            <p>총 상품금액 <span><%=data.getPrice() %></span>원</p>
         </div>
         <div class="product_link">
            <a href="cartAction.jsp?productId=<%=String.valueOf(data.getProductId()) %>">
                  
                <script type="text/javascript">
                    function cart_btn() {
                        alert("장바구니에 추가되었습니다.")
                    }
                </script>  
            <i class="xi-cart-o xi-x"></i> 장바구니
            </a>

            <a href="payAction.jsp?productId=<%=String.valueOf(data.getProductId()) %>">
            <i class="xi-credit-card xi-x"></i> 구매하기
            </a>
         </div>
      </section>
      
            <!-- detailPage section 시작 -->
      <section id="detailPage" class="clearfix">

         <div class="detail_tap">
            <ul>
               <li class="active"><a href="#">상세설명</a></li>
               <li><a href="#">상품문의</a></li>
               <li><a href="#">교환/반품/배송</a></li>
            </ul>
         </div>
      </section>
		
		
      <div class="tap_product">
        <p><%=data.getDetail() %></p>
      </div>

		<!-- footer -->
			<footer>
				<div class="inner">
					<ul class="menu">
						<li><a href="javascript:void(0)" class= "green">개인정보 처리방침</a></li>
						<li><a href="javascript:void(0)">운영관리 방침</a></li>
						<li><a href="javascript:void(0)">홈페이지 이용약관</a></li>
						<li><a href="javascript:void(0)">위치정보 이용약관</a></li>
					</ul>
		
				<div class="info">
					<span>사업자 등록번호 201-80-12345</span>
					<span>(주)중고마켓</span>
					<span>TEL : 02) 1111-1111 /FAX : 031) 1111-1111</span>
					<span>개인정보 책임자 : 홍길동</span>
				</div>
		
				
				</div>
			</footer>
		</div>
		
			
	<!-- 제이쿼리 자바스크립트 추가하기 -->
	<script src="./js/jquery.min.js"></script>
	<!-- 파퍼 자바스크립트 추가하기 -->
	<script src="./js/popper.js"></script>
	<!-- 부트스트랩 자바스크립트 추가하기 -->
	<script src="./js/bootstrap.min.js"></script>
</body>
</html>