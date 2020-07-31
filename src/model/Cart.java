package model;

import java.util.ArrayList;
import java.util.List;
import model.Product;

public class Cart {

	private List<Product> prod = new ArrayList<Product>();
	private Double total;
	private Double totalshipping;

	public Double getTotal() {
		return total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

	public Double getTotalshipping() {
		return totalshipping;
	}

	public void setTotalshipping(Double totalshipping) {
		this.totalshipping = totalshipping;
	}

	public List<Product> getProd() {
		return prod;
	}

	public void setProd(List<Product> prod) {
		this.prod = prod;
	}
}
