
package service;
import domain.Snapshot;
interface ISnapshotManager {

    public void addSnapshot(Snapshot snapshot);
    public void editSnapshot(int oldSnapshotId, Snapshot newSnapshotData);
    public void deleteSnapshot(int snapshotId);
    public void getSnapshot(int snapshotId);
    public void getAllSnapshots();

}
