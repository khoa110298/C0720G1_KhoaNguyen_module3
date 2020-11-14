package employee.service;

import employee.model.Employee;
import employee.repository.EmployeeDao;
import employee.repository.EmployeeDaoIml;

import java.sql.SQLException;
import java.util.List;

public class EmployeeServiceIml implements EmployeeService {
    EmployeeDao employeeDao = new EmployeeDaoIml();
    @Override
    public List<Employee> getAllEmplyee() {
        return employeeDao.getAllEmplyee();
    }

    @Override
    public void insertEmplyee(Employee emplyee) throws SQLException {
        employeeDao.insertEmplyee(emplyee);
    }

    @Override
    public List<Employee> searchEmplyeeByName(String name) {
        return employeeDao.searchEmplyeeByName(name);
    }

    @Override
    public boolean deleteEmplyee(int id) throws SQLException {
        return employeeDao.deleteEmplyee(id);
    }

    @Override
    public boolean updataEmplyee(Employee emplyee) throws SQLException {
        return employeeDao.updataEmplyee(emplyee);
    }

    @Override
    public Employee selectEmplyee(int id) {
        return employeeDao.selectEmplyee(id);
    }
}
