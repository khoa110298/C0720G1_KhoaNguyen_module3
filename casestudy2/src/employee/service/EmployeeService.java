package employee.service;

import employee.model.Employee;

import java.sql.SQLException;
import java.util.List;

public interface EmployeeService {
    List<Employee> getAllEmplyee();
    void insertEmplyee(Employee emplyee) throws SQLException;
    List<Employee> searchEmplyeeByName(String name);
    boolean deleteEmplyee(int id) throws SQLException;
    boolean updataEmplyee(Employee emplyee)throws SQLException;
    Employee selectEmplyee(int id);
}
