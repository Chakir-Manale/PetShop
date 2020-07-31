<div class="left_content">
	<div class="title">
		<span class="title_icon"><img
			src="resources/images/bullet1.gif" alt="" title="" /></span>Profile
	</div>
	<div class="feat_prod_box_details">

		<div class="contact_form">
			<div class="form_subtitle">Your Account Informations :</div>

			<form name="register" action="updateinfo" method="post">
				<div class="form_row">
					<label class="contact"><strong>Username:</strong></label> <input
						name="username" type="text" class="contact_input"
						value="${userBean.username}" required />
				</div>


				<div class="form_row">
					<label class="contact"><strong>Password:</strong></label> <input
						name="password" type="password" class="contact_input"
						value="${userBean.password}" required />
				</div>

				<div class="form_row">
					<label class="contact"><strong>Email:</strong></label> <input
						name="email" type="email" class="contact_input"
						value="${userBean.email}" required />
				</div>

				<div class="form_row">
					<label class="contact"><strong>Phone:</strong></label> <input
						type="tel" name="phone" class="contact_input"
						value="${userBean.phone}" required />
				</div>

				<div class="form_row">
					<label class="contact"><strong>Company:</strong></label> <input
						name="company" type="text" class="contact_input"
						value="${userBean.company}" required />
				</div>

				<div class="form_row">
					<label class="contact"><strong>Address:</strong></label> <input
						name="adress" type="text" class="contact_input"
						value="${userBean.adress}" required />
				</div>

				<div style="float: left;" class="profil_btn">
					<br>
					<a href="logout" class="myinfo">Log out</a> <input type="submit"
						class="register" value="Save" />
				</div>
			</form>
		</div>
	</div>
	<div class="clear"></div>
</div>
