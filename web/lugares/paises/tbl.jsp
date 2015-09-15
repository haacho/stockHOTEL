<%-- 
    Document   : tbl
    Created on : 12-sep-2015, 10:33:45
    Author     : marcelo
--%>

<%@page import="modelo.Pais"%>
<%@page import="persistencia.sistema"%>
<table class="table table-striped table-bordered table-hover" id="tbl">
    <thead>
        <tr>
            <th>Nombre</th>
            <th>Gentilicio</th>
            <th>Prefico Telefónico</th>
        </tr>
    </thead>
    <tbody>
        <%for (Pais p : sistema.PAIS_JPA_CONTROLLER.findPaisEntities()) {%>
        <tr idObj="<%= p.getId()%>">
            <td><%=p.getNombre()%></td>
            <td><%=p.getGentilicio()%></td>
            <td><%=p.getPrefTelefonico()%></td>
        </tr>
        <%}%>
    </tbody>
</table>
<script>
    $(document).ready(function () {
        dataTable("tbl");
    });
</script>
