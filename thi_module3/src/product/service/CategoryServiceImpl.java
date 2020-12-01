package product.service;

import product.model.Category;
import product.repository.CategoryRepository;
import product.repository.CategoryRepositoryImpl;

import java.util.List;

public class CategoryServiceImpl implements CategoryService {
    CategoryRepository categoryRepository = new CategoryRepositoryImpl();
    @Override
    public List<Category> getAllCategory() {
        return categoryRepository.getAllCategory();
    }
}
