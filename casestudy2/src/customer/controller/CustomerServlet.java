package customer.controller;

import customer.common.DateException;
import customer.common.EmailException;
import customer.common.PhoneException;
import customer.common.Valtdate;
import customer.model.Customer;
import customer.service.CustomerService;
import customer.service.CustomerServiceIml;
import customer.service.CustomerTypeService;
import customer.service.CustomerTypeServiceTypeImpl;

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

@WebServlet(name = "CustomerServlet", urlPatterns = "/customer")
public class CustomerServlet extends HttpServlet {
    CustomerService customerService = new CustomerServiceIml();
    CustomerTypeService customerTypeService = new CustomerTypeServiceTypeImpl();
    Valtdate valtdate = new Valtdate();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");


        String action = request.getParameter("action");
        if (action == null) {
            action = " ";
        }
        try {
            switch (action) {
                case "create":
                    CreateCustomer(request, response);
                    break;
                case "search": {
                    findCustomerByName(request, response);
                    break;
                }
                case "edit":
                    editCustomerModal(request, response);
                    break;
                case "delete":
                    deleteCustomer(request, response);
                    break;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        customerService.deleteCustomer(id);
        listCustomer(request,response);
    }

    private void findCustomerByName(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customerList = new ArrayList<>();
        String name = request.getParameter("name");
        customerList = customerService.searchCustomerByName(name);
        request.setAttribute("customerList", customerList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/search.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void CreateCustomer(HttpServletRequest request, HttpServletResponse response) throws SQLException {
//        int id = customerService.getAllCustomer().get(customerService.getAllCustomer().size() - 1).getId() + 1;
//        int typeId = Integer.parseInt(request.getParameter("typeId"));
//        String name = request.getParameter("name");
//        String birthday = request.getParameter("birthday");
//        int gender = Integer.parseInt(request.getParameter("gender"));
//        String idCard = request.getParameter("idCard");
//        String phone = request.getParameter("phone");
//        String email = request.getParameter("email");
//        String address = request.getParameter("address");
//        customerService.insertCustomer(new Customer(id, typeId, name, birthday, gender, idCard, phone, email, address));
//        listCustomer(request, response);

        boolean check = true;
        String messagePhone= null;
        String messageBirthDay = null;
        String messageEmail = null;
        String a = "crearte thanh cong";

        int id = customerService.getAllCustomer().get(customerService.getAllCustomer().size() - 1).getId() + 1;
        int typeId = Integer.parseInt(request.getParameter("typeId"));
        String name = request.getParameter("name");
        String birthday = null;
        try {
            birthday = request.getParameter("birthday");
            valtdate.regexDate(birthday);
        } catch (DateException e) {
           messageBirthDay = e.getMessage();
           check = false;
        }

        int gender = Integer.parseInt(request.getParameter("gender"));
        String idCard = request.getParameter("idCard");
        String phone = null;
        try {
             phone = request.getParameter("phone");
             valtdate.regexPhone(phone);
        } catch (PhoneException e) {
            messagePhone = e.getMessage();
            check = false;
        }

        String email = null;
        try {
            email = request.getParameter("email");
            valtdate.regexEmail(email);
        } catch (EmailException e) {
           messageEmail = e.getMessage();
           check = false;
        }
        String address = request.getParameter("address");

        if (!check){
            request.setAttribute("typeId", typeId);
            request.setAttribute("name", name);
            request.setAttribute("birthday",birthday);
            request.setAttribute("gender",gender);
            request.setAttribute("idCard",idCard);
            request.setAttribute("phone",phone);
            request.setAttribute("email",email);
            request.setAttribute("address",address);

            request.setAttribute("messageBirthDay",messageBirthDay);
            request.setAttribute("messagePhone",messagePhone);
            request.setAttribute("messageEmail",messageEmail);
            showCreateCustomer(request,response);
        }else {
            customerService.insertCustomer(new Customer(id, typeId, name, birthday, gender, idCard, phone, email, address));
            request.setAttribute("thanhcong","update thanh cong");
            listCustomer(request, response);
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
                showCreateCustomer(request, response);
                break;
            case "edit":
//                showEditStudent(request,response);
                break;
            case "delete":
                    showDeleteCustomer(request, response);
                break;
            default:
                listCustomer(request, response);
                break;
        }

    }

    private void showDeleteCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = customerService.selectCustomer(id);
        request.setAttribute("customer",customer);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/delete.jsp");
        dispatcher.forward(request,response);
    }


    private void editCustomerModal(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        int typeId = Integer.parseInt(request.getParameter("typeId"));
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        int gender = Integer.parseInt(request.getParameter("gender"));
        String idCard = request.getParameter("idCard");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        customerService.updataCustomer(new Customer(id, typeId, name, birthday, gender, idCard, phone, email, address));
        listCustomer(request, response);
    }

    private void listCustomer(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customerList = customerService.getAllCustomer();
        request.setAttribute("customerList", customerList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void showCreateCustomer(HttpServletRequest request, HttpServletResponse response) {
        customerTypeService.getAllCustomerType();
        request.setAttribute("customerTypeList", customerTypeService.getAllCustomerType());
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

