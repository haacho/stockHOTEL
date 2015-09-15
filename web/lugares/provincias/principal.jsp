<%-- 
    Document   : principal
    Created on : 12-sep-2015, 10:33:23
    Author     : marcelo
--%>
<%@page import="persistencia.sistema"%>
<%
    try {
        Integer idPais = Integer.valueOf(request.getParameter("idPais"));
        if (idPais == -1) {
%>
<div class="alert alert-danger">
    Seleccione un pais para visualizar sus provincias.
</div>
<%} else {%>
<h1>Provincias de <%=sistema.PAIS_JPA_CONTROLLER.findPais(idPais).getNombre()%></h1>
<div id="divTbl"></div>
<div id="divBtn"></div>
<script>
    $(document).ready(function () {
        $("#divBtn").btnActions({
            abm: showModal,
            type: 'large'
        });
        loadTbl();
    });

    function loadTbl() {
        $("#divTbl").html(cargandoHtml);
        $("#divTbl").load("lugares/provincias/tbl.jsp", {idPais: '<%=idPais%>'}, function () {
            $("#tblProvincias").tblSelectable();
            $("#divBtn").btnActions({
                tblSelect: $("#tblProvincias")
            });
        });
    }

    function showModal(param) {
        $("#modalTitle").html("Provincia");
        $("#modalBody").html(cargandoHtml);
        $("#modalBody").load("lugares/provincias/actionVisual.jsp", {id: $("#tblProvincias").tblGetSelected(), idPais: '<%=idPais%>', action: param.action});
        $('#modal').modal('show');
    }
</script>
<%}
    } catch (Exception e) {
        out.print(e.getMessage());
    }
%>