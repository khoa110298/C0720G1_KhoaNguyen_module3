package employee.controller;

import customer.model.Customer;
import employee.model.Employee;
import employee.service.EmployeeService;
import employee.service.EmployeeServiceIml;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "EmployeeServlet",urlPatterns = "/employee")
public class EmployeeServlet extends HttpServlet {
    EmployeeService employeeService = new EmployeeServiceIml();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        if (action == null) {
            action = " ";
        }
        switch (action) {
            case "edit":
                editEmployee(request, response);
                break;
        }
    }

    private void editEmployee(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        String idCard = request.getParameter("idCard");
        double salary = Float.parseFloat(request.getParameter("salary"));
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int positionId = Integer.parseInt(request.getParameter("positionId"));
        int educationDegreeId = Integer.parseInt(request.getParameter("educationDegreeId"));
        int divisionId = Integer.parseInt(request.getParameter("divisionId"));
        String userName = request.getParameter("userName");
        try {
            employeeService.updataEmplyee(new Employee(id,name,birthday,idCard,salary,phone,email,address,positionId,educationDegreeId,divisionId,userName));
            listEmployee(request,response);
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
                createCustomerModal(request, response);
                break;
            case "edit":
                showEditStudent(request,response);
                break;
            case "delete":
                deleteCustomerModal(request, response);
                break;
            default:
                listEmployee(request, response);
                break;
        }
    }

    private void showEditStudent(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Employee employee = employeeService.selectEmplyee(id);
        request.setAttribute("employee", employee);
        RequestDispatcher dispatcher = request.getRequestDispatcher("employee/edit.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createCustomerModal(HttpServletRequest request, HttpServletResponse response) {
        int id = employeeService.getAllEmplyee().get(employeeService.getAllEmplyee().size()-1).getId()+1;
        String name = request.getParameter("nameEmployee");
        String birthday = request.getParameter("birthday");
        String idCard = request.getParameter("idCard");
        double salary = Float.parseFloat(request.getParameter("salary"));
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int positionId = Integer.parseInt(request.getParameter("positionId"));
        int educationDegreeId = Integer.parseInt(request.getParameter("educationDegreeId"));
        int divisionId = Integer.parseInt(request.getParameter("divisionId"));
        String userName = request.getParameter("userName");
        try {
            employeeService.insertEmplyee(new Employee(name,birthday,idCard,salary,phone,email,address,positionId,educationDegreeId,divisionId,userName));
            listEmployee(request,response);
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    private void deleteCustomerModal(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        try {
            employeeService.deleteEmplyee(id);
            listEmployee(request,response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void listEmployee(HttpServletRequest request, HttpServletResponse response) {
        List<Employee> employeeList = employeeService.getAllEmplyee();
        request.setAttribute("employeeList", employeeList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("employee/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
