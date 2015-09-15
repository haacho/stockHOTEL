<%-- 
    Document   : tbl
    Created on : 12-sep-2015, 10:33:45
    Author     : marcelo
--%>
<%@page import="modelo.Provincia"%>
<%@page import="persistencia.sistema"%>
<%@page import="modelo.Pais"%>
<%
    try {
        Pais p = sistema.PAIS_JPA_CONTROLLER.findPais(Integer.valueOf(request.getParameter("idPais")));
%>
<table class="table table-striped table-bordered table-hover" id="tblProvincias">
    <thead>
        <tr>
            <th>Nombre</th>
        </tr>
    </thead>
    <tbody>
        <%for (Provincia pro : p.getProvincias()) {%>
        <tr idObj="<%= pro.getId()%>">
            <td><%=pro.getNombre()%></td>
        </tr>
        <%}%>
    </tbody>
</table>
<script>
    $(document).ready(function () {
        dataTable("tblProvincias");
    });
</script>

<%
    } catch (Exception e) {
        out.print(e.getMessage());
    }
%>