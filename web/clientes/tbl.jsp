<%-- 
    Document   : tbl
    Created on : 12-sep-2015, 10:33:45
    Author     : marcelo
--%>

<%@page import="modelo.Cliente"%>
<%@page import="modulos.StaticsMetods"%>
<%@page import="modelo.Producto"%>
<%@page import="persistencia.sistema"%>
<%@page import="modelo.Categoria"%>
<table class="table table-striped table-bordered table-hover" id="tbl">
    <thead>
        <tr>
            <th>Razón Social</th>
            <th>Cuit</th>
            <th>Dirección</th>
            <th>Teléfono</th>
        </tr>
    </thead>
    <tbody>
        <%for (Cliente c : sistema.CLIENTE_JPA_CONTROLLER.findClienteEntities()) {%>
        <tr idObj="<%= c.getId()%>">
            <td><%=c.getRazonSocial()%></td>
            <td><%=c.getCuit()%></td>
            <td><%=c.getDireccion().toString()%></td>
            <td><%=c.getTelefono()%></td>
        </tr>
        <%}%>
    </tbody>
</table>
<script>
    $(document).ready(function () {
        dataTable("tbl");
    });
</script>
