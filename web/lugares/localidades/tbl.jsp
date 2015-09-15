<%-- 
    Document   : tbl
    Created on : 12-sep-2015, 10:33:45
    Author     : marcelo
--%>

<%@page import="modelo.Localidad"%>
<%@page import="modelo.Provincia"%>
<%@page import="modelo.Pais"%>
<%@page import="persistencia.sistema"%>
<%
    try {
        Provincia p = sistema.PROVINCIA_JPA_CONTROLLER.findProvincia(Integer.valueOf(request.getParameter("idProvincia")));
%>
<table class="table table-striped table-bordered table-hover" id="tblLoc">
    <thead>
        <tr>
            <th>Nombre</th>
            <th>Prefico Telefónico</th>
            <th>Código Postal</th>
        </tr>
    </thead>
    <tbody>
        <%for (Localidad l : p.getLocalidades()) {%>
        <tr idObj="<%= l.getId()%>">
            <td><%=l.getNombre()%></td>
            <td><%=l.getPrefTelefonico()%></td>            
            <td><%=l.getCodPostal()%></td>            
        </tr>
        <%}%>
    </tbody>
</table>
<script>
    $(document).ready(function () {
        dataTable("tblLoc");
    });


</script>
<%
    } catch (Exception e) {
        out.print(e.getMessage());
    }
%>
