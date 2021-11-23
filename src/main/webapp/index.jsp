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
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container-fluid">
				<a class="navbar-brand" href="index.jsp">중고 마켓</a>
				<div class="collapse navbar-collapse" id="navbarResponsive">
					<ul class="navbar-nav ml-auto">
<%
	if(userID == null) {
%>
					<form class="form-inline my-2 my-lg-0">
      					<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      					<button class="btn btn-outline-success mx-lg-2 my-2 my-sm-0" type="submit">검색</button>
    				</form>
					<li class="nav-item"><a class="nav-link" href="userLogin.jsp">
						로그인
					</a></li>
					<li class="nav-item"><a class="nav-link" href="userJoin.jsp">
						회원가입
					</a></li>
<%
	} else {
%>
					<form class="form-inline my-2 my-lg-0">
      					<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      					<button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
    				</form>
					<li class="nav-item"><a class="nav-link" href="userLogout.jsp">
					로그아웃
					</a></li>
				</ul>
			</div>
		</div>
	
<%
	}
%>
	</nav>

		<!-- 카드 -->
	<div class="card" style="background-image:url('./images/background.png')">
		<img class="card-img-top">
		<div class="card-body">
			<h5 class="card-title">Card</h5>
			<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
			<a href="#" class="btn btn-primary">Go somewhere</a>
		</div>
	</div>
<%
	ProductDAO pdDao = new ProductDAO();	
	ProductDTO data = new ProductDTO();
%>
	<!-- 상품 -->
	<section>
		<div class="container">
			<div class="row">
<%
	ArrayList<ProductDTO> pdList = pdDao.pdList();
	
	for(ProductDTO p:pdList) {
%>
				<div class="col" >
					<figure class="figure">
						<a href="detail.jsp?productId=<%=p.getProductId() %>">
						<img src=<%=p.getImgUrl_1() %> class="figure-img img-fluid rounded" alt="...">
						</a>
						<figcaption class="figure-caption"><%=p.getProductName() %></figcaption>
					</figure>
				</div>
<%
	}
%>
				<%-- <div class="col">
					<figure class="figure">
						<a href="detail.jsp?productId=<%=data.getProductId() %>">
						<img src="./images/소주한잔.jpg" class="figure-img img-fluid rounded" alt="...">
						</a>
						<figcaption class="figure-caption">임창정</figcaption>
					</figure>
				</div> --%>
			</div>

			<%-- <div class="row">
				<div class="col">
					<figure class="figure">
						<a href="detail.jsp?productId=<%=data.getProductId() %>">
						<img src="./images/소주한잔.jpg" class="figure-img img-fluid rounded" alt="...">
						</a>
						<figcaption class="figure-caption">임창정</figcaption>
					</figure>
				</div>
				<div class="col">
					<figure class="figure">
						<a href="detail.jsp?productId=<%=data.getProductId() %>">
						<img src="./images/소주한잔.jpg" class="figure-img img-fluid rounded" alt="...">
						</a>
						<figcaption class="figure-caption">임창정</figcaption>
					</figure>
				</div>
				<div class="col">
					<figure class="figure">
						<a href="detail.jsp?productId=<%=data.getProductId() %>">
						<img src="./images/소주한잔.jpg" class="figure-img img-fluid rounded" alt="...">
						</a>
						<figcaption class="figure-caption">임창정</figcaption>
					</figure>
				</div>
			</div> --%>
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