<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector" %>
<%@ page import="DbEsame.Product" %>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Visualizza Prodotti</title>
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
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px auto;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #007bff; /* Blu */
            color: #fff;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        p.message {
            text-align: center;
            color: #dc3545; /* Rosso */
            font-weight: bold;
        }
        form {
            text-align: center;
            margin-top: 20px;
        }
        input[type="submit"] {
            padding: 10px 20px;
            background-color: #007bff; /* Blu */
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #0056b3; /* Blu più scuro al passaggio del mouse */
        }
    </style>
</head>
<body>
    <h1>Prodotti</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Marca</th>
            <th>Provenienza</th>
            <th>Prezzo</th>
        </tr>
        <% 
            Vector<Product> products = (Vector<Product>) request.getAttribute("products");
            if (products != null) {
                for (int i = 0; i < products.size(); i++) {
                    Product product = products.get(i);
        %>
            <tr>
                <td><%= product.getId() %></td>
                <td><%= product.getName() %></td>
                <td><%= product.getBrand() %></td>
                <td><%= product.getMadein() %></td>
                <td><%= product.getPrice() %></td>
            </tr>
        <% 
                }
            }
        %>
    </table>
    <p class="message">${message}</p>
    
    <form action="index.jsp">
        <input type="submit" value="Torna alla pagina di scelta">
    </form>
</body>
</html>