package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import controller.Database;
import model.User;

public class UserDAO extends Database {

	public static void addUser(User user) {
		String insertQuery = "insert into users (username,password,email,phone,company,adress) values (?,?,?,?,?,?)";
		try {
			PreparedStatement preparedStmt = getConnection().prepareStatement(insertQuery);
			preparedStmt.setString(1, user.getUsername());
			preparedStmt.setString(2, user.getPassword());
			preparedStmt.setString(3, user.getEmail());
			preparedStmt.setString(4, user.getPhone());
			preparedStmt.setString(5, user.getCompany());
			preparedStmt.setString(6, user.getAdress());
			preparedStmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static List<User> getUsersList() {
		List<User> usersList = new ArrayList<User>();
		String selectQuery = "select * from users";
		try {
			Statement stmt = getConnection().createStatement();
			ResultSet rs = stmt.executeQuery(selectQuery);

			while (rs.next()) {
				User user = new User();
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setEmail(rs.getString("email"));
				user.setAdress(rs.getString("adress"));
				user.setPhone(rs.getString("phone"));
				user.setCompany(rs.getString("company"));
				user.setId(Integer.parseInt(rs.getString("id")));

				usersList.add(user);
			}

		} catch (SQLException e) {
			e.printStackTrace();

		}
		return usersList;
	}

	public static boolean updateUser(User user, int userId) {

		String updateQuery = "update petshop.users SET username=? , password= ? , email = ? , phone= ? , company= ? , adress = ? where id = ?";
		try {

			PreparedStatement preparedStmt = getConnection().prepareStatement(updateQuery);
			preparedStmt.setString(1, user.getUsername());
			preparedStmt.setString(2, user.getPassword());
			preparedStmt.setString(3, user.getEmail());
			preparedStmt.setString(4, user.getPhone());
			preparedStmt.setString(5, user.getCompany());
			preparedStmt.setString(6, user.getAdress());
			preparedStmt.setInt(7, userId);
			preparedStmt.executeUpdate();
			return true;

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

}
