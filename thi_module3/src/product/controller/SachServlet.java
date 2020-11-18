package product.controller;

import product.model.Product;
import product.model.Sach;
import product.service.SachService;
import product.service.SachServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SachServlet", urlPatterns = "/sach")
public class SachServlet extends HttpServlet {
    SachService sachService = new SachServiceImpl();
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
                showCreateProduct(request, response);
                break;
            case "edit":
//                showEditProduct(request,response);
                break;
            case "delete":
//                showDeleteProduct(request, response);
                break;
            default:
                listSach(request, response);
                break;
        }
    }

    private void showCreateProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("sach/create.jsp");
        dispatcher.forward(request,response);
    }

    private void listSach(HttpServletRequest request, HttpServletResponse response) {
        List<Sach> sachList = sachService.getAllSach();
        request.setAttribute("sachList", sachList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("sach/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
