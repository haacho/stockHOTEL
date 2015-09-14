<%-- 
    Document   : principal
    Created on : 12-sep-2015, 10:33:23
    Author     : marcelo
--%>

<div id="divTbl"></div>
<div id="divBotones"></div>

<script>
   $(document).ready(function () {
        $("#divBotones").btnActions({
            abm: showModal,
            type: 'large'
        });
        loadTbl();
    });

    function loadTbl() {
        $("#divTbl").html(cargandoHtml);
        $("#divTbl").load("categorias/tbl.jsp", function () {
            $("#tbl").tblSelectable();
            $("#divBotones").btnActions({
                tblSelect: $("#tbl")
            });
        });
    }

    function showModal(param) {
        $("#modalTitle").html("Categoria");
        $("#modalBody").html(cargandoHtml);
        $("#modalBody").load("categorias/actionVisual.jsp", {id: $("#tbl").tblGetSelected(), action: param.action});
        $('#modal').modal('show');
    }
</script>