package service;

import dao.IUserDAO;
import dao.UserDAO;
import model.User;

import java.sql.SQLException;
import java.util.List;

public class UserService implements IUserService{
    IUserDAO iUserDAO = new UserDAO();
    @Override
    public void insertUser(User user) throws SQLException {
        iUserDAO.insertUser(user);
    }

    @Override
    public User selectUser(int id) {
        return iUserDAO.selectUser(id);
    }

    @Override
    public List<User> selectAllUsers() {
        return iUserDAO.selectAllUsers();
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        return iUserDAO.deleteUser(id);
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        return iUserDAO.updateUser(user);
    }

    @Override
    public List<User> findByCountry(String country) {
        return iUserDAO.findByCountry(country);
    }

    @Override
    public User getUserById(int id) {
        return iUserDAO.getUserById(id);
    }

    @Override
    public void insertUserStore(User user) throws SQLException {
        iUserDAO.insertUserStore(user);
    }
}
