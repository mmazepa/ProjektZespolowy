package service;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import domain.Message;
import domain.Snapshot;


public class MessageManager extends SQLHandler implements IMessageManager {

  private PreparedStatement getAllMessagesStmt;
	private PreparedStatement getMessageByIDStmt;
	private PreparedStatement deleteMessageStmt;
	private PreparedStatement addMessageStmt;
	private PreparedStatement addMessageByParamsStmt;
	private PreparedStatement editMessageStmt;
	private PreparedStatement editMessageByParamsStmt;
  private PreparedStatement getMessageByGroupStmt;

	public MessageManager() {
		super();
		try {
      getAllMessagesStmt = getConnection().prepareStatement("SELECT "
          + "id, MessageAuthor, AttendingGroup, SnapshotDate, Content "
          + "FROM Message;");
			getMessageByIDStmt = getConnection().prepareStatement("SELECT "
					+ "id, MessageAuthor, AttendingGroup, SnapshotDate, Content "
					+ "FROM Message WHERE "
					+ "id = ?");
			deleteMessageStmt = getConnection().prepareStatement("DELETE FROM Message WHERE id = ?;");
			addMessageStmt = getConnection().prepareStatement("INSERT INTO "
					+ "Message (MessageAuthor, AttendingGroup, SnapshotDate, Content) "
					+ "VALUES (?, ?, ?, ?);");
			addMessageByParamsStmt = getConnection().prepareStatement("INSERT INTO "
					+ "Message (MessageAuthor, AttendingGroup, Content) "
					+ "VALUES (?, ?, ?);");
			editMessageStmt = getConnection().prepareStatement("UPDATE Message SET "
					+ "MessageAuthor = ?, AttendingGroup = ?, "
					+ "SnapshotDate = ?, Content = ? "
					+ "WHERE id = ?;");
			editMessageByParamsStmt = getConnection().prepareStatement("UPDATE Message SET "
					+ "Content = ? "
					+ "WHERE id = ?;");
      getMessageByGroupStmt = getConnection().prepareStatement("SELECT "
      		+ "id, MessageAuthor, AttendingGroup, SnapshotDate, Content "
      		+ "FROM Message WHERE "
      		+ "AttendingGroup = ?");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void addMessage(Message message) throws SQLException, NumberFormatException {
		addMessageStmt.setInt(1, message.getAuthor());
		addMessageStmt.setInt(2, message.getGroup());
		addMessageStmt.setTimestamp(3, Timestamp.valueOf(message.getCreationDate()));
		addMessageStmt.setString(4, message.getContent());

		addMessageStmt.executeUpdate();
	}

	@Override
	public void addMessageByParams(int author, int group, String content) throws SQLException, NumberFormatException {
		addMessageByParamsStmt.setInt(1, author);
		addMessageByParamsStmt.setInt(2, group);
		addMessageByParamsStmt.setString(3, content);

		addMessageByParamsStmt.executeUpdate();
	}

	@Override
	public void editMessage(int oldMessageId, Message message) throws SQLException, NumberFormatException {
		editMessageStmt.setInt(1, message.getAuthor());
		editMessageStmt.setInt(2, message.getGroup());
		editMessageStmt.setTimestamp(3, Timestamp.valueOf(message.getCreationDate()));
		editMessageStmt.setString(4, message.getContent());
		editMessageStmt.setInt(5, oldMessageId);

		editMessageStmt.executeUpdate();
	}

	@Override
	public void editMessageByParams(int oldMessageId, String content) throws SQLException, NumberFormatException {
		editMessageStmt.setString(1, content);
		editMessageStmt.setInt(2, oldMessageId);

		editMessageByParamsStmt.executeUpdate();
	}

	@Override
	public void deleteMessage(int messageId) throws SQLException {
		deleteMessageStmt.setInt(1, messageId);
		deleteMessageStmt.executeUpdate();
	}

	@Override
	public Message getMessage(int messageId) throws SQLException, NullPointerException {
		Message p = new Message();

		getMessageByIDStmt.setInt(1, messageId);
		ResultSet rs = getMessageByIDStmt.executeQuery();

		rs.next();
		p.setID(rs.getInt("id"));
		p.setAuthor(rs.getInt("MessageAuthor"));
		p.setGroup(rs.getInt("AttendingGroup"));
		p.setCreationDate(rs.getString("SnapshotDate"));
		p.setContent(rs.getString("Content"));

		return p;
	}

	@Override
	public List<Message> getAllMessages() throws SQLException, NullPointerException {
		List<Message> lista = Collections.synchronizedList(new ArrayList<Message>());

    ResultSet rs = getAllMessagesStmt.executeQuery();
		while (rs.next()) {
			Message p = new Message();
			p.setID(rs.getInt("id"));
			p.setAuthor(rs.getInt("MessageAuthor"));
			p.setGroup(rs.getInt("AttendingGroup"));
			p.setCreationDate(rs.getString("SnapshotDate"));
			p.setContent(rs.getString("Content"));
			lista.add(p);
		}
		return lista;
	}
}
