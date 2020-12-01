package product.repository;

import product.model.DanhSachBenhAn;
import product.model.Product;

import java.sql.SQLException;
import java.util.List;

public interface DanhSachBenhAnRepository {
    List<DanhSachBenhAn> getAllDanhSachBenhAn();
    boolean deleteDanhSachBenhAnt(int id) throws SQLException;
    boolean updateDanhSachBenhAn(DanhSachBenhAn danhSachBenhAn) throws SQLException;
    DanhSachBenhAn selectDanhSachBenhAn(int id);
}
