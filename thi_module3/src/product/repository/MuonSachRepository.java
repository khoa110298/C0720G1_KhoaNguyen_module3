package product.repository;

import product.model.MuonSach;
import product.model.Product;

import java.sql.SQLException;
import java.util.List;

public interface MuonSachRepository {
    List<MuonSach> getAllMuonSach();
    void insertMuonSach(MuonSach muonSach) throws SQLException;
    boolean deleteMuonSach(int id) throws SQLException;
}
