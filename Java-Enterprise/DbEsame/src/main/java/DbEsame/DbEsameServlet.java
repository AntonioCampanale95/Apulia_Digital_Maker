package DbEsame;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DbEsameServlet")
public class DbEsameServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    public DbEsameServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if ("add".equals(action)) {
            aggiungiProdotto(request, response);
        } else if ("delete".equals(action)) {
            eliminaProdotto(request, response);
        }
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        visualizzaProdotti(request, response);
    }

    protected void aggiungiProdotto(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String brand = request.getParameter("brand");
        String madein = request.getParameter("madein");
        double price = Double.parseDouble(request.getParameter("price"));

        Product product = new Product(0, name, brand, madein, price);
        ProductDAO productDAO = ProductDAO.getInstance();
        productDAO.inserisciProdotto(product);
        request.setAttribute("message", "Prodotto aggiunto con successo.");
        request.getRequestDispatcher("/inserisci.jsp").forward(request, response);
    }

    protected void visualizzaProdotti(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductDAO productDAO = ProductDAO.getInstance();
        Vector<Product> products = productDAO.getProducts();
        request.setAttribute("products", products);
        request.getRequestDispatcher("/visualizza.jsp").forward(request, response);
    }

    protected void eliminaProdotto(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("id"));
        ProductDAO productDAO = ProductDAO.getInstance();
        boolean isDeleted = productDAO.eliminaProdotto(productId);
        if (isDeleted) {
            request.setAttribute("message", "Prodotto eliminato con successo");
        } else {
            request.setAttribute("message", "Errore nell'eliminazione del prodotto");
        }
        request.getRequestDispatcher("/elimina.jsp").forward(request, response);
    }
}