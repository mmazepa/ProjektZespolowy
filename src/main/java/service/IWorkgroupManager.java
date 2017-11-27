package service;
import java.sql.SQLException;
import java.util.List;

import domain.Workgroup;
interface IWorkgroupManager {

    public void addWorkgroup(Workgroup workgroup) throws SQLException, NumberFormatException;
    public void addWorkgroupByParams(String name, boolean is_private) throws SQLException, NumberFormatException;
    public void editWorkgroup(int oldWorkgroupId, Workgroup newWorkgroupData) throws SQLException, NumberFormatException;
    public void editWorkgroupByParams(int oldWorkgroupId, String name, String description, boolean is_private) throws SQLException, NumberFormatException; 
    public void deleteWorkgroup(int workgroupId) throws SQLException;
    public Workgroup getWorkgroup(int workgroupId) throws SQLException, NullPointerException;
    public List<Workgroup> getAllWorkgroups() throws SQLException, NullPointerException;

}
