package product.service;

import product.model.MuonSach;
import product.repository.MuonSachRepository;
import product.repository.MuonSachRepositoryImpl;

import java.sql.SQLException;
import java.util.List;

public class MuonSachServiceImpl implements MuonSachService {
    MuonSachRepository muonSachRepository = new MuonSachRepositoryImpl();
    @Override
    public List<MuonSach> getAllMuonSach() {
        return muonSachRepository.getAllMuonSach();
    }

    @Override
    public void insertMuonSach(MuonSach muonSach) throws SQLException {
        muonSachRepository.insertMuonSach(muonSach);
    }

    @Override
    public boolean deleteMuonSach(int id) throws SQLException {
        return muonSachRepository.deleteMuonSach(id);
    }
}
