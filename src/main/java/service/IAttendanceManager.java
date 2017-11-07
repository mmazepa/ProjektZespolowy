
package service;
import domain.Attendance;
interface IAttendanceManager {

    public void addAttendance(Attendance attendance);
    public void editAttendance(int oldAttendanceId, Attendance newAttendanceData);
    public void deleteAttendance(int attendanceId);
    public void getAttendance(int attendanceId);
    public void getAllAttendances();

}
