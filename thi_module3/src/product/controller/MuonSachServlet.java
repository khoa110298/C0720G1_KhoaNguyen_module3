package product.controller;

import product.model.MuonSach;
import product.model.Sach;
import product.service.MuonSachService;
import product.service.MuonSachServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "MuonSachServlet",urlPatterns = "/muonsach")
public class MuonSachServlet extends HttpServlet {
    MuonSachService muonSachService = new MuonSachServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

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
                break;
            case "edit":
//                showEditProduct(request,response);
                break;
            case "delete":
                deleteMuonSach(request, response);
                break;
            default:
                listMuonSach(request, response);
                break;
        }
    }

    private void deleteMuonSach(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("mamuonsach"));
        try {
            muonSachService.deleteMuonSach(id);
            listMuonSach(request,response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void listMuonSach(HttpServletRequest request, HttpServletResponse response) {
        List<MuonSach> muonSachList = muonSachService.getAllMuonSach();
        request.setAttribute("muonSachList", muonSachList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("muonsach/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
