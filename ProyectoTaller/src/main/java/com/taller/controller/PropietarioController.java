package com.taller.controller;

import com.taller.dao.PropietarioDAO;
import com.taller.model.Propietario;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/PropietarioController")
public class PropietarioController extends HttpServlet {

    PropietarioDAO dao = new PropietarioDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");

        if (accion == null || accion.isEmpty()) {
            listar(request, response);
            return;
        }

        switch (accion) {

            case "listar":
                listar(request, response);
                break;

            case "nuevo":
                request.getRequestDispatcher("form-propietario.jsp").forward(request, response);
                break;

            case "editar":
                int idEdit = Integer.parseInt(request.getParameter("id"));
                Propietario p = dao.listarPorId(idEdit);

                request.setAttribute("propietario", p);
                request.getRequestDispatcher("form-propietario.jsp").forward(request, response);
                break;

            case "eliminar":
                int idDel = Integer.parseInt(request.getParameter("id"));
                dao.eliminar(idDel);
                listar(request, response);
                break;

            default:
                listar(request, response);
        }
    }

    private void listar(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        List<Propietario> lista = dao.listar();
        req.setAttribute("propietarios", lista);
        req.getRequestDispatcher("lista-propietarios.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Recoger datos del formulario
        String idStr = request.getParameter("id");
        String nombre = request.getParameter("nombre");
        String telefono = request.getParameter("telefono");
        String direccion = request.getParameter("direccion");

        Propietario p = new Propietario();
        p.setNombre(nombre);
        p.setTelefono(telefono);
        p.setDireccion(direccion);

        // Crear o editar según corresponda
        if (idStr == null || idStr.isEmpty()) {
            dao.agregar(p);
        } else {
            p.setId(Integer.parseInt(idStr));
            dao.editar(p);
        }

        response.sendRedirect("PropietarioController?accion=listar");
    }
}