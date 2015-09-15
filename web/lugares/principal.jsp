<%-- 
    Document   : principal
    Created on : 14-sep-2015, 16:58:15
    Author     : marcelo
--%>
<div class="col-md-6" id="divPais"></div>
<div class="col-md-6" id="divProvincia"></div>
<div class="col-md-6" id="divLocalidad"></div>
<script>
    $(document).ready(function () {
        loadTbl();
    });

    function loadTbl() {
        $("#divPais").html(cargandoHtml);
        $("#divPais").load("lugares/paises/principal.jsp");
        $("#divProvincia").load("lugares/provincias/principal.jsp");
        $("#divLocalidad").load("lugares/localidades/principal.jsp",{idProvincia:-1});
    }
</script>