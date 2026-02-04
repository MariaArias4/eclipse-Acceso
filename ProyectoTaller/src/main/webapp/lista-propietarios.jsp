<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Listado de Propietarios</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6f9;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 900px;
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

        <h2>Gestion de Propietarios</h2>

        <div class="links">
            <a href="PropietarioController?accion=nuevo">Agregar nuevo</a>
            <a href="VehiculoController?accion=listar">Ver vehiculos</a>
        </div>

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Telefono</th>
                    <th>Direccion</th>
                    <th>Acciones</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach var="p" items="${propietarios}">
                    <tr>
                        <td>${p.id}</td>
                        <td>${p.nombre}</td>
                        <td>${p.telefono}</td>
                        <td>${p.direccion}</td>
                        <td>
                            <a class="btn edit" href="PropietarioController?accion=editar&id=${p.id}">Editar</a>
                            <a class="btn delete" href="PropietarioController?accion=eliminar&id=${p.id}">Eliminar</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>

        </table>

    </div>

</body>
</html>