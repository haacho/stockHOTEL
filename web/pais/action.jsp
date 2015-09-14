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
        String action = request.getParameter("action"),
                nombre = "",
                gentilicio = "",
                prefTelefonico = "";                
        if (action.equals("B")) {
            Pais c = sistema.PAIS_JPA_CONTROLLER.findPais(id);
            sistema.PAIS_JPA_CONTROLLER.destroy(id);
            jsonRespuesta = StaticsMetods.gSon.toJson(new Sms(Sms.SUCCESS, "País eliminado correctamente"));
        } else {
            nombre = request.getParameter("nombre");
        }
        if (action.equals("A")) {
            sistema.PAIS_JPA_CONTROLLER.create(nombre, gentilicio, prefTelefonico);
            jsonRespuesta = StaticsMetods.gSon.toJson(new Sms(Sms.SUCCESS, "El país <strong>" + nombre + "</strong> fue agregado correctamente"));
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