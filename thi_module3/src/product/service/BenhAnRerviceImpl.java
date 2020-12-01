package product.service;

import product.model.BenhAn;
import product.repository.BenhAnRepository;
import product.repository.BenhAnRepositoryIMpl;

import java.util.List;

public class BenhAnRerviceImpl implements BenhAnRervice {
    BenhAnRepository benhAnRepository = new BenhAnRepositoryIMpl();
    @Override
    public List<BenhAn> getAllBenhAn() {
        return benhAnRepository.getAllBenhAn();
    }
}
