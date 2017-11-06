package mypackage;

interface IUserManager {

    public void addUser(User user);
    public void editUser(int oldUserId, User newUserData);
    public void deleteUser(int userId);
    public void getUser(int userId);
    public void getAllUsers();

}
