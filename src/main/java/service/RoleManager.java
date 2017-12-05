package service;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import domain.Role;


public class RoleManager extends SQLHandler implements IRoleManager {
	private String getAllRoleStmt = "SELECT id, RoleName FROM Role;";
	
	private PreparedStatement getRoleByIDStmt;
	private PreparedStatement deleteRoleStmt;
	private PreparedStatement addRoleStmt;
	private PreparedStatement addRoleByParamsStmt;
	private PreparedStatement editRoleStmt;
	private PreparedStatement editRoleByParamsStmt;
	
	public RoleManager() {
		super();
		try {
			getRoleByIDStmt = getConnection().prepareStatement("SELECT "
					+ "id, RoleName "
					+ "FROM Role WHERE id = ?");
			deleteRoleStmt = getConnection().prepareStatement("DELETE FROM Role WHERE id = ?;");
			addRoleStmt = getConnection().prepareStatement("INSERT INTO "
					+ "Role (RoleName) VALUES (?);");
			addRoleByParamsStmt = getConnection().prepareStatement("INSERT INTO "
					+ "Role (RoleName) VALUES (?);");
			editRoleStmt = getConnection().prepareStatement("UPDATE Role SET "
					+ "RoleName = ? WHERE id = ?;");
			editRoleByParamsStmt = getConnection().prepareStatement("UPDATE Role SET "
					+ "RoleName = ? WHERE id = ?;");
			
			ZoneId zonedId = ZoneId.of( "UTC" );
			ZonedDateTime zdt = ZonedDateTime.now( zonedId );
			System.out.println("Connected with Role on " + zdt + " !");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void addRole(Role role) throws SQLException, NumberFormatException {
		addRoleStmt.setString(1, role.getName());
		addRoleStmt.executeUpdate();
	}
	
	public void addRoleByParams(String name) throws SQLException, NumberFormatException {
		addRoleByParamsStmt.setString(1, name);
		addRoleByParamsStmt.executeUpdate();
	}

	@Override
	public void editRole(int oldRoleId, Role newRoleData) throws SQLException, NumberFormatException {
		editRoleStmt.setString(1, newRoleData.getName());
		editRoleStmt.setInt(2, oldRoleId);
		editRoleStmt.executeUpdate();
	}
	
	public void editRoleByParams(int oldRoleId, String name) throws SQLException, NumberFormatException {
		editRoleByParamsStmt.setString(1, name);
		editRoleByParamsStmt.setInt(2, oldRoleId);
		editRoleByParamsStmt.executeUpdate();
	}

	@Override
	public void deleteRole(int roleId) throws SQLException {
		deleteRoleStmt.setInt(1, roleId);
		deleteRoleStmt.executeUpdate();
	}

	@Override
	public Role getRole(int roleId) throws SQLException, NullPointerException {
		Role p = new Role();
		  
		getRoleByIDStmt.setInt(1, roleId);
		ResultSet rs = getRoleByIDStmt.executeQuery();
				
		rs.next();
		p.setID(rs.getInt("id"));
		p.setName(rs.getString("RoleName"));

		return p;
	}

	@Override
	public List<Role> getAllRoles() throws SQLException, NullPointerException {
		List<Role> lista = Collections.synchronizedList(new ArrayList<Role>());

		ResultSet rs = statement.executeQuery(getAllRoleStmt);
		while (rs.next()) {
			Role p = new Role();
			p.setID(rs.getInt("id"));
			p.setName(rs.getString("RoleName"));
			lista.add(p);
		}
		return lista;
	}
}
