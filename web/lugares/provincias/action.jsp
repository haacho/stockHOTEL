<%-- 
    Document   : action
    Created on : 12-sep-2015, 10:33:55
    Author     : marcelo
--%>

<%@page import="modelo.Pais"%>
<%@page import="modulos.Sms"%>
<%@page import="modulos.StaticsMetods"%>
<%@page import="persistencia.sistema"%>

<%
    String jsonRespuesta = "";
    try {
        Integer id = Integer.valueOf(request.getParameter("id"));
        String action = request.getParameter("action");
        Integer idPais = -1;
        String nombre = "";
        if (action.equals("B")) {
            sistema.PROVINCIA_JPA_CONTROLLER.destroy(id);
            jsonRespuesta = StaticsMetods.gSon.toJson(new Sms(Sms.SUCCESS, "Provincia eliminada correctamente"));
        } else {
            idPais = Integer.valueOf(request.getParameter("idPais"));
            nombre = request.getParameter("nombre");
        }
        if (action.equals("A")) {
            sistema.PROVINCIA_JPA_CONTROLLER.create(nombre, idPais);
            jsonRespuesta = StaticsMetods.gSon.toJson(new Sms(Sms.SUCCESS, "La provincia <strong>" + nombre + "</strong> fue agregada correctamente"));
        }
        if (action.equals("M")) {
            sistema.PROVINCIA_JPA_CONTROLLER.edit(id, nombre, idPais);
            jsonRespuesta = StaticsMetods.gSon.toJson(new Sms(Sms.SUCCESS, "Provincia editada correctamente"));
        }
    } catch (Exception ex) {
        jsonRespuesta = StaticsMetods.gSon.toJson(new Sms(Sms.ERROR, ex.getMessage()));
    } finally {
        out.print(jsonRespuesta);
    }
%>