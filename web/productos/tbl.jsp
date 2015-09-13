<%-- 
    Document   : tbl
    Created on : 12-sep-2015, 10:33:45
    Author     : marcelo
--%>

<%@page import="modulos.StaticsMetods"%>
<%@page import="modelo.Producto"%>
<%@page import="persistencia.sistema"%>
<%@page import="modelo.Categoria"%>
<table class="table table-striped table-bordered table-hover" id="tbl">
    <thead>
        <tr>
            <th>Código</th>
            <th>Descripción</th>
            <th>Cantidad</th>
            <th>Precio Costo</th>
            <th>Precio Venta</th>
            <th>Categoria</th>
        </tr>
    </thead>
    <tbody>
        <%for (Producto p : sistema.PRODUCTO_JPA_CONTROLLER.findProductoEntities()) {%>
        <tr idObj="<%= p.getId()%>">
            <td><%=p.getCodigo()%></td>
            <td><%=p.getDescripcion()%></td>
            <td><%=p.getCantidad()%></td>
            <td><%=StaticsMetods.parseDoubleMoneyToString(p.getPrecioCosto())%></td>
            <td><%=StaticsMetods.parseDoubleMoneyToString(p.getPrecioVenta())%></td>
            <td><%=p.getCategoria().getNombre()%></td>
        </tr>
        <%}%>
    </tbody>
</table>
<script>
    $(document).ready(function () {
        dataTable("tbl");
    });
</script>
