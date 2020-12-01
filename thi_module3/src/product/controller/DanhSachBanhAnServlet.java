package product.controller;

import product.model.DanhSachBenhAn;
import product.model.Product;
import product.service.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductServlet", urlPatterns = "/danhsachbenhan")
public class DanhSachBanhAnServlet extends HttpServlet {
    ProductService productService = new ProductServiceImpl();
    CategoryService categoryService = new CategoryServiceImpl();
    DanhSachBenhAnService danhSachBenhAnService = new DanhSachBenhAnServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        if (action == null) {
            action = " ";
        }

            switch (action) {
                case "create":
//                    CreateProduct(request, response);
//                    break;
                case "search": {
//                    findProductByName(request, response);
//                    break;
                }
                case "edit":
                    editProduct(request,response);
//                    editProductModal(request, response);
                    break;
                case "delete":
//                    deleteProduct(request, response);
//                deleteProductModal(request, response);
                    break;

        }


    }

    private void findProductByName(HttpServletRequest request, HttpServletResponse response) {
        List<Product> productList = new ArrayList<>();
        String name = request.getParameter("name");
        productList = productService.searchProductByName(name);
        request.setAttribute("productList", productList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/search.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void editProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String idBenhAn = request.getParameter("idBenhAn");
        String idBenhNhan = request.getParameter("idBenhNhan");
        String tenBenhNhan = request.getParameter("tenBenhNhan");
        String ngayNhapVien = request.getParameter("ngayNhapVien");
        String ngayRaVen = request.getParameter("ngayRaVen");
        String lyDo = request.getParameter("lyDo");
        try {
            danhSachBenhAnService.updateDanhSachBenhAn(new DanhSachBenhAn(id,idBenhAn,idBenhNhan,tenBenhNhan,ngayNhapVien,ngayRaVen,lyDo));
            listProduct(request,response);
            request.setAttribute("thanhcong","cap nhap thanh cong");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        productService.deleteProduct(id);
        listProduct(request,response);
    }

    private void CreateProduct(HttpServletRequest request, HttpServletResponse response) {
        String nameProduct = request.getParameter("name");
        String price = request.getParameter("price");
        int categoryID = Integer.parseInt(request.getParameter("categoryId"));
        try {
            productService.insertProduct(new Product(nameProduct,price,categoryID));
            listProduct(request,response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        if (action == null) {
            action = " ";
        }
        switch (action) {
            case "create":
//                showCreateProduct(request, response);
//                break;
            case "edit":
                showEditDanhDanhBenhAn(request,response);
//                break;
            case "delete":
                DeleteProduct(request, response);
                break;
            default:
                listProduct(request, response);
                break;
        }

    }

    private void showEditDanhDanhBenhAn(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        DanhSachBenhAn danhSachBenhAn = danhSachBenhAnService.selectDanhSachBenhAn(id);
        request.setAttribute("danhSachBenhAn", danhSachBenhAn);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/edit.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void DeleteProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        try {
            danhSachBenhAnService.deleteDanhSachBenhAnt(id);
            request.setAttribute("thanhcong","xoa thanh cong");
            listProduct(request,response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void showEditProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        DanhSachBenhAn danhSachBenhAn = danhSachBenhAnService.selectDanhSachBenhAn(id);
        request.setAttribute("danhSachBenhAn", danhSachBenhAn);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/edit.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showDeleteProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.selectProduct(id);
        request.setAttribute("product",product);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/delete.jsp");
        dispatcher.forward(request,response);
    }

    private void showCreateProduct(HttpServletRequest request, HttpServletResponse response) {
        categoryService.getAllCategory();
        request.setAttribute("categoryList",categoryService.getAllCategory());
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/create.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void listProduct(HttpServletRequest request, HttpServletResponse response) {
        List<DanhSachBenhAn> danhSachBenhAnList = danhSachBenhAnService.getAllDanhSachBenhAn();
        request.setAttribute("productList", danhSachBenhAnList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
