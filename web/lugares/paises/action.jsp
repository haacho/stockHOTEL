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
        String nombre = "";
        String gentilicio = "";
        String prefTel = "";
        if (action.equals("B")) {
            sistema.PAIS_JPA_CONTROLLER.destroy(id);
            jsonRespuesta = StaticsMetods.gSon.toJson(new Sms(Sms.SUCCESS, "País eliminado correctamente"));
        } else {
            nombre = request.getParameter("nombre");
            gentilicio = request.getParameter("gentilicio");
            prefTel = request.getParameter("prefTel");
        }
        if (action.equals("A")) {
            sistema.PAIS_JPA_CONTROLLER.create(nombre, gentilicio, prefTel);
            jsonRespuesta = StaticsMetods.gSon.toJson(new Sms(Sms.SUCCESS, "El país <strong>" + nombre + "</strong> fue agregado correctamente"));
        }
        if (action.equals("M")) {
            sistema.PAIS_JPA_CONTROLLER.edit(id, nombre, gentilicio, prefTel);
            jsonRespuesta = StaticsMetods.gSon.toJson(new Sms(Sms.SUCCESS, "Pais editado correctamente"));
        }
    } catch (Exception ex) {
        jsonRespuesta = StaticsMetods.gSon.toJson(new Sms(Sms.ERROR, ex.getMessage()));
    } finally {
        out.print(jsonRespuesta);
    }
%>