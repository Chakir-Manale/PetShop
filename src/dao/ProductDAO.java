package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import controller.Database;
import model.Product;

public class ProductDAO {

	public static List<Product> getProducts() {
		ArrayList<Product> prods = new ArrayList<Product>();
		Connection conn = (Connection) Database.getConnection();
		try {
			PreparedStatement pstmnt = (PreparedStatement) conn.prepareStatement("select * from products");
			ResultSet Cursor = pstmnt.executeQuery();
			while (Cursor.next()) {
				boolean nouv = false, special = false, featured = false;
				if (Cursor.getString("nouv").equals("1"))
					nouv = true;
				if (Cursor.getString("special").equals("1"))
					special = true;
				if (Cursor.getString("featured").equals("1"))
					featured = true;
				prods.add(new Product(Integer.parseInt(Cursor.getString("id")), Cursor.getString("name"),
						Cursor.getString("details"), Cursor.getString("type"), Cursor.getString("color"),
						Integer.parseInt(Cursor.getString("price")), special,
						Integer.parseInt(Cursor.getString("promo")), Cursor.getString("image"), nouv, featured));
			}
			conn.close();
			return prods;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
}
