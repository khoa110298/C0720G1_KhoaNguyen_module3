package dao;

import home.KhachHang;

import java.util.ArrayList;
import java.util.List;

public class CustomerDao {
    private static List<KhachHang> khachHangList = new ArrayList<>();

    public static List<KhachHang> getKhachHang(){
        khachHangList.add(new KhachHang("Nguyễn Văn A","12/12/1999","Đà Nẵng","anh/anh1.jpg"));
        khachHangList.add(new KhachHang("Nguyễn Văn B","12/12/1999","Đà Nẵng","anh/che-do-lam-dep-1595200073627.jpg"));
        khachHangList.add(new KhachHang("Nguyễn Văn C","12/12/1999","Đà Nẵng","anh/huyen-anh.jpg"));
        khachHangList.add(new KhachHang("Nguyễn Văn D","12/12/1999","Đà Nẵng","anh/tram-anh-1.jpg"));
        return khachHangList;
    }
}
