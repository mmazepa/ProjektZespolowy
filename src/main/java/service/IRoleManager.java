package service;
import java.sql.SQLException;
import java.util.List;

import domain.Role;
interface IRoleManager {

    public void addRole(Role role) throws SQLException, NumberFormatException;
    public void editRole(int oldRoleId, Role newRoleData) throws SQLException, NumberFormatException;
    public void deleteRole(int roleId) throws SQLException;
    public Role getRole(int roleId) throws SQLException, NullPointerException;
    public List<Role> getAllRoles() throws SQLException, NullPointerException;

}
