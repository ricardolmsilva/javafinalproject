/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import camiao.Camiao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ricardosilva
 */
public class Database {

    public static void main(String[] args) throws Exception {

        pesquisar("Ricardo");

    }

    public static Connection getConnection() throws Exception {

        try {
            //Dados para connexão
            String driver = "com.mysql.cj.jdbc.Driver";
            String url = "jdbc:mysql://localhost:3306/java";
            String username = "root";
            String password = "root";
            Class.forName(driver);

            //Criacao de uma conexão 
            Connection conn = DriverManager.getConnection(url, username, password);

            System.out.println("Connected");

            //Retorna conexão
            return conn;

        } catch (ClassNotFoundException | SQLException e) {

            //Caso haja uma execao é impressa aqui
            System.out.println("Erro na DB");

        }

        return null;

    }

    public static List<Camiao> listar(String situacao, String ordem) throws Exception {

        try {

            Connection con = getConnection();
            ResultSet result = null;

            if (!situacao.equals("all")) {
                PreparedStatement statement = con.prepareStatement("SELECT * FROM frota WHERE situacao= ? ORDER BY id " + ordem + "");
                statement.setString(1, situacao);
                result = statement.executeQuery();
            } else {

                PreparedStatement statement = con.prepareStatement("SELECT * FROM frota ORDER BY id " + ordem + "");

                result = statement.executeQuery();
            }

            List<Camiao> camioes = new ArrayList<>();

            while (result.next()) {

                Camiao camiao = new Camiao();
                camiao.setId(result.getInt("id"));
                camiao.setMatricula(result.getString("matricula"));
                camiao.setSituacao(result.getString("situacao"));
                camioes.add(camiao);

            }

            for (Camiao camiao : camioes) {

                System.out.println(camiao.getId());
                System.out.println(camiao.getMatricula());
                System.out.println(camiao.getSituacao());

            }

            System.out.println("All records have been selected!");

            return camioes;

        } catch (Exception e) {

            System.out.println(e);

            return null;

        }

    }

    public static boolean inserir(String matricula, String situacao) throws SQLException {

        String inserir = "INSERT INTO frota"
                + "(matricula, situacao) VALUES"
                + "(?,?)";

        try {
            Connection con = getConnection();

            PreparedStatement stmt = con.prepareStatement("SELECT * FROM frota WHERE matricula= ?");
            stmt.setString(1, matricula);
            ResultSet result = stmt.executeQuery();

            int i = 0;

            while (result.next()) {

                i++;

            }

            if (i == 0) {
                PreparedStatement preparedStatement = con.prepareStatement(inserir);
                preparedStatement.setString(1, matricula);
                preparedStatement.setString(2, situacao);

                preparedStatement.executeUpdate();

                System.out.println("Insert Completed.");

                return true;

            }
            return false;

        } catch (Exception e) {

            System.out.println(e);
            return false;

        }
    }

    public static Camiao find(String id) {

        try {
            Connection con = getConnection();
            PreparedStatement stmt = con.prepareStatement("SELECT * FROM frota WHERE id= ?");
            stmt.setString(1, id);
            ResultSet result = stmt.executeQuery();

            Camiao camiao = new Camiao();

            while (result.next()) {

                camiao.setId(result.getInt("id"));
                camiao.setMatricula(result.getString("matricula"));
                camiao.setSituacao(result.getString("situacao"));

            }

            System.out.println("Edited Completed.");
            return camiao;

        } catch (Exception e) {

            System.out.println(e);

            return null;
        }
    }

    public static Camiao pesquisar(String matricula) {

        try {
            Connection con = getConnection();
            PreparedStatement stmt = con.prepareStatement("SELECT * FROM frota WHERE matricula= ?");
            stmt.setString(1, matricula);
            ResultSet result = stmt.executeQuery();

            Camiao camiao = new Camiao();

            while (result.next()) {

                camiao.setId(result.getInt("id"));
                camiao.setMatricula(result.getString("matricula"));
                camiao.setSituacao(result.getString("situacao"));

            }

            System.out.println(camiao.getId());
            System.out.println(camiao.getMatricula());
            System.out.println(camiao.getSituacao());

            System.out.println("Edited Completed.");
            return camiao;

        } catch (Exception e) {

            System.out.println(e);

            return null;
        }
    }

    public static boolean apagar(String id) throws Exception {

        try {
            Connection con = getConnection();
            PreparedStatement stmt = con.prepareStatement("DELETE FROM frota WHERE id = ?");
            stmt.setString(1, id);
            stmt.executeUpdate();

            System.out.println("Delete Completed.");
            return true;

        } catch (Exception e) {

            System.out.println(e);

            return false;
        }

    }

    public static boolean editar(String id, String matricula, String situacao, String oldmatricula, String oldsituacao) throws Exception {

        try {
            Connection con = getConnection();
            PreparedStatement stmt = null;
            
            if (!matricula.equals(oldmatricula)) {
                
                stmt = con.prepareStatement("SELECT * FROM frota WHERE matricula= ?");
                stmt.setString(1, matricula);
                ResultSet result = stmt.executeQuery();

                int i = 0;

                while (result.next()) {

                    i++;

                }

                if (i == 0) {
                    stmt = con.prepareStatement("UPDATE frota SET matricula = ?, situacao = ? WHERE id = ?");
                    stmt.setString(1, matricula);
                    stmt.setString(2, situacao);
                    stmt.setString(3, id);
                    stmt.executeUpdate();

                    return true;
                }
                
            }else if(matricula.equals(oldmatricula) && !situacao.equals(oldsituacao)){
            
                    stmt = con.prepareStatement("UPDATE frota SET matricula = ?, situacao = ? WHERE id = ?");
                    stmt.setString(1, matricula);
                    stmt.setString(2, situacao);
                    stmt.setString(3, id);
                    stmt.executeUpdate();

                    return true;
            }
        
            return false;

        } catch (Exception e) {

            System.out.println(e);

            return false;
        }

    }

}
