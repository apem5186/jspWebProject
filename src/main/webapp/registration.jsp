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
	<title>상품 등록</title>
	<!-- 부트스트랩 CSS 추가하기 -->
	<link rel="stylesheet" href="./css/bootstrap.min.css">
	<!-- 커스텀 CSS 추가하기 -->
	<link rel="stylesheet" href="./css/registration.css" type="text/css">
</head>
<body>	
	<div class="container">
        <!-- HEAD -->
        <div class="card">
            <div class="card-header">
              <p>제품 등록</p>	
            </div>
            <div class="card-body">
              <blockquote class="blockquote mb-0">
                <p>Please register your product</p>
                <footer class="blockquote-footer"><cite title="Source Title">쇼핑몰에 상품을 진열하는데 필요한 기본정보를 입력합니다.</cite></footer>
              </blockquote>
            </div>
          </div>
		
          <!-- 상품 등록 Text -->
        	<form action="registrationAction.jsp" method="post" name="productInsertForm" enctype="multipart/form-data" accept-charset="UTF-8"> <!-- enctype : 파일전송시 필요 -->
				<div id="text">
					<%-- <div class="Product__list">
						<label class="col-sm-2">상품 목록</label>
						<div class="com-sm-3">
							<input type="text" id="productId" name=<%="productId" %> class="form-control">
						</div>
					</div> --%>
					
					<div class="Product__name">
						<label class="col-sm-2">상품 이름</label>
						<div class="com-sm-3">
							<input type="text" id="productName" name="productName" class="form-control">
						</div>
					</div>
					
					<div class="Product__price">
						<label class="col-sm-2">판매가</label>
						<div class="com-sm-3">
							<input type="text" id="price" name="price" class="form-control">
						</div>
					</div>
					
					<div class="Product__contents">
						<label class="col-sm-2">상세 내용</label>
						<div class="com-sm-5">
							<textarea name="detail" cols="50" rows="2" class="form-control"></textarea>
						</div>
					</div>
					
					<div class="Product__manufacturer">
						<label class="col-sm-2">제조사</label>
						<div class="com-sm-3">
							<input type="text" name="companyId" class="form-control">
						</div>
					</div>
					
					<div class="Product__stock">
						<label class="col-sm-2">재고 수</label>
						<div class="com-sm-3">
							<input type="text" id="soldCount" name="soldCount" class="form-control">
						</div>
					</div>
					
					<div class="Product__state">
						<label class="Rabel">상태</label>
						<div class="com-sm-5">
							<input type="radio" name="condition" value="Old"> 사용함
							<input type="radio" name="condition" value="New"> 사용 안함
						</div>
					</div>
					
					<div class="Product__image">
						<label class="col-sm-2">상품 이미지</label>
						<div>
							<input type="file" name="imgUrl_1" class="form-control">
						</div>
					</div>
						
					<div class="btn__select">
						<div class="col-sm-offset-2 col-sm-10">
		                    <button type="submit" class="btn btn-primary" id="btnInsert">등록</button>
		                    <button type="button" class="btn btn-danger">취소</button>
						</div>
					</div>	
		        </div>
	        </form>
	</div>
</body>
</html>
</body>
</html>