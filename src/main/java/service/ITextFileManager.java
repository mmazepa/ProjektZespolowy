
package service;
import domain.TextFile;
interface ITextFileManager {

    public void addTextFile(TextFile textFile);
    public void editTextFile(int oldTextFileId, TextFile newTextFileData);
    public void deleteTextFile(int textFileId);
    public void getTextFile(int textFileId);
    public void getAllTextFiles();

}
