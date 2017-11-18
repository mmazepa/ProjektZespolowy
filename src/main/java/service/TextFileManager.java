package service;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import domain.TextFile;


public class TextFileManager extends SQLHandler implements ITextFileManager {
	private String getAllTextFileStmt = "SELECT id, AttendingAuthor, AttendingGroup, FileName, FileCreationDate, Description, IsPrivate FROM TextFile;";

	private PreparedStatement getTextFileByIDStmt;
	private PreparedStatement deleteTextFileStmt;
	private PreparedStatement addTextFileStmt;
	private PreparedStatement addTextFileByParamsStmt;
	private PreparedStatement editTextFileStmt;
	
	public TextFileManager() {
		super();
		try {
			getTextFileByIDStmt = getConnection().prepareStatement("SELECT "
					+ "id, AttendingAuthor, AttendingGroup, FileName, FileCreationDate, Description, IsPrivate "
					+ "FROM TextFile WHERE "
					+ "id = ?");
			deleteTextFileStmt = getConnection().prepareStatement("DELETE FROM TextFile WHERE id = ?;");
			addTextFileStmt = getConnection().prepareStatement("INSERT INTO "
					+ "TextFile (AttendingAuthor, AttendingGroup, FileName, FileCreationDate, Description, IsPrivate) "
					+ "VALUES (?, ?, ?, ?, ?, ?);");
			addTextFileByParamsStmt = getConnection().prepareStatement("INSERT INTO "
					+ "TextFile (AttendingAuthor, AttendingGroup, FileName, IsPrivate) "
					+ "VALUES (?, ?, ?, ?);");
			editTextFileStmt = getConnection().prepareStatement("UPDATE TextFile SET "
					+ "AttendingAuthor = ?, AttendingGroup = ?, FileName = ? "
					+ "FileCreationDate = ?, Description = ?, IsPrivate = ? "
					+ "WHERE id = ?;");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void addTextFile(TextFile textFile) throws SQLException, NumberFormatException {
		addTextFileStmt.setInt(1, textFile.getGroup());
		addTextFileStmt.setInt(2, textFile.getAuthor());
		addTextFileStmt.setString(3, textFile.getName());
		addTextFileStmt.setString(4, textFile.getCreationDate());
		addTextFileStmt.setString(5, textFile.getDescription());
		addTextFileStmt.setInt(6, (textFile.isPrivate()) ? 1 : 0);

		addTextFileStmt.executeUpdate();
	}
	
	@Override
	public void addTextFileByParams(int author, int group, String name, boolean isPrivate) throws SQLException, NumberFormatException {
		addTextFileByParamsStmt.setInt(1, group);
		addTextFileByParamsStmt.setInt(2, author);
		addTextFileByParamsStmt.setString(3, name);
		addTextFileByParamsStmt.setInt(4, (isPrivate) ? 1 : 0);

		addTextFileByParamsStmt.executeUpdate();
	}

	@Override
	public void editTextFile(int oldTextFileId, TextFile newTextFileData) throws SQLException, NumberFormatException {
		editTextFileStmt.setInt(1, newTextFileData.getGroup());
		editTextFileStmt.setInt(2, newTextFileData.getAuthor());
		editTextFileStmt.setString(3, newTextFileData.getName());
		editTextFileStmt.setString(4, newTextFileData.getCreationDate());
		editTextFileStmt.setString(5, newTextFileData.getDescription());
		editTextFileStmt.setInt(6, (newTextFileData.isPrivate()) ? 1 : 0);
		editTextFileStmt.setInt(7, oldTextFileId);

		editTextFileStmt.executeUpdate();
	}

	@Override
	public void deleteTextFile(int textFileId) throws SQLException {
		deleteTextFileStmt.setInt(1, textFileId);
		deleteTextFileStmt.executeUpdate();
	}

	@Override
	public TextFile getTextFile(int textFileId) throws SQLException, NullPointerException {
		TextFile p = new TextFile();
		  
		getTextFileByIDStmt.setInt(1, textFileId);
		ResultSet rs = getTextFileByIDStmt.executeQuery();
				
		rs.next();
		p.setID(rs.getInt("id"));
		p.setAuthor(rs.getInt("AttendingAuthor"));
		p.setGroup(rs.getInt("AttendingGroup"));
		p.setName(rs.getString("TextFile"));
		p.setCreationDate(rs.getString("FileCreationDate"));
		p.setDescription(rs.getString("Description"));
		p.setPrivate((rs.getInt("IsPrivate") == 1)? true : false);

		return p;
	}

	@Override
	public List<TextFile> getAllTextFiles() throws SQLException, NullPointerException {
		List<TextFile> lista = Collections.synchronizedList(new ArrayList<TextFile>());

		ResultSet rs = statement.executeQuery(getAllTextFileStmt);
		while (rs.next()) {
			TextFile p = new TextFile();
			p.setID(rs.getInt("id"));
			p.setAuthor(rs.getInt("AttendingAuthor"));
			p.setGroup(rs.getInt("AttendingGroup"));
			p.setName(rs.getString("TextFile"));
			p.setCreationDate(rs.getString("FileCreationDate"));
			p.setDescription(rs.getString("Description"));
			p.setPrivate((rs.getInt("IsPrivate") == 1)? true : false);
			lista.add(p);
		}
		return lista;
	}
}
