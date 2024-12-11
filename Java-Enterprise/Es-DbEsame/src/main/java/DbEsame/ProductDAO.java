package DbEsame;

import java.sql.*;
import java.util.Vector;

public class ProductDAO extends TestDAODbEsame {
    
    private static final ProductDAO instance = new ProductDAO();
    
    private ProductDAO() {}

    public static ProductDAO getInstance() {
        return instance;
    }
    
    
    public Product inserisciProdotto(Product product) {
        try (Connection conn = getConnection();
             PreparedStatement preparedStatement = conn.prepareStatement(
                     "INSERT INTO product (name, brand, madein, price) VALUES (?, ?, ?, ?)",
                     Statement.RETURN_GENERATED_KEYS)) {
            
            preparedStatement.setString(1, product.getName());
            preparedStatement.setString(2, product.getBrand());
            preparedStatement.setString(3, product.getMadein());
            preparedStatement.setDouble(4, product.getPrice());
            
            int row = preparedStatement.executeUpdate();
    
            try (ResultSet res = preparedStatement.getGeneratedKeys()) {
                if (res.next()) {
                    product.setId(res.getInt(1));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Puoi anche lanciare un'eccezione personalizzata per gestire l'errore in un altro livello
        }
        return product;
    }
    
    
    public Vector<Product> getProducts() {
        Vector<Product> allProduct = new Vector<>();
        try (Connection conn = getConnection();
             Statement state = conn.createStatement();
             ResultSet res = state.executeQuery("SELECT id, name, brand, madein, price FROM product")) {
            
            while (res.next()) {
                Product product = new Product(
                        res.getInt("id"),
                        res.getString("name"),
                        res.getString("brand"),
                        res.getString("madein"),
                        res.getDouble("price")
                );
                allProduct.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Puoi anche lanciare un'eccezione personalizzata per gestire l'errore in un altro livello
        }
        
        return allProduct;
    }
    

public boolean eliminaProdotto(int id) {
    String deleteSQL = "DELETE FROM product WHERE id = ?";
    
    try (Connection conn = getConnection();
         PreparedStatement preparedStatement = conn.prepareStatement(deleteSQL)) {
        
        preparedStatement.setInt(1, id);
        
        int rowsAffected = preparedStatement.executeUpdate();
        return rowsAffected > 0;  // Restituisce true se almeno una riga è stata eliminata
    } catch (SQLException e) {
        e.printStackTrace();
        // Puoi anche lanciare un'eccezione personalizzata per gestire l'errore in un altro livello
        return false;
    }
}
}