package service;
import domain.Workgroup;
interface IWorkgroupManager {

    public void addWorkgroup(Workgroup workgroup);
    public void editWorkgroup(int oldWorkgroupId, Workgroup newWorkgroupData);
    public void deleteWorkgroup(int workgroupId);
    public void getWorkgroup(int workgroupId);
    public void getAllWorkgroups();

}
