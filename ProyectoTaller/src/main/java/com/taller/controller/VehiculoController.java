package com.taller.controller;

import com.taller.dao.VehiculoDAO;
import com.taller.dao.PropietarioDAO;
import com.taller.model.Vehiculo;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/VehiculoController")
public class VehiculoController extends HttpServlet {

    VehiculoDAO dao = new VehiculoDAO();
    PropietarioDAO daoProp = new PropietarioDAO();

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
                request.setAttribute("listaPropietarios", daoProp.listar());
                request.getRequestDispatcher("form-vehiculo.jsp").forward(request, response);
                break;

            case "editar":
                int idEdit = Integer.parseInt(request.getParameter("id"));
                Vehiculo veh = dao.listarPorId(idEdit);

                request.setAttribute("vehiculo", veh);
                request.setAttribute("listaPropietarios", daoProp.listar());
                request.getRequestDispatcher("form-vehiculo.jsp").forward(request, response);
                break;

            case "eliminar":
                int idDel = Integer.parseInt(request.getParameter("id"));
                dao.eliminar(idDel);
                listar(request, response);
                break;

            case "dashboard":
                mostrarDashboard(request, response);
                break;

            default:
                listar(request, response);
        }
    }

    private void listar(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        List<Vehiculo> lista = dao.listarTodoInfoCompleta();
        req.setAttribute("vehiculos", lista);
        req.getRequestDispatcher("lista-vehiculos.jsp").forward(req, resp);
    }

    private void mostrarDashboard(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setAttribute("total", dao.getTotalVehiculos());
        req.setAttribute("antiguos", dao.get5MasAntiguos());
        req.getRequestDispatcher("dashboard.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Recoger datos del formulario
        String idStr = request.getParameter("id");
        String matricula = request.getParameter("matricula");
        String marca = request.getParameter("marca");
        String modelo = request.getParameter("modelo");
        int anio = Integer.parseInt(request.getParameter("anio"));
        int idProp = Integer.parseInt(request.getParameter("idPropietario"));

        Vehiculo v = new Vehiculo();
        v.setMatricula(matricula);
        v.setMarca(marca);
        v.setModelo(modelo);
        v.setAnio(anio);
        v.setIdPropietario(idProp);

        // Crear o editar según corresponda
        if (idStr == null || idStr.isEmpty()) {
            dao.agregar(v);
        } else {
            v.setId(Integer.parseInt(idStr));
            dao.editar(v);
        }

        response.sendRedirect("VehiculoController?accion=listar");
    }
}