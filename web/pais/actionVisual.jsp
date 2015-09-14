<%-- 
    Document   : actionVisual
    Created on : 12-sep-2015, 10:34:02
    Author     : marcelo
--%>
<%@page import="persistencia.sistema"%>
<%@page import="modelo.Categoria"%>
<%
    try {
        Categoria c;
        String action = "A";
        Integer id = -1;
        String nombre = "";
        if (request.getParameter("action") != null) {
            action = request.getParameter("action");
        }
        if (request.getParameter("id") != null) {
            id = Integer.valueOf(request.getParameter("id"));
        }
        if (action.equals("M") || action.equals("B")) {
            c = sistema.CATEGORIA_JPA_CONTROLLER.findCategoria(id);
            nombre = c.getNombre();
        }
%>
<form role="form" id="formCat">
    <%if (action.equals("A") || action.equals("M")) {%>
    <div class="form-group">
        <label>Nombre</label>
        <input class="form-control" required="" id="inputNombre" placeholder="Ingrese el nombre de la categoria" value="<%=nombre%>">
    </div>
    <%} else {%>
    <div class="alert alert-warning">¿Esta seguro que desea eliminar la categoría? <strong><%= nombre%></strong></div>
    <%}%>
    <button type="submit" class="btn btn-default">Aceptar</button>
    <button type="reset" onclick="$('#modal').modal('hide')" class="btn btn-default">Cancelar</button>
</form>
<div id="actionResult">
</div>
<script>
    $(document).ready(function () {
        $("#formCat").submit(function (e) {
            e.preventDefault();
            $.ajax({
                dataType: 'json',
                url: "categorias/action.jsp",
                data: {
                    id: '<%=id%>',
                    action: '<%= action%>',
                    nombre: $("#inputNombre").val()
                },
                success: result
            });
        });
    });
    function result(sms) {
        if (sms.tipo === 1) {
            loadTbl();
            $("#modal").modal("hide");
            showSmsGritter(sms);
        } else {
            showSms(sms, "actionResult");
        }
    }
</script>
<%} catch (Exception ex) {
        out.print(ex.getMessage());
    }
%>