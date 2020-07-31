<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="controller.Database,dao.ProductDAO,model.Product,java.util.List,java.util.ArrayList"%>
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
			<div class="left_content">

				<div class="title">
					<span class="title_icon"><img
						src="resources/images/bullet1.gif" alt="" title="" /></span>Special
					gifts
				</div>

				<%
					List<Product> sprods = new ArrayList<Product>(), prods = ProductDAO.getProducts();
													String page_s = request.getParameter("page");
													int page_n, tpages, itemPerPage = 4;
													for (Product p : prods) {
														if (p.isSpecial()) {
															sprods.add(p);
														}
													}
													if ((sprods.size() % itemPerPage) != 0)
														tpages = (sprods.size() / itemPerPage) + 1;
													else
														tpages = sprods.size() / itemPerPage;
													if (page_s == null)
														page_n = 1;
													else
														page_n = Integer.parseInt(page_s);
													for (int i = -itemPerPage + page_n * itemPerPage; i < page_n * itemPerPage; i++) {
														if (i >= sprods.size())
															break;
				%>
				<div class="feat_prod_box">

					<div class="prod_img">
						<a href="details.jsp?idproduct=<%=sprods.get(i).getId()%>"><img
							src="<%=sprods.get(i).getImage()%>" alt=""
							title="<%=sprods.get(i).getName()%>" border="3" /></a>
					</div>

					<div class="prod_det_box">
						<span class="special_icon"><img
							src="resources/images/special_icon.gif" alt="" title="" /></span>
						<div class="box_top"></div>
						<div class="box_center">
							<div class="prod_title"><%=sprods.get(i).getName()%></div>
							<p class="details"><%=sprods.get(i).getDetails()%></p>
							<a href="details.jsp?idproduct=<%=sprods.get(i).getId()%>"
								class="more">- more details -</a>
							<div class="clear"></div>
						</div>

						<div class="box_bottom"></div>
					</div>
					<div class="clear"></div>
				</div>
				<%
					}
				%>

				<div class="pagination">
					<br /> <br /> <span class="disabled"></span>
					<%
						//partie page = 1

						if (page_n == 1) {
					%>
					<span class="current">1</span>
					<%
						for (int i = 2; i < 3; i++) {
					%>
					<a href="specials.jsp?page=<%=i%>"><%=i%></a>
					<%
						}
							//partie page = 2
						} else if (page_n == 2) {
					%>
					<a href="specials.jsp?page=1">1</a> <span class="current">2</span>
					<%
						for (int i = 3; i < 4; i++) {
					%>
					<a href="specials.jsp?page=<%=i%>"><%=i%></a>
					<%
						}
							//partie page 3+
						} else if (page_n < tpages) {
							if (page_n == 3) {
					%>
					<a href="specials.jsp?page=1">1</a>
					<%
						} else {
					%>
					<a href="specials.jsp?page=1">1</a> ..
					<%
						}
					%>
					<a href="specials.jsp?page=<%=page_n - 1%>"><%=page_n - 1%></a> <span
						class="current"><%=page_n%></span> <a
						href="specials.jsp?page=<%=page_n + 1%>"><%=page_n + 1%></a>
					<%
						} else {
					%>
					<a href="specials.jsp?page=1">1</a> .. <a
						href="specials.jsp?page=<%=page_n - 1%>"><%=page_n - 1%></a> <span
						class="current"><%=page_n%></span>
					<%
						}
						if (page_n < tpages - 1) {
							if (page_n == tpages - 2) {
					%>
					<a href="specials.jsp?page=<%=tpages%>"><%=tpages%></a>
					<%
						} else {
					%>
					.. <a href="specials.jsp?page=<%=tpages%>"><%=tpages%></a>
					<%
						}
						}
					%>
				</div>

				<div class="clear"></div>
			</div>
			<!--end of left content-->

			<jsp:include page="/WEB-INF/pages/right-content.jsp" />

			<div class="clear"></div>
		</div>
		<!--end of center content-->

		<%@ include file="/WEB-INF/pages/footer.html"%>

	</div>

</body>
</html>