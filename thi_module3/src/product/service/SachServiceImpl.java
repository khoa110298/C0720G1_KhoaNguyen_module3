package product.service;

import product.model.Category;
import product.model.Sach;
import product.repository.SachRepository;
import product.repository.SachRepositoryImpl;

import java.util.List;

public class SachServiceImpl implements SachService {
    SachRepository sachRepository = new SachRepositoryImpl();

    @Override
    public List<Sach> getAllSach() {
        return sachRepository.getAllSach();
    }
}
