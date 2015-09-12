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
        String nombre = "";

        if (action.equals("B")) {
            Categoria c = sistema.CATEGORIA_JPA_CONTROLLER.findCategoria(id);
            sistema.CATEGORIA_JPA_CONTROLLER.destroy(id);
            jsonRespuesta = StaticsMetods.gSon.toJson(new Sms(Sms.SUCCESS, "Categoría eliminada correctamente"));
        } else {
            nombre = request.getParameter("nombre");
        }
        if (action.equals("A")) {
            sistema.CATEGORIA_JPA_CONTROLLER.create(nombre);
            jsonRespuesta = StaticsMetods.gSon.toJson(new Sms(Sms.SUCCESS, "Categoría <strong>" + nombre + "</strong> agregada correctamente"));
        }
        if (action.equals("M")) {
            sistema.CATEGORIA_JPA_CONTROLLER.edit(id, nombre);
            jsonRespuesta = StaticsMetods.gSon.toJson(new Sms(Sms.SUCCESS, "Categoría editada correctamente"));
        }
    } catch (Exception ex) {
        jsonRespuesta = StaticsMetods.gSon.toJson(new Sms(Sms.ERROR, ex.getMessage()));
    } finally {
        out.print(jsonRespuesta);
    }
%>