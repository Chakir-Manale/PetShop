
<%@ page
	import="controller.Database,dao.ProductDAO,model.Product,java.util.List"%>
<div class="right_content">
	<div class="languages_box">
		<span class="red">Languages:</span> <a href="#" class="selected"><img
			src="resources/images/gb.gif" alt="" title="" border="0" /></a> <a
			href="#"><img src="resources/images/fr.gif" alt="" title=""
			border="0" /></a> <a href="#"><img src="resources/images/de.gif"
			alt="" title="" border="0" /></a>
	</div>
	<div class="currency">
		<span class="red">Currency: </span> <a href="#">GBP</a> <a href="#">EUR</a>
		<a href="#" class="selected">USD</a>
	</div>

	<div class="cart">
		<div class="title">
			<span class="title_icon"><img src="resources/images/cart.gif"
				alt="" title="" /></span>My cart
		</div>
		<div class="home_cart_content">
			${quantite} x items | <span class="red">TOTAL:${tt}$</span>
		</div>
		<a href="controleur" class="view_cart">view cart</a>
	</div>

	<div class="title">
		<span class="title_icon"><img
			src="resources/images/bullet3.gif" alt="" title="" /></span>About Our Shop
	</div>
	<div class="about">
		<p>
			<img src="resources/images/about.gif" alt="" title="" class="right" />
			Nous sommes une équipes de 5 personnes spécialisés dans le domaine
			d'e-commerce et drop-shipping. Votre confiance et satisfaction est
			notre priorité!
		</p>

	</div>

	<div class="right_box">
		<div class="title">
			<span class="title_icon"><img
				src="resources/images/bullet4.gif" alt="" title="" /></span>Promotions
		</div>

		<%
			List<Product> prods = ProductDAO.getProducts();
			int maxnbr = 0;
			for (int i = 0; i < prods.size(); i++) {
				if (prods.get(i).getPromo() > 0) {
		%>

		<div class="new_prod_box">
			<a href="details.jsp?idproduct=<%=prods.get(i).getId()%>"><%=prods.get(i).getName()%></a>
			<div class="new_prod_bg">
				<span class="new_icon"><img
					src="resources/images/promo_icon.gif" alt="" title="" /></span><a
					href="details.jsp?idproduct=<%=prods.get(i).getId()%>"> <img
					src="<%=prods.get(i).getImage()%> " alt="" title="" class="thumb"
					border="0" /></a>
			</div>
		</div>

		<%
			maxnbr++;
				}
				if (maxnbr == 3)
					break;
			}
		%>


	</div>

	<div class="right_box">

		<div class="title">
			<span class="title_icon"><img
				src="resources/images/bullet5.gif" alt="" title="" /></span>Categories
		</div>

		<ul class="list">
			<li><a href="#">accesories</a></li>
			<li><a href="#">pets gifts</a></li>
			<li><a href="#">specials</a></li>
			<li><a href="#">hollidays gifts</a></li>
			<li><a href="#">accesories</a></li>
			<li><a href="#">pets gifts</a></li>
			<li><a href="#">specials</a></li>
			<li><a href="#">hollidays gifts</a></li>
			<li><a href="#">accesories</a></li>
			<li><a href="#">pets gifts</a></li>
			<li><a href="#">specials</a></li>
		</ul>

		<div class="title">
			<span class="title_icon"><img
				src="resources/images/bullet6.gif" alt="" title="" /></span>Partners
		</div>

		<ul class="list">
			<li><a href="#">accesories</a></li>
			<li><a href="#">pets gifts</a></li>
			<li><a href="#">specials</a></li>
			<li><a href="#">hollidays gifts</a></li>
			<li><a href="#">accesories</a></li>
			<li><a href="#">pets gifts</a></li>
			<li><a href="#">specials</a></li>
			<li><a href="#">hollidays gifts</a></li>
			<li><a href="#">accesories</a></li>
		</ul>

	</div>


</div>
<!--end of right content-->