package customer.service;

import customer.model.Customer;
import customer.repository.CustomerDao;
import customer.repository.CustomerDaoIml;

import java.sql.SQLException;
import java.util.List;

public class CustomerServiceIml implements CustomerService {
    CustomerDao customerDao = new CustomerDaoIml();
    @Override
    public List<Customer> getAllCustomer() {
        return customerDao.getAllCustomer();
    }

    @Override
    public void insertCustomer(Customer customer) throws SQLException {
        customerDao.insertCustomer(customer);
    }

    @Override
    public List<Customer> searchCustomerByName(String name) {
        return customerDao.searchCustomerByName(name);
    }

    @Override
    public boolean deleteCustomer(int id) throws SQLException {
        return customerDao.deleteCustomer(id);
    }

    @Override
    public boolean updataCustomer(Customer customer) throws SQLException {
        return customerDao.updataCustomer(customer);
    }

    @Override
    public Customer selectCustomer(int id) {
        return customerDao.selectCustomer(id);
    }
}
