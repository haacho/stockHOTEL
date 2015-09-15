<%-- 
    Document   : actionVisual
    Created on : 12-sep-2015, 10:34:02
    Author     : marcelo
--%>
<%@page import="modelo.Localidad"%>
<%@page import="modelo.Pais"%>
<%@page import="persistencia.sistema"%>
<%@page import="modelo.Categoria"%>
<%
    try {
        String action = "A";
        Integer id = -1;
        Integer idProvincia = Integer.valueOf(request.getParameter("idProvincia"));
        Localidad l = null;
        String nombre = "";
        String prefTelefonico = "";
        String codPostal = "";
        if (request.getParameter("action") != null) {
            action = request.getParameter("action");
        }
        if (request.getParameter("id") != null) {
            id = Integer.valueOf(request.getParameter("id"));
        }
        if (action.equals("M") || action.equals("B")) {
            l = sistema.LOCALIDAD_JPA_CONTROLLER.findLocalidad(id);
            id = l.getId();
            nombre = l.getNombre();
            prefTelefonico = l.getPrefTelefonico();
            codPostal = l.getCodPostal();
        }
%>
<form role="form" id="formLocalidad">
    <%if (action.equals("A") || action.equals("M")) {%>
    <div class="form-group">
        <label>Nombre</label>
        <input class="form-control" required="" id="inputNombre" placeholder="Ingrese el nombre de la localidad" value="<%=nombre%>">
    </div>
    <div class="form-group">
        <label>Pref. Telefónico</label>
        <input type="number" class="form-control" required="" id="inputPrefTel" placeholder="Ingrese el prefijo telefónico" value="<%=prefTelefonico%>">
    </div>
    <div class="form-group">
        <label>Códgo Postal</label>
        <input type="number" class="form-control" required="" id="inputCodigoPostal" placeholder="Ingrese el código postal" value="<%=codPostal%>">
    </div>
    <%} else {%>
    <div class="alert alert-warning">¿Esta seguro que desea eliminar la localidad? <strong><%=l.getNombre()%></strong></div>
    <%}%>
    <button type="submit" class="btn btn-default">Aceptar</button>
    <button type="reset" onclick="$('#modal').modal('hide')" class="btn btn-default">Cancelar</button>
</form>
<div id="actionResult">
</div>
<script>
    $(document).ready(function () {
        $("#formLocalidad").submit(function (e) {
            e.preventDefault();
            $.ajax({
                dataType: 'json',
                url: "lugares/localidades/action.jsp",
                data: {
                    id: '<%=id%>',
                    action: '<%= action%>',
                    idProvincia: '<%=idProvincia %>',
                    nombre: $("#inputNombre").val(),
                    prefTelefonico: $("#inputPrefTel").val(),
                    codPostal: $("#inputCodigoPostal").val()
                },
                success: result
            });
        });
    });
    function result(sms) {
        if (sms.tipo === 1) {
            loadTblLoc();
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