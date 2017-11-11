package service;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import domain.Workgroup;

//package mypackage;

public class WorkgroupManager extends SQLHandler implements IWorkgroupManager {
	private String getAllWorkgroupStmt = "SELECT id, GroupName, GroupCreationDate, Description, IsPrivate "
			+ "FROM Workgroup;";
	
	private PreparedStatement getWorkgroupByIDStmt;
	private PreparedStatement deleteWorkgroupStmt;
	private PreparedStatement addWorkgroupStmt;
	private PreparedStatement editWorkgroupStmt;
	
	public WorkgroupManager() {
		super();
		try {
			getWorkgroupByIDStmt = getConnection().prepareStatement("SELECT "
					+ "id, GroupName, GroupCreationDate, Description, IsPrivate "
					+ "FROM Workgroup WHERE "
					+ "id = ?");
			deleteWorkgroupStmt = getConnection().prepareStatement("DELETE FROM Workgroup WHERE id = ?;");
			addWorkgroupStmt = getConnection().prepareStatement("INSERT INTO "
					+ "Workgroup (GroupName, GroupCreationDate, Description, IsPrivate) "
					+ "VALUES (?, ?, ?, ?);");
			editWorkgroupStmt = getConnection().prepareStatement("UPDATE Workgroup SET "
					+ "GroupName = ?, GroupCreationDate = ?, "
					+ "Description = ?, IsPrivate = ? "
					+ "WHERE id = ?;");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void addWorkgroup(Workgroup workgroup) throws SQLException, NumberFormatException {
		addWorkgroupStmt.setString(1, workgroup.getName());
		addWorkgroupStmt.setString(2, workgroup.getCreationDate());
		addWorkgroupStmt.setString(3, workgroup.getDescription());
		addWorkgroupStmt.setInt(4, (workgroup.isPrivate()) ? 1 : 0);

		addWorkgroupStmt.executeUpdate();
	}

	@Override
	public void editWorkgroup(int oldWorkgroupId, Workgroup newWorkgroupData) throws SQLException, NumberFormatException {
		editWorkgroupStmt.setString(1, newWorkgroupData.getName());
		editWorkgroupStmt.setString(2, newWorkgroupData.getCreationDate());
		editWorkgroupStmt.setString(3, newWorkgroupData.getDescription());
		editWorkgroupStmt.setInt(4, (newWorkgroupData.isPrivate()) ? 1 : 0);
		editWorkgroupStmt.setInt(5, oldWorkgroupId);

		editWorkgroupStmt.executeUpdate();
	}

	@Override
	public void deleteWorkgroup(int workgroupId) throws SQLException {
		deleteWorkgroupStmt.setInt(1, workgroupId);
		deleteWorkgroupStmt.executeUpdate();
	}

	@Override
	public Workgroup getWorkgroup(int workgroupId) throws SQLException, NullPointerException {
		Workgroup p = new Workgroup();
		  
		getWorkgroupByIDStmt.setInt(1, workgroupId);
		ResultSet rs = getWorkgroupByIDStmt.executeQuery();
				
		rs.next();
		p.setID(rs.getInt("id"));
		p.setName(rs.getString("GroupName"));
		p.setCreationDate(rs.getString("GroupCreationDate"));
		p.setDescription(rs.getString("Description"));
		p.setPrivate((rs.getInt("IsPrivate") == 1)? true : false);

		return p;
	}

	@Override
	public List<Workgroup> getAllWorkgroups() throws SQLException, NullPointerException {
		List<Workgroup> cigs = Collections.synchronizedList(new ArrayList<Workgroup>());

		ResultSet rs = statement.executeQuery(getAllWorkgroupStmt);
		while (rs.next()) {
			Workgroup p = new Workgroup();
			p.setID(rs.getInt("id"));
			p.setName(rs.getString("GroupName"));
			p.setCreationDate(rs.getString("GroupCreationDate"));
			p.setDescription("Description");
			p.setPrivate((rs.getInt("IsPrivate") == 1)? true : false);
			cigs.add(p);
		}
		return cigs;
	}
}