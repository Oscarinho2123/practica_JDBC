
package com.emergentes.controlador;


import com.emergentes.modelo.blog;
import com.emergentes.utiles.Conexion;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "MainControlador", urlPatterns = {"/MainControlador"})
public class MainControlador extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String opcion;
        ArrayList<blog> lista = new ArrayList<blog>();
        opcion = (request.getParameter("op") != null) ? request.getParameter("op") : "view";
        Conexion canal = new Conexion();
        Connection conn = canal.conectar();
        PreparedStatement PST;
        ResultSet RESULTADO;
        if (opcion.equals("view")) {
            try {
                String CONSULTA = "select * from blog order by fecha desc";
                
                PST = conn.prepareStatement(CONSULTA);
                RESULTADO = PST.executeQuery();
                while (RESULTADO.next()) {
                    blog MIOBJETO = new blog();
                    MIOBJETO.setId(RESULTADO.getInt("id"));
                    MIOBJETO.setFecha(RESULTADO.getString("fecha"));
                    MIOBJETO.setTitulo(RESULTADO.getString("titulo"));
                    MIOBJETO.setContenido(RESULTADO.getString("contenido"));
                    MIOBJETO.setAutor(RESULTADO.getString("autor"));
                    lista.add(MIOBJETO);
                }
                request.setAttribute("lista", lista);
                request.getRequestDispatcher("post.jsp").forward(request, response);
            } catch (SQLException ex) {
                System.out.println("ERROR EN SQL " + ex.getMessage());
            } finally {
                canal.desconectar();
            }
        }
        if (opcion.equals("nuevo")) {
            blog MIOBJETO = new blog();
            int id = MIOBJETO.getId();
            request.setAttribute("post", MIOBJETO);
            request.getRequestDispatcher("nuevo.jsp").forward(request, response);
        }
        
        /* EMPIEZA LA OPCION EDITAR*/
        if (opcion.equals("editar")) {
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                String CONSULTA = "select * from blog where id = ?";
                PST = conn.prepareStatement(CONSULTA);
                PST.setInt(1, id);
                RESULTADO = PST.executeQuery();
                blog OBJETO2 = new blog();
                while (RESULTADO.next()) {
                    OBJETO2.setId(RESULTADO.getInt("id"));
                    OBJETO2.setFecha(RESULTADO.getString("fecha"));
                    OBJETO2.setTitulo(RESULTADO.getString("titulo"));
                    OBJETO2.setContenido(RESULTADO.getString("contenido"));
                    OBJETO2.setAutor(RESULTADO.getString("autor"));
                }
                request.setAttribute("post", OBJETO2);
                request.getRequestDispatcher("nuevo.jsp").forward(request, response);
            } catch (SQLException ex) {
                System.out.println("ERROR DE SQL " + ex.getMessage());
            }
        }
        /*TEMINA LA OPCION EDITAR*/
        
        
        /*EMPIEZA LA OPCION ELIMNIAR*/
        if (opcion.equals("eliminar")) {
            int id = Integer.parseInt(request.getParameter(("id")));
            try {
                String CONSULTA = "delete from blog where id=?";
                PST = conn.prepareStatement(CONSULTA);
                PST.setInt(1, id);
                PST.executeUpdate();
            } catch (SQLException e) {
                System.out.println("ERROR DE SQL " + e.getMessage());
            } finally {
                canal.desconectar();
            }
            response.sendRedirect("MainControlador");
        }
    }

    
    
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String fecha = request.getParameter("fecha");
        String titulo = request.getParameter("titulo");
        String contenido = request.getParameter("contenido");
        String autor = request.getParameter("autor");
        blog MIOBJETO = new blog();
        MIOBJETO.setId(id);
        MIOBJETO.setFecha(fecha);
        MIOBJETO.setTitulo(titulo);
        MIOBJETO.setContenido(contenido);
        MIOBJETO.setAutor(autor);
        
        Conexion canal = new Conexion();
        Connection conn = canal.conectar();
        PreparedStatement PSTU;
       
       /*FUNCION INSERTAR DATOS*/
        if (id == 0) {
            String CONSULTA = "insert into blog (fecha,titulo,contenido,autor) values (?,?,?,?) ";
            try {
                
                PSTU = conn.prepareStatement(CONSULTA);
                PSTU.setString(1, MIOBJETO.getFecha());
                PSTU.setString(2, MIOBJETO.getTitulo());
                PSTU.setString(3, MIOBJETO.getContenido());
                PSTU.setString(4, MIOBJETO.getAutor());
                PSTU.executeUpdate();
                
            } catch (SQLException e) {
                System.out.println("ERROR EN SQL " + e.getMessage());
            } finally {
                canal.desconectar();
            }
        }
        /*FIN DE FUNCION ACTUALIZAR*/
        /*INICIA LA FUNCION ACTUALIZAR*/
        else{
            try {
                String ACTUALIZAR = "update blog set titulo=?,contenido=?,autor=?,fecha=? where id=?";
                PSTU = conn.prepareStatement(ACTUALIZAR);
                PSTU.setString(1, MIOBJETO.getTitulo());
                PSTU.setString(2, MIOBJETO.getContenido());
                PSTU.setString(3, MIOBJETO.getAutor());
                PSTU.setString(4, MIOBJETO.getFecha());
                PSTU.setInt(5, MIOBJETO.getId());
                PSTU.executeUpdate();
            } catch (SQLException e) {
                System.out.println("ERROR NO SE PUEDE ACTUALIZAR LOS DATOS "+e.getMessage());
            }
        }
        /*FIN DE FUNCION ACTUALIZAR*/
        response.sendRedirect("MainControlador");
    }
}
