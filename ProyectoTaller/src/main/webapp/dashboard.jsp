<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>

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
            padding: 30px 35px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 25px;
        }

        .card {
            background: #007bff;
            color: white;
            padding: 20px;
            border-radius: 8px;
            text-align: center;
            margin-bottom: 30px;
            font-size: 18px;
        }

        h3 {
            color: #333;
            margin-bottom: 15px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
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

        a {
            display: block;
            margin-top: 25px;
            text-align: center;
            text-decoration: none;
            background: #28a745;
            color: white;
            padding: 12px;
            border-radius: 6px;
            font-size: 16px;
            transition: 0.2s;
        }

        a:hover {
            background: #218838;
        }
    </style>

</head>
<body>

    <div class="container">

        <h1>Dashboard</h1>

        <div class="card">
            Total de Vehiculos Registrados: ${total}
        </div>

        <h3>Top 5 Vehiculos mas antiguos</h3>

        <table>
            <thead>
                <tr>
                    <th>Marca</th>
                    <th>Modelo</th>
                    <th>Anio</th>
                    <th>Matricula</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach var="v" items="${antiguos}">
                    <tr>
                        <td>${v.marca}</td>
                        <td>${v.modelo}</td>
                        <td>${v.anio}</td>
                        <td>${v.matricula}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <a href="VehiculoController?accion=listar">Volver al listado</a>

    </div>

</body>
</html>