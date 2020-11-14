package customer.service;

import customer.model.Customer;

import java.sql.SQLException;
import java.util.List;

public interface CustomerService {
    List<Customer> getAllCustomer();
    void insertCustomer(Customer customer) throws SQLException;
    List<Customer> searchCustomerByName(String name);
    boolean deleteCustomer(int id) throws SQLException;
    boolean updataCustomer(Customer customer)throws SQLException;
    Customer selectCustomer(int id);
}
