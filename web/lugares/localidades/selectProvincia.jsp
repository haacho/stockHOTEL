<%-- 
    Document   : principal
    Created on : 12-sep-2015, 10:33:23
    Author     : marcelo
--%>
<%@page import="persistencia.sistema"%>
<%
    try {

%>
<div class="col-md-4">
    <h1>Provincias</h1>
    <div id="divTblPprovincia"></div>
</div>
<div class="col-md-8">
    <div id="divLocalidades"></div>
</div>
<script>
    $(document).ready(function () {
        loadTbl();
        $("#divLocalidades").load("lugares/localidades/principal.jsp", {idProvincia: -1});
    });

    function loadTbl() {
        $("#divTblPprovincia").html(cargandoHtml);
        $("#divTblPprovincia").load("lugares/localidades/tblProvincias.jsp");
    }

    function seleccion(tr) {
        $("#divLocalidades").html(cargandoHtml);
        if (!$(tr).hasClass("success")) {
            $("#divLocalidades").load("lugares/localidades/principal.jsp", {idProvincia: $(tr).attr("idObj")});
            $(tr).addClass('success').siblings().removeClass('success');
        } else {
            $(tr).removeClass("success");
            $("#divLocalidades").load("lugares/localidades/principal.jsp", {idProvincia: -1});
        }
    }
</script>
<%    } catch (Exception ex) {
        out.print(ex.getMessage());
    }
%>
