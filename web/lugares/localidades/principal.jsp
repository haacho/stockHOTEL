<%-- 
    Document   : principal
    Created on : 12-sep-2015, 10:33:23
    Author     : marcelo
--%>
<%@page import="persistencia.sistema"%>
<%
    try {
        Integer idProvincia = Integer.valueOf(request.getParameter("idProvincia"));
        if (idProvincia == -1) {
%>
<h1>Seleccione una provincia para visualizar sus localidades.</h1>
<%} else {%>
<h1>Localidades de <%=sistema.PROVINCIA_JPA_CONTROLLER.findProvincia(idProvincia).getNombre()%></h1>
<div id="divTblLoc"></div>
<div id="divBtn"></div>
<script>
    $(document).ready(function () {
        $("#divBtn").btnActions({
            abm: showModal,
            type: 'large'
        });
        loadTblLoc();
    });

    function loadTblLoc() {
        $("#divTblLoc").html(cargandoHtml);
        $("#divTblLoc").load("lugares/localidades/tbl.jsp", {idProvincia: '<%=idProvincia%>'}, function () {
            $("#tblLoc").tblSelectable();
            $("#divBtn").btnActions({
                tblSelect: $("#tblLoc")
            });
        });
    }

    function showModal(param) {
        $("#modalTitle").html("Localidad");
        $("#modalBody").html(cargandoHtml);
        $("#modalBody").load("lugares/localidades/actionVisual.jsp", {id: $("#tblLoc").tblGetSelected(), idProvincia: '<%=idProvincia%>', action: param.action});
        $('#modal').modal('show');
    }
</script>
<%}
    } catch (Exception e) {
        out.print(e.getMessage());
    }
%>