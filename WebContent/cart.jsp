<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import=" java.util.*"%>
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
		<%@ include file="WEB-INF/pages/header.html"%>
		<%
			if (request.getParameter("idproduct") != null)
				id = Integer.parseInt(request.getParameter("idproduct")) - 1;
		%>
		<div class="center_content">
			<div class="left_content">
				<div class="title">
					<span class="title_icon"><img
						src="resources/images/bullet1.gif" alt="" title="" /></span>My cart
				</div>

				<div class="feat_prod_box_details">

					<table class="cart_table">
						<tr class="cart_title">
							<td>Item pic</td>
							<td>Book name</td>
							<td>Unit price</td>
							<td>Qty</td>
							<td>Total</td>
						</tr>
						<c:forEach items="${p.prod}" var="pr">
							<tr>
								<td><a href="details.jsp?idproduct=${pr.id}"><img
										src="${pr.item }" alt="" title="${pr.item}" border="0"
										class="cart_thumb" /></a></td>
								<td>${pr.produit_nom}</td>
								<td>${pr.prix}$</td>
								<td>${pr.quantite}</td>
								<td>${pr.quantite*pr.prix}$</td>
							</tr>
						</c:forEach>



						<tr>
							<td colspan="4" class="cart_total"><span class="red">TOTAL
									SHIPPING:</span></td>
							<td>50 $</td>
						</tr>

						<tr>
							<td colspan="4" class="cart_total"><span class="red">TOTAL:</span></td>
							<td>${tt}</td>
						</tr>

					</table>
					<a href="category.jsp" class="continue">&lt; continue</a> <a
						href="#" class="checkout">checkout &gt;</a>
				</div>

				<div class="clear"></div>
			</div>
			<!--end of left content-->

			<jsp:include page="WEB-INF/pages/right-content.jsp" />

			<div class="clear"></div>
		</div>
		<!--end of center content-->
		<%@ include file="WEB-INF/pages/footer.html"%>

	</div>

</body>
</html>