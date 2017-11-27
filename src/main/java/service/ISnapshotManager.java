
package service;
import java.sql.SQLException;
import java.util.List;

import domain.Snapshot;
interface ISnapshotManager {

    public void addSnapshot(Snapshot snapshot) throws SQLException, NumberFormatException;
    public void addSnapshotByParams(int author, int file, String name, String content) throws SQLException, NumberFormatException;
    public void editSnapshot(int oldSnapshotId, Snapshot newSnapshotData) throws SQLException, NumberFormatException;
    public void editSnapshotByParams(int oldSnapshotId, String name, String content) throws SQLException, NumberFormatException;
    public void deleteSnapshot(int snapshotId) throws SQLException;
    public Snapshot getSnapshot(int snapshotId) throws SQLException, NullPointerException;
    public List<Snapshot> getAllSnapshots() throws SQLException, NullPointerException;

}
