package service;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import domain.Snapshot;
import domain.TextFile;


public class SnapshotManager extends SQLHandler implements ISnapshotManager {
	private String getAllSnapshotStmt = "SELECT id, SnapshotAuthor, AttendingFile, SnapshotName, SnapshotDate, Content FROM Snapshot;";
	
	private PreparedStatement getSnapshotByIDStmt;
	private PreparedStatement deleteSnapshotStmt;
	private PreparedStatement addSnapshotStmt;
	private PreparedStatement editSnapshotStmt;
	
	public SnapshotManager() {
		super();
		try {
			getSnapshotByIDStmt = getConnection().prepareStatement("SELECT "
					+ "id, SnapshotAuthor, AttendingFile, SnapshotName, SnapshotDate, Content "
					+ "FROM Snapshot WHERE "
					+ "id = ?");
			deleteSnapshotStmt = getConnection().prepareStatement("DELETE FROM TextFile WHERE id = ?;");
			addSnapshotStmt = getConnection().prepareStatement("INSERT INTO "
					+ "Snapshot (SnapshotAuthor, AttendingFile, SnapshotName, SnapshotDate, Content) "
					+ "VALUES (?, ?, ?, ?, ?);");
			editSnapshotStmt = getConnection().prepareStatement("UPDATE Snapshot SET "
					+ "SnapshotAuthor = ?, AttendingFile = ?, "
					+ "SnapshotName = ?, SnapshotDate = ?, Content = ? "
					+ "WHERE id = ?;");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void addSnapshot(Snapshot snapshot) throws SQLException, NumberFormatException {
		addSnapshotStmt.setInt(1, snapshot.getAuthor());
		addSnapshotStmt.setInt(2, snapshot.getFile());
		addSnapshotStmt.setString(3, snapshot.getName());
		addSnapshotStmt.setString(4, snapshot.getCreationDate());
		addSnapshotStmt.setString(5, snapshot.getContent());

		addSnapshotStmt.executeUpdate();
	}

	@Override
	public void editSnapshot(int oldSnapshotId, Snapshot newSnapshotData) throws SQLException, NumberFormatException {
		editSnapshotStmt.setInt(1, newSnapshotData.getAuthor());
		editSnapshotStmt.setInt(2, newSnapshotData.getFile());
		editSnapshotStmt.setString(3, newSnapshotData.getName());
		editSnapshotStmt.setString(4, newSnapshotData.getCreationDate());
		editSnapshotStmt.setString(5, newSnapshotData.getContent());
		editSnapshotStmt.setInt(6, oldSnapshotId);

		editSnapshotStmt.executeUpdate();
	}

	@Override
	public void deleteSnapshot(int snapshotId) throws SQLException {
		deleteSnapshotStmt.setInt(1, snapshotId);
		deleteSnapshotStmt.executeUpdate();
	}

	@Override
	public Snapshot getSnapshot(int snapshotId) throws SQLException, NullPointerException {
		Snapshot p = new Snapshot();
		  
		getSnapshotByIDStmt.setInt(1, snapshotId);
		ResultSet rs = getSnapshotByIDStmt.executeQuery();
				
		rs.next();
		p.setID(rs.getInt("id"));
		p.setAuthor(rs.getInt("SnapshotAuthor"));
		p.setFile(rs.getInt("AttendingFile"));
		p.setName(rs.getString("SnapshotName"));
		p.setCreationDate(rs.getString("SnapshotDate"));
		p.setContent(rs.getString("Content"));

		return p;
	}

	@Override
	public List<Snapshot> getAllSnapshots() throws SQLException, NullPointerException {
		List<Snapshot> cigs = Collections.synchronizedList(new ArrayList<Snapshot>());

		ResultSet rs = statement.executeQuery(getAllSnapshotStmt);
		while (rs.next()) {
			Snapshot p = new Snapshot();
			p.setID(rs.getInt("id"));
			p.setAuthor(rs.getInt("SnapshotAuthor"));
			p.setFile(rs.getInt("AttendingFile"));
			p.setName(rs.getString("SnapshotName"));
			p.setCreationDate(rs.getString("SnapshotDate"));
			p.setContent(rs.getString("Content"));
			cigs.add(p);
		}
		return cigs;
	}
}
