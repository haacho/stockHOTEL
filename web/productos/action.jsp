<%-- 
    Document   : action
    Created on : 12-sep-2015, 10:33:55
    Author     : marcelo
--%>

<%@page import="modulos.Sms"%>
<%@page import="modulos.StaticsMetods"%>
<%@page import="persistencia.sistema"%>
<%@page import="modelo.Categoria"%>
<%
    String jsonRespuesta = "";
    try {
        Integer id = Integer.valueOf(request.getParameter("id"));
        String action = request.getParameter("action");
        String codigo = "";
        String descripcion = "";
        Integer cantidad = 1;
        Double precioCosto = 1.0;
        Double precioVenta = 1.0;
        Integer idCategoria = -1;
        if (action.equals("B")) {
            sistema.PRODUCTO_JPA_CONTROLLER.destroy(id);
            jsonRespuesta = StaticsMetods.gSon.toJson(new Sms(Sms.SUCCESS, "Producto correctamente"));
        } else {
            codigo = request.getParameter("codigo");
            descripcion = request.getParameter("descripcion");
            cantidad = Integer.valueOf(request.getParameter("cantidad"));
            precioCosto = Double.parseDouble(request.getParameter("precioCosto"));
            precioVenta = Double.parseDouble(request.getParameter("precioVenta"));
            idCategoria = Integer.valueOf(request.getParameter("idCategoria"));
        }
        if (action.equals("A")) {
            sistema.PRODUCTO_JPA_CONTROLLER.create(codigo, descripcion, cantidad, precioCosto, precioVenta, idCategoria);
            jsonRespuesta = StaticsMetods.gSon.toJson(new Sms(Sms.SUCCESS, "Producto <strong>" + codigo + "</strong> agregado correctamente"));
        }
        if (action.equals("M")) {
            sistema.PRODUCTO_JPA_CONTROLLER.edit(id, codigo, descripcion, cantidad, precioCosto, precioVenta, idCategoria);
            jsonRespuesta = StaticsMetods.gSon.toJson(new Sms(Sms.SUCCESS, "Producto editado correctamente"));
        }
    } catch (Exception ex) {
        jsonRespuesta = StaticsMetods.gSon.toJson(new Sms(Sms.ERROR, ex.getMessage()));
    } finally {
        out.print(jsonRespuesta);
    }
%>