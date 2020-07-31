<%@ page language="java" contentType="text/html"%>
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

		<div class="center_content">
			<div class="left_content">
				<div class="title">
					<span class="title_icon"><img
						src="resources/images/bullet1.gif" alt="" title="" /></span>About us
				</div>

				<div class="feat_prod_box_details">
					<p class="details">
						<img src="resources/images/about.gif" alt="" title=""
							class="right" /> 
					</p>
					<p>Nous sommes une équipes de 5 personnes spécialisés dans le domaine d'e-commerce et drop-shipping. Votre confiance et satisfaction est notre priorité!
						<br/>
						<br/>
						<i>5 étudiant génie informatique, passion et ambition!</i><br/></p>
						<p style="text-align: center"><b>Anass Mahmoudi | Yassine Khatab</b><br/>
						<b>Hanane Zguaid | Kawtar Aouissi | Khawla El Ghazoui</b></p>
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