<%-- 
    Document   : principal
    Created on : 12-sep-2015, 10:33:23
    Author     : marcelo
--%>
<div>
    <h1>Productos</h1>
    <div id="divTbl"></div>
</div>
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
        $("#divTbl").load("productos/tbl.jsp", function () {
            $("#tbl").tblSelectable();
            $("#divBotones").btnActions({
                tblSelect: $("#tbl")
            });
        });
    }

    function showModal(param) {
        $("#modalTitle").html("Producto");
        $("#modalBody").html(cargandoHtml);
        $("#modalBody").load("productos/actionVisual.jsp", {id: $("#tbl").tblGetSelected(), action: param.action});
        $('#modal').modal('show');
    }
</script>