<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1252" />
<title>Pet Shop</title>
<link rel="stylesheet" type="text/css" href="resources/css/style.css" />

</head>
<body>
	<div id="wrap">


		<%@ include file="/WEB-INF/pages/header.html"%>

		<div class="center_content">
			<jsp:include page="/WEB-INF/pages/myinfo.jsp" />
			<jsp:include page="/WEB-INF/pages/right-content.jsp" />
			<div class="clear"></div>
		</div>
		<!--end of center content-->
		<%@ include file="/WEB-INF/pages/footer.html"%>


	</div>

</body>
</html>