package product.repository;

import product.model.Category;
import product.model.MuonSach;
import product.model.Sach;

import java.sql.SQLException;
import java.util.List;

public interface SachRepository {
    List<Sach> getAllSach();
    void insertMuonSach(MuonSach muonSach) throws SQLException;
}
