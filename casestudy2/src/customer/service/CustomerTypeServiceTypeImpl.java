package customer.service;

import customer.model.CustomerType;
import customer.repository.CustomerTypeRepository;
import customer.repository.CustomerTypeRepositoryImpl;

import java.util.List;

public class CustomerTypeServiceTypeImpl implements CustomerTypeService {
    CustomerTypeRepository customerTypeRepository = new CustomerTypeRepositoryImpl();
    @Override
    public List<CustomerType> getAllCustomerType() {
        return customerTypeRepository.getAllCustomerType();
    }
}
