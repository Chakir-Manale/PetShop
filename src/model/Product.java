package model;

public class Product {

	private int id, price, promo;
	private String name, details, type, color, image;
	private boolean special, nouveau, featured;

	public Product() {
	}

	public Product(int id, String name, String details, String type, String color, int price, boolean special,
			int promo, String image, boolean nouveau, boolean feat) {
		super();
		this.id = id;
		this.price = price;
		this.promo = promo;
		this.name = name;
		this.details = details;
		this.type = type;
		this.color = color;
		this.image = image;
		this.special = special;
		this.nouveau = nouveau;
		this.featured = feat;
	}

	public int getPrice() {
		return price;
	}

	public boolean isFeatured() {
		return featured;
	}

	public void setFeatured(boolean featured) {
		this.featured = featured;
	}

	public void setPromo(int promo) {
		this.promo = promo;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getPromo() {
		return promo;
	}

	public void setPromotion(int promotion) {
		this.promo = promotion;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public boolean isSpecial() {
		return special;
	}

	public void setSpecial(boolean special) {
		this.special = special;
	}

	public boolean isNouveau() {
		return nouveau;
	}

	public void setNouveau(boolean nouveau) {
		this.nouveau = nouveau;
	}

	public int getId() {
		return id;
	}

	public void setId(int Id) {
		id = Id;
	}

}