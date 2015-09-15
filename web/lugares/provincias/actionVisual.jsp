<%-- 
    Document   : actionVisual
    Created on : 12-sep-2015, 10:34:02
    Author     : marcelo
--%>
<%@page import="modelo.Provincia"%>
<%@page import="modelo.Pais"%>
<%@page import="persistencia.sistema"%>
<%@page import="modelo.Categoria"%>
<%
    try {
        String action = "A";
        Integer id = -1;
        Integer idPais = Integer.valueOf(request.getParameter("idPais"));
        String nombre = "";
        Provincia p = null;
        if (request.getParameter("action") != null) {
            action = request.getParameter("action");
        }
        if (request.getParameter("id") != null) {
            id = Integer.valueOf(request.getParameter("id"));
        }
        if (action.equals("M") || action.equals("B")) {
            p = sistema.PROVINCIA_JPA_CONTROLLER.findProvincia(id);
            id = p.getId();
            nombre = p.getNombre();
        }
%>
<form role="form" id="formPais">
    <%if (action.equals("A") || action.equals("M")) {%>
    <div class="form-group">
        <label>Nombre</label>
        <input class="form-control" required="" id="inputNombre" placeholder="Ingrese el nombre de la provincia" value="<%=nombre%>">
    </div>    
    <%} else {%>
    <div class="alert alert-warning">¿Esta seguro que desea eliminar la provincia? <strong><%=p.getNombre()%></strong></div>
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
                url: "lugares/provincias/action.jsp",
                data: {
                    id: '<%=id%>',
                    idPais: '<%=idPais%>',
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