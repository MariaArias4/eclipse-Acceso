<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Listado de Vehiculos</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6f9;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 1000px;
            margin: 40px auto;
            background: white;
            padding: 25px 30px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
        }

        .links {
            text-align: center;
            margin-bottom: 20px;
        }

        .links a {
            text-decoration: none;
            color: #007bff;
            margin: 0 10px;
            font-size: 15px;
        }

        .links a:hover {
            text-decoration: underline;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }

        th {
            background: #007bff;
            color: white;
            padding: 10px;
            text-align: left;
        }

        td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }

        tr:hover {
            background: #f1f1f1;
        }

        .btn {
            padding: 6px 10px;
            border-radius: 5px;
            text-decoration: none;
            color: white;
            font-size: 14px;
            margin-right: 5px;
        }

        .edit {
            background: #28a745;
        }

        .edit:hover {
            background: #218838;
        }

        .delete {
            background: #dc3545;
        }

        .delete:hover {
            background: #b52a37;
        }
    </style>

</head>
<body>

    <div class="container">

        <h2>Gestion de Vehiculos</h2>

        <div class="links">
            <a href="VehiculoController?accion=nuevo">Agregar nuevo</a>
            <a href="VehiculoController?accion=dashboard">Ver estadisticas</a>
        </div>

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Marca</th>
                    <th>Modelo</th>
                    <th>Año</th>
                    <th>Matricula</th>
                    <th>Propietario</th>
                    <th>Acciones</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach var="v" items="${vehiculos}">
                    <tr>
                        <td>${v.id}</td>
                        <td>${v.marca}</td>
                        <td>${v.modelo}</td>
                        <td>${v.anio}</td>
                        <td>${v.matricula}</td>
                        <td>${v.nombrePropietarioAux}</td>

                        <td>
                            <a class="btn edit" href="VehiculoController?accion=editar&id=${v.id}">Editar</a>
                            <a class="btn delete" href="VehiculoController?accion=eliminar&id=${v.id}">Eliminar</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>

        </table>

    </div>

</body>
</html>