package product.model;

public class BenhAn {
    private String idBenhAn;
    private String tenBenhAn;

    public BenhAn() {
    }

    public BenhAn(String idBenhAn, String tenBenhAn) {
        this.idBenhAn = idBenhAn;
        this.tenBenhAn = tenBenhAn;
    }

    public String getIdBenhAn() {
        return idBenhAn;
    }

    public void setIdBenhAn(String idBenhAn) {
        this.idBenhAn = idBenhAn;
    }

    public String getTenBenhAn() {
        return tenBenhAn;
    }

    public void setTenBenhAn(String tenBenhAn) {
        this.tenBenhAn = tenBenhAn;
    }
}
