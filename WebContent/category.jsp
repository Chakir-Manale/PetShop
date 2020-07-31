<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="controller.Database,dao.ProductDAO,model.Product,java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Pet Shop</title>
<link rel="stylesheet" type="text/css" href="resources/css/style.css" />

</head>
<body>
	<div id="wrap">

		<%@ include file="/WEB-INF/pages/header.html"%>

		<div class="center_content">
			<div class="left_content">
				<div class="crumb_nav">
					<a href="index.jsp">home</a> &gt;&gt; Products list
				</div>
				<div class="title">
					<span class="title_icon"><img
						src="resources/images/bullet1.gif" alt="" title="" /></span>Articles
				</div>

				<div class="new_products">

					<%
						List<Product> prods = ProductDAO.getProducts();
									int itemPerPage = 9;
									String page_s = request.getParameter("page");
									int page_n;
									int tpages;
									if ((prods.size() % itemPerPage) != 0)
										tpages = (prods.size() / itemPerPage) + 1;
									else
										tpages = prods.size() / itemPerPage;
									if (page_s == null)
										page_n = 1;
									else
										page_n = Integer.parseInt(page_s);
									for (int i = -itemPerPage + page_n * itemPerPage; i < page_n * itemPerPage; i++) {
										if (i >= prods.size())
											break;
					%>
					<div class="new_prod_box">
						<a href="details.jsp?idproduct=<%=prods.get(i).getId()%>"><%=prods.get(i).getName()%></a>
						<div class="new_prod_bg">

							<%
								if (prods.get(i).getPromo() > 0) {
							%>
							<span class="new_icon"> <img
								src="resources/images/promo_icon.gif" alt="" title="" />
							</span>
							<%
								} else if (prods.get(i).isNouveau()) {
							%>
							<span class="new_icon"> <img
								src="resources/images/new_icon.gif" alt="" title="" />
							</span>
							<%
								}
							%>
							<a href="details.jsp?idproduct=<%=prods.get(i).getId()%>"> <img
								src="<%=prods.get(i).getImage()%> " alt="" title=""
								class="thumb" border="0" /></a>
						</div>
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
						<a href="category.jsp?page=<%=i%>"><%=i%></a>
						<%
							}
								//partie page = 2
							} else if (page_n == 2) {
						%>
						<a href="category.jsp?page=1">1</a> <span class="current">2</span>
						<%
							for (int i = 3; i < 4; i++) {
						%>
						<a href="category.jsp?page=<%=i%>"><%=i%></a>
						<%
							}
								//partie page 3+
							} else if (page_n < tpages) {
								if (page_n == 3) {
						%>
						<a href="category.jsp?page=1">1</a>
						<%
							} else {
						%>
						<a href="category.jsp?page=1">1</a> ..
						<%
							}
						%>
						<a href="category.jsp?page=<%=page_n - 1%>"><%=page_n - 1%></a> <span
							class="current"><%=page_n%></span> <a
							href="category.jsp?page=<%=page_n + 1%>"><%=page_n + 1%></a>
						<%
							} else {
						%>
						<a href="category.jsp?page=1">1</a> .. <a
							href="category.jsp?page=<%=page_n - 1%>"><%=page_n - 1%></a> <span
							class="current"><%=page_n%></span>
						<%
							}
							if (page_n < tpages - 1) {
								if (page_n == tpages - 2) {
						%>
						<a href="category.jsp?page=<%=tpages%>"><%=tpages%></a>
						<%
							} else {
						%>
						.. <a href="category.jsp?page=<%=tpages%>"><%=tpages%></a>
						<%
							}
							}
						%>
					</div>

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