package product.service;

import product.model.BenhNhan;
import product.repository.BenhNhanRepository;
import product.repository.BenhNhanRepositoryImpl;

import java.util.List;

public class BenhNhanServiceImpl implements BenhNhanService {
    BenhNhanRepository benhNhanService = new BenhNhanRepositoryImpl();

    @Override
    public List<BenhNhan> getAllBenhNhan() {
        return benhNhanService.getAllBenhNhan();
    }
}
