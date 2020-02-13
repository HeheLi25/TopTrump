package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/*
 * The connection
 */
public class DBConnect {
	private final String DBDRIVER = "org.postgresql.Driver";
	
//	private final String DBURL = "jdbc:postgresql://localhost:5432/postgres";
//	private final String DBUSER = "postgres";
//	private final String DBPASSWORD = "000625";
	
	private final String DBURL = "jdbc:postgresql://yacata.dcs.gla.ac.uk:5432/m_19_2458304l";
	private final String DBUSER = "m_19_2458304l";
	private final String DBPASSWORD = "2458304l";
	
	private Connection conn = null;

	public DBConnect() {
		try {
			Class.forName(DBDRIVER);
			this.conn = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
			// System.out.println("Database connected.");
		} catch (Exception e) {
			System.out.println("Fail connection:" + e.getMessage());
			e.printStackTrace();
		}
	}

	public Connection getConnection() {
		return this.conn;
	}

	/*
	 * This static method check whether the table in the database is created or not.
	 * If created, it does nothing. If not, create the table and initiate the
	 * values. It is called only once when the application starts.
	 */
	public static void checkTable() {
		DBConnect conn = new DBConnect();
		ResultSet rs = null;
		Statement stmt = null;
		try {
			stmt = conn.getConnection().createStatement();
			rs = stmt.executeQuery("select * from pokemon");
			rs.next();
			rs.getInt("number_of_games");
			// This is just for check, if the table does not exist, it will throw an
			// exception.
			rs.close();
		} catch (Exception e) {
			System.out.println("Trying to create table...");
			try {
				stmt = conn.getConnection().createStatement();
				String s = "CREATE TABLE POKEMON(" + "number_of_games INT DEFAULT 0,"
						+ "number_of_humanwins INT DEFAULT 0," + "number_of_aiwins INT DEFAULT 0,"
						+ "average_number_of_draws INT DEFAULT 0," + "longest_game INT DEFAULT 0,"
						+ "PRIMARY KEY(number_of_games)" + ");"
						+ "insert into pokemon(number_of_games,number_of_humanwins,number_of_aiwins,average_number_of_draws,longest_game)"
						+ "values(0,0,0,0,0)";
				stmt.executeUpdate(s);
				stmt.close();
			} catch (SQLException e1) {
				System.out.println("Unable to create table.");
			}
		} finally {
			conn.close();
		}
	}
	public static int getNumOfGames(){
		DBConnect db = new DBConnect();
		int result = -1;
		try {

			Statement stmt = db.getConnection().createStatement();
			ResultSet rs = stmt.executeQuery("select * from pokemon");
			rs.next();
			result = rs.getInt("number_of_games");
			stmt.close();
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.close();
		}
		return result;
	}
	public static int getNumOfHumanWins(){
		DBConnect db = new DBConnect();
		int result = -1;
		try {

			Statement stmt = db.getConnection().createStatement();
			ResultSet rs = stmt.executeQuery("select * from pokemon");
			rs.next();
			result = rs.getInt("number_of_humanwins");
			stmt.close();
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.close();
		}
		return result;
	}
	public static int getNumOfAIWins(){
		DBConnect db = new DBConnect();
		int result = -1;
		try {

			Statement stmt = db.getConnection().createStatement();
			ResultSet rs = stmt.executeQuery("select * from pokemon");
			rs.next();
			result = rs.getInt("number_of_aiwins");
			stmt.close();
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.close();
		}
		return result;
	}
	public static int getAverageDraws(){
		DBConnect db = new DBConnect();
		int result = -1;
		try {

			Statement stmt = db.getConnection().createStatement();
			ResultSet rs = stmt.executeQuery("select * from pokemon");
			rs.next();
			result = rs.getInt("average_number_of_draws");
			stmt.close();
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.close();
		}
		return result;
	}
	

	public static int getLongestGame() {
		DBConnect db = new DBConnect();
		int result = -1;
		try {

			Statement stmt = db.getConnection().createStatement();
			ResultSet rs = stmt.executeQuery("select * from pokemon");
			rs.next();
			result = rs.getInt("longest_game");
			stmt.close();
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.close();
		}
		return result;
	}

	public void close() {
		try {
			this.conn.close();
			// System.out.println("Connection closed.");
		} catch (Exception e) {
		}
	}

}
