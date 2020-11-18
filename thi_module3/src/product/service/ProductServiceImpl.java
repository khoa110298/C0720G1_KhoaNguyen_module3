package product.service;

import product.model.Product;
import product.repository.ProductRepository;
import product.repository.ProductRepositoryImpl;

import java.sql.SQLException;
import java.util.List;

public class ProductServiceImpl implements ProductService {
    ProductRepository productRepository = new ProductRepositoryImpl();
    @Override
    public List<Product> getAllProduct() {
        return productRepository.getAllProduct();
    }

    @Override
    public void insertProduct(Product product) throws SQLException {
        productRepository.insertProduct(product);
    }

    @Override
    public List<Product> searchProductByName(String name) {
        return productRepository.searchProductByName(name);
    }

    @Override
    public boolean deleteProduct(int id) throws SQLException {
        return productRepository.deleteProduct(id);
    }

    @Override
    public boolean updateProduct(Product product) throws SQLException {
        return productRepository.updateProduct(product);
    }

    @Override
    public Product selectProduct(int id) {
        return productRepository.selectProduct(id);
    }
}
