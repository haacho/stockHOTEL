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
        Integer idProvincia = Integer.valueOf(request.getParameter("idProvincia"));
        String action = request.getParameter("action");
        String nombre = "";
        String prefTelefonico = "";
        String codPostal = "";
        if (action.equals("B")) {
            sistema.LOCALIDAD_JPA_CONTROLLER.destroy(id);
            jsonRespuesta = StaticsMetods.gSon.toJson(new Sms(Sms.SUCCESS, "Localidad eliminada correctamente"));
        } else {
            nombre = request.getParameter("nombre");
            prefTelefonico = request.getParameter("prefTelefonico");
            codPostal = request.getParameter("codPostal");
        }
        if (action.equals("A")) {
            sistema.LOCALIDAD_JPA_CONTROLLER.create(nombre, prefTelefonico, codPostal, idProvincia);
            jsonRespuesta = StaticsMetods.gSon.toJson(new Sms(Sms.SUCCESS, "La localidad <strong>" + nombre + "</strong> fue agregada correctamente"));
        }
        if (action.equals("M")) {
            sistema.LOCALIDAD_JPA_CONTROLLER.edit(id, nombre, prefTelefonico, codPostal, idProvincia);
            jsonRespuesta = StaticsMetods.gSon.toJson(new Sms(Sms.SUCCESS, "Localidad editada correctamente"));
        }
    } catch (Exception ex) {
        jsonRespuesta = StaticsMetods.gSon.toJson(new Sms(Sms.ERROR, ex.getMessage()));
    } finally {
        out.print(jsonRespuesta);
    }
%>