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
        String razonSocial = "";
        String cuit = "";
        String telefono = "";
        String calle = "";
        String numero = "";
        Integer idLocalidad = -1;
        if (action.equals("B")) {
            sistema.CLIENTE_JPA_CONTROLLER.destroy(id);
            jsonRespuesta = StaticsMetods.gSon.toJson(new Sms(Sms.SUCCESS, "Cliente eliminado correctamente"));
        } else {
            razonSocial = request.getParameter("razonSocial");
            cuit = request.getParameter("cuit");
            telefono = request.getParameter("telefono");
            calle = request.getParameter("calle");
            numero = request.getParameter("numero");
            idLocalidad = Integer.valueOf(request.getParameter("idLocalidad"));
        }
        if (action.equals("A")) {
            sistema.CLIENTE_JPA_CONTROLLER.create(razonSocial, cuit, telefono, calle, numero, "", "", idLocalidad);
            jsonRespuesta = StaticsMetods.gSon.toJson(new Sms(Sms.SUCCESS, "Cliente <strong>" + razonSocial + "</strong> agregado correctamente"));
        }
        if (action.equals("M")) {
            sistema.CLIENTE_JPA_CONTROLLER.edit(id, razonSocial, cuit, telefono, calle, numero, "", "", idLocalidad);
            jsonRespuesta = StaticsMetods.gSon.toJson(new Sms(Sms.SUCCESS, "Cliente editado correctamente"));
        }
    } catch (Exception ex) {
        jsonRespuesta = StaticsMetods.gSon.toJson(new Sms(Sms.ERROR, ex.getMessage()));
    } finally {
        out.print(jsonRespuesta);
    }
%>