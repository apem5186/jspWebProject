<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lab9 파일업로드 기능관련 실습</title>
</head>
<body>
	<form method="post" action="fileupload.jsp" enctype="multipart/form-data">
		<input type="file" name="photo" />
		<input type="submit" value="upload" />
	</form>
</body>
</html>