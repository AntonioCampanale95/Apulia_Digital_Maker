<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Elimina Prodotto</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        form {
            max-width: 400px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        label {
            display: block;
            margin-bottom: 10px;
            color: #333;
        }
        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #dc3545; /* Rosso */
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #c82333; /* Rosso più scuro al passaggio del mouse */
        }
        p.message {
            text-align: center;
            color: #dc3545; /* Rosso */
            font-weight: bold;
        }
    </style>
</head>
<body>
    <h1>Elimina Prodotto</h1>
    <form action="DbEsameServlet" method="post">
        <input type="hidden" name="action" value="delete">
        <label for="id">ID del Prodotto da Eliminare:</label>
        <input type="text" name="id" id="id">
        <input type="submit" value="Elimina">
    </form>
    <p class="message">${message}</p>
    <form action="index.jsp">
        <input type="submit" value="Torna alla pagina di scelta">
    </form>
</body>
</html>