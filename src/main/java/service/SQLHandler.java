package com.di.maven.service;

import java.sql.*;
import java.util.Properties;

public class SQLHandler {
	private Connection connection;
	private String url = "jdbc:postgresql://localhost:5432/cigbase";

	private String createTableRole = "CREATE TABLE Role ("
									+ "id SERIAL PRIMARY KEY, "
									+ "RoleName VARCHAR(30) UNIQUE NOT NULL);";

	private String createTableAccount = "CREATE TABLE Account ("
									+ "id SERIAL PRIMARY KEY,"
									+ "AccountRole INTEGER NOT NULL REFERENCES Role(id) ON DELETE CASCADE ON UPDATE CASCADE,"
									+ "NickName VARCHAR(40) UNIQUE NOT NULL,"
									+ "Email VARCHAR(60) UNIQUE NOT NULL,"
        							+ "UserPass VARCHAR(40) NOT NULL,"
									+ "RegistrationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,"
									+ "Description TEXT,"
									+ "FirstName VARCHAR(40) NOT NULL,"
									+ "LastName VARCHAR(40) NOT NULL,"
									+ "DateOfBirth TIMESTAMP);";

	private String createTableWorkgroup = "CREATE TABLE Workgroup ("
        								+ "id SERIAL PRIMARY KEY,"
										+ "GroupName VARCHAR(40) NOT NULL,"
										+ "GroupCreationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,"
										+ "Description TEXT,"
										+ "IsPrivate INTEGER DEFAULT (0) CHECK ((IsPrivate >= 0) AND (IsPrivate <= 1)));";

	private String createTableAttendance = "CREATE TABLE Attendance ("
										+ "id SERIAL PRIMARY KEY,"
										+ "AttendingGroup INTEGER NOT NULL REFERENCES Workgroup(id) ON DELETE CASCADE ON UPDATE CASCADE,"
										+ "AttendingUser INTEGER NOT NULL REFERENCES Account(id) ON DELETE CASCADE ON UPDATE CASCADE,"
										+ "IsGroupAdmin INTEGER DEFAULT (0) CHECK ((IsGroupAdmin >= 0) AND (IsGroupAdmin <= 1)),"
										+ "JoinDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP);";

	private String createTableTextFile = "CREATE TABLE TextFile ("
										+ "id SERIAL PRIMARY KEY, "
										+ "AttendingAuthor INTEGER NOT NULL DEFAULT (0) REFERENCES Account(id) ON DELETE SET DEFAULT ON UPDATE CASCADE, "
										+ "AttendingGroup INTEGER NOT NULL REFERENCES Workgroup(id) ON DELETE CASCADE ON UPDATE CASCADE, "
										+ "FileName VARCHAR(100) NOT NULL, "
										+ "FileCreationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,"
										+ "Description TEXT,"
										+ "IsPrivate INTEGER DEFAULT (0) CHECK ((IsPrivate >= 0) AND (IsPrivate <= 1)));";

	private String createTableSnapshot = "CREATE TABLE Snapshot ("
										+ "id SERIAL PRIMARY KEY,"
										+ "SnapshotAuthor INTEGER NOT NULL DEFAULT (0) REFERENCES Account(id) ON DELETE SET DEFAULT ON UPDATE CASCADE,"
										+ "AttendingFile INTEGER NOT NULL REFERENCES TextFile(id) ON DELETE CASCADE ON UPDATE CASCADE,"
										+ "SnapshotName VARCHAR(40),"
										+ "SnapshotDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,"
										+ "Content TEXT);";

	private String getAllRoleStmt = "SELECT id, RoleName FROM Role;";
	private String getAllAccountStmt = "SELECT id, AccountRole, NickName, Email, UserPass, RegistrationDate, Description, FirstName, LastName, DateOfBirth FROM Account;";
	private String getAllWorkgroupStmt = "SELECT id, GroupName, GroupCreationDate, Description, IsPrivate FROM Workgroup;";
	private String getAllAttendanceStmt = "SELECT id, AttendingGroup, AttendingUser, IsGroupAdmin, JoinDate FROM Attendance;";
	private String getAllTextFileStmt = "SELECT id, AttendingAuthor, AttendingUser, FileName, FileCreationDate, Description, IsPrivate FROM TextFile;";
	private String getAllSnapshotStmt = "SELECT id, SnapshotAuthor, AttendingFile, SnapshotName, SnapshotDate, Content FROM Snapshot;";

	private PreparedStatement addCigStmt;
	private PreparedStatement deleteAllCigStmt;
	private PreparedStatement deleteCigStmt;
	private PreparedStatement replaceCigStmt;

	private Statement statement;

	public SQLHandler() {
		try {
			Properties props = new Properties();
			props.setProperty("user","fred");
			props.setProperty("password","secret");
			props.setProperty("ssl","true");
			connection = DriverManager.getConnection(url, props);
			statement = connection.createStatement();

			ResultSet rs = connection.getMetaData().getTables(null, null, null, null);
			boolean tableExists = false;
			while (rs.next()) {
				if ("cigbase".equalsIgnoreCase(rs.getString("TABLE_NAME"))) {
					tableExists = true;
					break;
				}
			}

			if (!tableExists) {
				try {
					doTranBegin();
					statement.executeUpdate(createTableRole);
					statement.executeUpdate(createTableAccount);
					statement.executeUpdate(createTableWorkgroup);
					statement.executeUpdate(createTableAttendance);
					statement.executeUpdate(createTableTextFile);
					statement.executeUpdate(createTableSnapshot);
					doTranCommit();
				} catch (SQLException e) {
					doTranRollback();
				} finally {
					doTranEnd();
				}
				
				try {
					doTranBegin();
					statement.executeUpdate("INSERT INTO Role(RoleName) VALUES ('Administrator');");
					statement.executeUpdate("INSERT INTO Role(RoleName) VALUES ('Moderator');");
					statement.executeUpdate("INSERT INTO Role(RoleName) VALUES ('User');");
					doTranCommit();
				} catch (SQLException e) {
					doTranRollback();
				} finally {
					doTranEnd();
				}
			}

			/*addCigStmt = connection.prepareStatement("INSERT INTO Cigarette(Name, Price, Count) VALUES (?, ?, ?);");
			deleteAllCigStmt = connection.prepareStatement("DELETE FROM Cigarette;");
			deleteCigStmt = connection.prepareStatement("DELETE FROM Cigarette WHERE id = ?;");
			replaceCigStmt = connection.prepareStatement("UPDATE Cigarette SET Name = ?, Price = ?, Count = ? WHERE id = ?;");
			*/System.out.println("Connected!");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// awaryjne
	public void executeSQLTran(String sql) {
		try {
			doTranBegin();
			statement.executeUpdate(sql);
			doTranCommit();
		} catch (SQLException e) {
			doTranRollback();
		} finally {
			doTranEnd();
		}
	}

	public ResultSet executeSQLQuery(String sql) {
		ResultSet rs = null;
		try {
			rs = statement.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}

	// do transakcji
	public void setAutoCommit(boolean e) throws SQLException {
		connection.setAutoCommit(e);
	}
	public boolean getAutoCommit() throws SQLException {
		return connection.getAutoCommit();
	}
	public void doTranBegin() throws SQLException {
		if (getAutoCommit() == true) setAutoCommit(false);
	}
	public void doTranCommit() throws SQLException {
		connection.commit();
	}
	public void doTranRollback() {
		try {
			connection.rollback();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			doTranEnd();
		}
	}
	public void doTranEnd() {
		try {
			if (getAutoCommit() == false) setAutoCommit(true);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
