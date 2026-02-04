<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Formulario de Propietario</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6f9;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 450px;
            margin: 40px auto;
            background: white;
            padding: 25px 30px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        a {
            text-decoration: none;
            color: #007bff;
            font-size: 14px;
        }

        a:hover {
            text-decoration: underline;
        }

        .back {
            display: block;
            margin-bottom: 15px;
            text-align: center;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
            color: #444;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 15px;
        }

        button {
            width: 100%;
            margin-top: 25px;
            padding: 12px;
            background: #28a745;
            border: none;
            color: white;
            font-size: 16px;
            border-radius: 6px;
            cursor: pointer;
            transition: 0.2s;
        }

        button:hover {
            background: #218838;
        }
    </style>

</head>
<body>

    <div class="container">

        <h2>Gestion de Propietarios</h2>

        <a class="back" href="PropietarioController?accion=listar">Volver al listado</a>

        <form action="PropietarioController" method="post">

            <c:if test="${not empty propietario}">
                <input type="hidden" name="id" value="${propietario.id}">
            </c:if>

            <label>Nombre:</label>
            <input type="text" name="nombre" value="${propietario.nombre}" required>

            <label>Telefono:</label>
            <input type="text" name="telefono" value="${propietario.telefono}" required>

            <label>Direccion:</label>
            <input type="text" name="direccion" value="${propietario.direccion}" required>

            <button type="submit">Guardar</button>

        </form>

    </div>

</body>
</html>