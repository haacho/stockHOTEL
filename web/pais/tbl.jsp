<%-- 
    Document   : tbl
    Created on : 12-sep-2015, 10:33:45
    Author     : marcelo
--%>

<%@page import="persistencia.sistema"%>
<%@page import="modelo.Categoria"%>
<table class="table table-striped table-bordered table-hover" id="tbl">
    <thead>
        <tr>
            <th>Nombre</th>
        </tr>
    </thead>
    <tbody>
        <%for (Categoria c : sistema.CATEGORIA_JPA_CONTROLLER.findCategoriaEntities()) {%>
        <tr idObj="<%= c.getId()%>">
            <td><%=c.getNombre()%></td>
        </tr>
        <%}%>
    </tbody>
</table>
<script>
    $(document).ready(function () {
        dataTable("tbl");
    });
</script>
