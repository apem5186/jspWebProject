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
	<link rel="stylesheet" href="./css/custom.css" type="text/css">
</head>
<body>
<%
	String userID = null;
	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
%>
   <!-- Header -->
   <div id="haderWrap">
      <header id="header">
         <h1><a href="index.jsp">중고마켓</a></h1>
         <nav id=lnb>

            <%
            if(userID == null) {
         %>
            <ul class="clearfix">
               <li><a href="userLogin.jsp">로그인</a></li>
               <li><a href="userJoin.jsp">회원가입</a></li>
<%
   } else {
%>
               <li><a href="userLogout.jsp">로그아웃</a></li>
               <li><a href="./cart.jsp">장바구니</a></li>
               <li><a href="#"><b>즐겨찾기</b></a></li>
               <li><a href="#"><b>내상점</b></a></li>
               <li><a href="./registration.jsp">등록하기</a></li>
               <li class="userID"><%=userID %>님 환영합니다!</li>
            </ul>
<%
	}
%>
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
<!-- 헤더끝 -->
   <!-- top section 시작 -->
   <section id="top">
      <div id="bg" style="background:url('./images/스키.jpg'); no-repeat fixed; background-size:cover;" >
         <h4>스키 시즌 준비하기</h4>
         <h2>슬슬 들려오는 스키장 개장 소식.<br> 가장 중요한 스키부터 추위를 막아줄 스키복, 눈을 보호해줄 고글까지.<br>이번 시즌은 중고마켓에서 준비해보세요!</h2>
      </div>
   </section>

   <!-- about section  -->
   <section id="about" class="clearfix">
      <div class="section_wrap">
         <div class="about_txt">
            <h3>about</h3>
            <div>
               <h4>스노보드 용품 기획전</h4><br>
               <h2>스노보딩 시즌 준비하기</h2>
               <p>스노보딩 시즌 시작. 늦기 전에 장비부터 체크해야죠.</p>
               <span>화려한 디자인의 데크부터 오버 사이징이 멋진 보드복,<br>
                포인트가 되는 고글까지. 중고마켓에서 합리적인 가격으로 만나보세요!</span>
            </div>
         </div>
         <div class="about_img"><img src="images/스노보드세트.jpg" alt=""></div>
      </div>
   </section>

   <!-- banner section -->
   <section id="banner">
      <div class="left">
         <div class="contents">
            <p class="tit">스마트폰 </p>
            <p class="txt">아이폰 X 11 12 PRO 시리즈, 갤럭시 S20, S21 할인판매<br>6.1인치, 6.2인치 2532 x 1170 슈퍼 레티나 XDR OLED 디스플레이 <br> 2400 x 1080 다이내믹 AMOLED 2X 디스플레이 120Hz</p>
            <p class="link"><a href="#" >바로가기</a></p>
         </div>
      </div>
      <div class="right">
         <div class="contents">
            <p class="tit">패딩/아우터</p>
            <p class="txt">UTILITY DUCK DOWN PUPA SHORT PADDING <br> BLACK / BEIGE / L.GREY / C.GREY / L.KHAKI</p>
            <p class="link"><a href="#" >바로가기</a></p>
         </div>
      </div>
   </section>
   
<%
	ProductDAO pdDao = new ProductDAO();	
	ProductDTO data = new ProductDTO();
%>
   <!-- product section -->
   <section id="product" class="clearfix">
      <div class="section_wrap">
         <h3>상품 더 보기</h3>
         <p class="top_txt">중고마켓이 추천하는 제품 입니다</p>
         <ul class="clearfix">
<%
	ArrayList<ProductDTO> pdList = pdDao.pdList();
	//String realPath = "C://Users//apem5//OneDrive//바탕 화면//JspWebProject//src//main//webapp//images//";
	for(ProductDTO p:pdList) {
%>
            <li>
                  <div class="img_wrap">
                     <a href="detail.jsp?productId=<%=String.valueOf(p.getProductId()) %>">
                        <img src="./images/<%=p.getImgUrl_1() %>" class="figure-img img-fluid rounded" alt="...">
                        </a>
                  </div>
                  <p class="tit"><%=p.getProductName() %></p>
            </li>
<%
	}
%>
         </ul>
      </div>
      
      <div class="more_view">
         <a href="#" >더 보기 <i class="xi-angle-down-min"></i></a>
      </div>
   </section>
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
			<span>(주)Market</span>
			<span>TEL : 02) 1111-1111 /FAX : 031) 1111-1111</span>
			<span>개인정보 책임자 : 최현준</span>
		</div>
		
				
		</div>
	</footer>


	<!-- 제이쿼리 자바스크립트 추가하기 -->
	<script src="./js/jquery.min.js"></script>
	<!-- 파퍼 자바스크립트 추가하기 -->
	<script src="./js/popper.js"></script>
	<!-- 부트스트랩 자바스크립트 추가하기 -->
	<script src="./js/bootstrap.min.js"></script>
</body>
</html>