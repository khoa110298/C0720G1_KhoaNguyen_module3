package product.repository;

import product.model.Product;

import java.sql.SQLException;
import java.util.List;

public interface ProductRepository {
    List<Product> getAllProduct();
    void insertProduct(Product product) throws SQLException;
    List<Product> searchProductByName(String name);
    boolean deleteProduct(int id) throws SQLException;
    boolean updateProduct(Product product) throws SQLException;
    Product selectProduct(int id);
}
