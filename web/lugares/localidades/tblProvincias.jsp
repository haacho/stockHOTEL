<%-- 
    Document   : tblPaises
    Created on : 15-sep-2015, 0:03:32
    Author     : marcelo
--%>

<%@page import="modelo.Provincia"%>
<%@page import="modelo.Pais"%>
<%@page import="persistencia.sistema"%>
<table class="table table-striped table-bordered table-hover" id="tbl">
    <thead>
        <tr>
            <th>Nombre</th>
        </tr>
    </thead>
    <tbody>
        <%for (Provincia p : sistema.PROVINCIA_JPA_CONTROLLER.findProvinciaEntities()) {%>
        <tr idObj="<%= p.getId()%>" onclick="seleccion($(this))">
            <td><%=p.getNombre()%></td>
        </tr>
        <%}%>
    </tbody>
</table>