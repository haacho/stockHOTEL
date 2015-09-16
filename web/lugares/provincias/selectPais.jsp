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
    <h1>Paises</h1>
    <div id="divTblPais"></div>
</div>
<div class="col-md-8">
    <div id="divProvincias"></div>
</div>
<script>
    $(document).ready(function () {
        loadTbl();
        $("#divProvincias").load("lugares/provincias/principal.jsp", {idPais: -1});
    });

    function loadTbl() {
        $("#divTblPais").html(cargandoHtml);
        $("#divTblPais").load("lugares/provincias/tblPaises.jsp");
    }

    function seleccion(tr) {
        $("#divProvincias").html(cargandoHtml);
        if (!$(tr).hasClass("success")) {
            $("#divProvincias").load("lugares/provincias/principal.jsp", {idPais: $(tr).attr("idObj")});
            $(tr).addClass('success').siblings().removeClass('success');
        } else {
            $(tr).removeClass("success");
            $("#divProvincias").load("lugares/provincias/principal.jsp", {idPais: -1});
        }
    }
</script>
<%    } catch (Exception ex) {
        out.print(ex.getMessage());
    }
%>
