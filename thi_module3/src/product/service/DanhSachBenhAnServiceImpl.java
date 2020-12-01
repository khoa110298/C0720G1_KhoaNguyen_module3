package product.service;

import product.model.DanhSachBenhAn;
import product.repository.DanhSachBenhAnRepository;
import product.repository.DanhSachBenhAnRepositoryImpl;

import java.sql.SQLException;
import java.util.List;

public class DanhSachBenhAnServiceImpl implements DanhSachBenhAnService {
    DanhSachBenhAnRepository danhSachBenhAnRepository = new DanhSachBenhAnRepositoryImpl();

    @Override
    public List<DanhSachBenhAn> getAllDanhSachBenhAn() {
        return danhSachBenhAnRepository.getAllDanhSachBenhAn();
    }

    @Override
    public boolean deleteDanhSachBenhAnt(int id) throws SQLException {
        return danhSachBenhAnRepository.deleteDanhSachBenhAnt(id);
    }

    @Override
    public boolean updateDanhSachBenhAn(DanhSachBenhAn danhSachBenhAn) throws SQLException {
        return danhSachBenhAnRepository.updateDanhSachBenhAn(danhSachBenhAn);
    }

    @Override
    public DanhSachBenhAn selectDanhSachBenhAn(int id) {
        return danhSachBenhAnRepository.selectDanhSachBenhAn(id);
    }
}
