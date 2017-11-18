
package service;
import java.sql.SQLException;
import java.util.List;

import domain.TextFile;
interface ITextFileManager {

    public void addTextFile(TextFile textFile) throws SQLException, NumberFormatException;
    public void addTextFileByParams(int author, int group, String name, boolean isPrivate) throws SQLException, NumberFormatException;
    public void editTextFile(int oldTextFileId, TextFile newTextFileData) throws SQLException, NumberFormatException;
    public void deleteTextFile(int textFileId) throws SQLException;
    public TextFile getTextFile(int textFileId) throws SQLException, NullPointerException;
    public List<TextFile> getAllTextFiles() throws SQLException, NullPointerException;

}
