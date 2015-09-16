<%-- 
    Document   : principal
    Created on : 12-sep-2015, 10:33:23
    Author     : marcelo
--%>
<div>
    <h1>Clientes</h1>
    <div id="divTbl"></div>
</div>
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
        $("#divTbl").load("clientes/tbl.jsp", function () {
            $("#tbl").tblSelectable();
            $("#divBtn").btnActions({
                tblSelect: $("#tbl")
            });
        });
    }

    function showModal(param) {
        $("#modalTitle").html("Cliente");
        $("#modalBody").html(cargandoHtml);
        $("#modalBody").load("clientes/actionVisual.jsp", {id: $("#tbl").tblGetSelected(), action: param.action});
        $('#modal').modal('show');
    }
</script>