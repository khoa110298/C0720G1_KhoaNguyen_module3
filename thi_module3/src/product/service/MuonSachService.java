package product.service;

import product.model.MuonSach;

import java.sql.SQLException;
import java.util.List;

public interface MuonSachService {
    List<MuonSach> getAllMuonSach();
    void insertMuonSach(MuonSach muonSach) throws SQLException;
    boolean deleteMuonSach(int id) throws SQLException;
}
