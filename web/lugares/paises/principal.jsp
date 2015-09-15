<%-- 
    Document   : principal
    Created on : 12-sep-2015, 10:33:23
    Author     : marcelo
--%>
<h1 class="page-header">Paises</h1>
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
        $("#divTbl").load("lugares/paises/tbl.jsp", function () {
            $("#tbl").tblSelectable();
            $("#divBtn").btnActions({
                tblSelect: $("#tbl")
            });
        });
    }

    function showModal(param) {
        $("#modalTitle").html("Pais");
        $("#modalBody").html(cargandoHtml);
        $("#modalBody").load("lugares/paises/actionVisual.jsp", {id: $("#tbl").tblGetSelected(), action: param.action});
        $('#modal').modal('show');
    }
</script>