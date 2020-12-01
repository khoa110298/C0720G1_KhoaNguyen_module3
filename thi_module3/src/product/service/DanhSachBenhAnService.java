package product.service;

import product.model.DanhSachBenhAn;

import java.sql.SQLException;
import java.util.List;

public interface DanhSachBenhAnService {
    List<DanhSachBenhAn> getAllDanhSachBenhAn();
    boolean deleteDanhSachBenhAnt(int id) throws SQLException;
    boolean updateDanhSachBenhAn(DanhSachBenhAn danhSachBenhAn) throws SQLException;
    DanhSachBenhAn selectDanhSachBenhAn(int id);
}
