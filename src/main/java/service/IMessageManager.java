
package service;
import java.sql.SQLException;
import java.util.List;

import domain.Message;
interface IMessageManager {
    public void addMessage(Message message) throws SQLException, NumberFormatException;
    public void addMessageByParams(int author, int group, String content) throws SQLException, NumberFormatException;
    public void editMessage(int oldMessageId, Message newMessageData) throws SQLException, NumberFormatException;
    public void editMessageByParams(int oldMessageId, String content) throws SQLException, NumberFormatException;
    public void deleteMessage(int messageId) throws SQLException;
    public Message getMessage(int messageId) throws SQLException, NullPointerException;
    public List<Message> getAllMessages() throws SQLException, NullPointerException;
}
