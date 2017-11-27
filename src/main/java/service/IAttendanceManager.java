
package service;
import java.sql.SQLException;
import java.util.List;

import domain.Attendance;
interface IAttendanceManager {

    public void addAttendance(Attendance attendance) throws SQLException, NumberFormatException;
    public void addAttendanceByParams(int group, int user, boolean isAdmin) throws SQLException, NumberFormatException;
    public void editAttendance(int oldAttendanceId, Attendance newAttendanceData) throws SQLException, NumberFormatException;
    public void editAttendanceByParams(int oldAttendanceId, int group, int user, boolean is_admin) throws SQLException, NumberFormatException;
    public void deleteAttendance(int attendanceId) throws SQLException;
    public Attendance getAttendance(int attendanceId) throws SQLException, NullPointerException;
    public List<Attendance> getAllAttendances() throws SQLException, NullPointerException;

}
