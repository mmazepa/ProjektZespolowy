package service;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import domain.Attendance;


public class AttendanceManager extends SQLHandler implements IAttendanceManager {
	private String getAllAttendanceStmt = "SELECT id, AttendingGroup, AttendingUser, IsGroupAdmin, JoinDate FROM Attendance;";
	
	private PreparedStatement getAttendanceByIDStmt;
	private PreparedStatement deleteAttendanceStmt;
	private PreparedStatement addAttendanceStmt;
	private PreparedStatement addAttendanceByParamsStmt;
	private PreparedStatement editAttendanceStmt;
	private PreparedStatement editAttendanceByParamsStmt;
	
	public AttendanceManager() {
		super();
		try {
			getAttendanceByIDStmt = getConnection().prepareStatement("SELECT "
					+ "id, AttendingGroup, AttendingUser, IsGroupAdmin, JoinDate "
					+ "FROM Attendance WHERE "
					+ "id = ?");
			deleteAttendanceStmt = getConnection().prepareStatement("DELETE FROM Attendance WHERE id = ?;");
			addAttendanceStmt = getConnection().prepareStatement("INSERT INTO "
					+ "Attendance (AttendingGroup, AttendingUser, IsGroupAdmin, JoinDate) "
					+ "VALUES (?, ?, ?, ?);");
			addAttendanceByParamsStmt = getConnection().prepareStatement("INSERT INTO "
					+ "Attendance (AttendingGroup, AttendingUser, IsGroupAdmin) "
					+ "VALUES (?, ?, ?);");
			editAttendanceStmt = getConnection().prepareStatement("UPDATE Attendance SET "
					+ "AttendingGroup = ?, AttendingUser = ?, "
					+ "IsGroupAdmin = ?, JoinDate = ? "
					+ "WHERE id = ?;");
			editAttendanceByParamsStmt = getConnection().prepareStatement("UPDATE Attendance SET "
					+ "AttendingGroup = ?, AttendingUser = ?, "
					+ "IsGroupAdmin = ? "
					+ "WHERE id = ?;");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void addAttendance(Attendance attendance) throws SQLException, NumberFormatException {
		addAttendanceStmt.setInt(1, attendance.getGroup());
		addAttendanceStmt.setInt(2, attendance.getUser());
		addAttendanceStmt.setInt(3, (attendance.isAdmin()) ? 1 : 0);
		addAttendanceStmt.setString(4, attendance.getJoinDate());

		addAttendanceStmt.executeUpdate();
	}

	public void addAttendanceByParams(int group, int user, boolean isAdmin) throws SQLException, NumberFormatException {
		addAttendanceByParamsStmt.setInt(1, group);
		addAttendanceByParamsStmt.setInt(2, user);
		addAttendanceByParamsStmt.setInt(3, (isAdmin) ? 1 : 0);

		addAttendanceByParamsStmt.executeUpdate();
	}
    
	
	@Override
	public void editAttendance(int oldAttendanceId, Attendance newAttendanceData) throws SQLException, NumberFormatException {
		editAttendanceStmt.setInt(1, newAttendanceData.getGroup());
		editAttendanceStmt.setInt(2, newAttendanceData.getUser());
		editAttendanceStmt.setInt(3, (newAttendanceData.isAdmin()) ? 1 : 0);
		editAttendanceStmt.setString(4, newAttendanceData.getJoinDate());
		editAttendanceStmt.setInt(5, oldAttendanceId);

		editAttendanceStmt.executeUpdate();
	}
	
	@Override
	public void editAttendanceByParams(int oldAttendanceId, int group, int user, boolean is_admin) throws SQLException, NumberFormatException {
		editAttendanceByParamsStmt.setInt(1, group);
		editAttendanceByParamsStmt.setInt(2, user);
		editAttendanceByParamsStmt.setInt(3, (is_admin) ? 1 : 0);
		editAttendanceByParamsStmt.setInt(4, oldAttendanceId);

		editAttendanceByParamsStmt.executeUpdate();
	}

	@Override
	public void deleteAttendance(int attendanceId) throws SQLException {
		deleteAttendanceStmt.setInt(1, attendanceId);
		deleteAttendanceStmt.executeUpdate();
	}

	@Override
	public Attendance getAttendance(int attendanceId) throws SQLException, NullPointerException {
		Attendance p = new Attendance();
		  
		getAttendanceByIDStmt.setInt(1, attendanceId);
		ResultSet rs = getAttendanceByIDStmt.executeQuery();
				
		rs.next();
		p.setID(rs.getInt("id"));
		p.setGroup(rs.getInt("AttendingGroup"));
		p.setUser(rs.getInt("AttendingUser"));
		p.setAdmin((rs.getInt("IsGroupAdmin") == 1)? true : false);
		p.setJoinDate(rs.getString("JoinDate"));

		return p;
	}

	@Override
	public List<Attendance> getAllAttendances() throws SQLException, NullPointerException {
		List<Attendance> lista = Collections.synchronizedList(new ArrayList<Attendance>());

		ResultSet rs = statement.executeQuery(getAllAttendanceStmt);
		while (rs.next()) {
			Attendance p = new Attendance();
			p.setID(rs.getInt("id"));
			p.setGroup(rs.getInt("AttendingGroup"));
			p.setUser(rs.getInt("AttendingUser"));
			p.setAdmin((rs.getInt("IsGroupAdmin") == 1)? true : false);
			p.setJoinDate(rs.getString("JoinDate"));
			lista.add(p);
		}
		return lista;
	}

}
