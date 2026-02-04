<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Taller Mecanico - Inicio</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6f9;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 500px;
            margin: 60px auto;
            background: white;
            padding: 30px 35px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            text-align: center;
        }

        h1 {
            color: #333;
            margin-bottom: 15px;
        }

        p {
            color: #555;
            margin-bottom: 25px;
            font-size: 16px;
        }

        ul {
            list-style: none;
            padding: 0;
        }

        li {
            margin: 12px 0;
        }

        a {
            display: block;
            padding: 12px;
            background: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-size: 16px;
            transition: 0.2s;
        }

        a:hover {
            background: #0056b3;
        }
    </style>

</head>
<body>

    <div class="container">

        <h1>Taller Mecanico</h1>

        <p>Seleccione una opcion para comenzar:</p>

        <ul>
            <li><a href="VehiculoController?accion=listar">Gestion de Vehiculos</a></li>
            <li><a href="PropietarioController?accion=listar">Gestion de Propietarios</a></li>
            <li><a href="VehiculoController?accion=dashboard">Estadisticas del Taller</a></li>
        </ul>

    </div>

</body>
</html>