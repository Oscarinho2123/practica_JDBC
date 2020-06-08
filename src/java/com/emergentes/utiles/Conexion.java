package com.emergentes.utiles;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class Conexion {
    static String driver = "com.mysql.jdbc.Driver";
    static String url = "jdbc:mysql://localhost:3306/bd_blog";
    static String usuario = "root";
    static String password = "";
    public Connection conec = null;
    public Conexion(){
        try{
            Class.forName(driver);
            conec = DriverManager.getConnection(url,usuario,password);
            if (conec != null){
                System.out.println("Conexion establecida -> OK");
            }
        }catch(ClassNotFoundException e){
            System.out.println("Falta especificar los driver "+e.getMessage());
        }catch (SQLException e){
            System.out.println("Error al abrir la base de datos "+e.getMessage());
        }
    }
    public Connection conectar(){
        return conec;
    }
    public void desconectar(){
        try {
            conec.close();
        } catch (SQLException e) {
            System.out.println("Error al cerrar la base de datos "+e.getMessage());
        }
    }
}
