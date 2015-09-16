<%-- 
    Document   : actionVisual
    Created on : 12-sep-2015, 10:34:02
    Author     : marcelo
--%>
<%@page import="modelo.Pais"%>
<%@page import="persistencia.sistema"%>
<%@page import="modelo.Categoria"%>
<%
    try {
        String action = "A";
        Integer id = -1;
        Pais p = null;
        String nombre = "";
        String gentilicio = "";
        String prefTel = "";
        if (request.getParameter("action") != null) {
            action = request.getParameter("action");
        }
        if (request.getParameter("id") != null) {
            id = Integer.valueOf(request.getParameter("id"));
        }
        if (action.equals("M") || action.equals("B")) {
            p = sistema.PAIS_JPA_CONTROLLER.findPais(id);
            id=p.getId();
            nombre = p.getNombre();
            gentilicio = p.getGentilicio();
            prefTel = p.getPrefTelefonico();
        }
%>
<form role="form" id="formPais">
    <%if (action.equals("A") || action.equals("M")) {%>
    <div class="form-group">
        <label>Nombre</label>
        <input class="form-control" required="" id="inputNombre" placeholder="Ingrese el nombre del pais" value="<%=nombre%>">
    </div>
    <div class="form-group">
        <label>Gentilicio</label>
        <input class="form-control" id="inputGentilicio" placeholder="Ingrese el gentilicio" value="<%=gentilicio%>">
    </div>
    <div class="form-group">
        <label>Pref. Telefónico</label>
        <input type="number" class="form-control" required="" id="inputPrefTel" placeholder="Ingrese el Prefijo Telefónico" value="<%=prefTel%>">
    </div>
    <%} else {%>
    <div class="alert alert-warning">¿Esta seguro que desea eliminar el pais? <strong><%=p.getNombre()%></strong></div>
    <%}%>
    <button type="submit" class="btn btn-default">Aceptar</button>
    <button type="reset" onclick="$('#modal').modal('hide')" class="btn btn-default">Cancelar</button>
</form>
<div id="actionResult">
</div>
<script>
    $(document).ready(function () {
        $("#formPais").submit(function (e) {
            e.preventDefault();
            $.ajax({
                dataType: 'json',
                url: "lugares/paises/action.jsp",
                data: {
                    id: '<%=id%>',
                    action: '<%= action%>',
                    nombre: $("#inputNombre").val(),
                    gentilicio : $("#inputGentilicio").val(),
                    prefTel : $("#inputPrefTel").val()
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