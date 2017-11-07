package service;
import domain.Role;
interface IRoleManager {

    public void addRole(Role role);
    public void editRole(int oldRoleId, Role newRoleData);
    public void deleteRole(int roleId);
    public void getRole(int roleId);
    public void getAllRoles();

}
