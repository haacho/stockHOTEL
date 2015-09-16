<%-- 
    Document   : actionVisual
    Created on : 12-sep-2015, 10:34:02
    Author     : marcelo
--%>
<%@page import="modelo.Localidad"%>
<%@page import="modelo.Cliente"%>
<%@page import="modelo.Producto"%>
<%@page import="persistencia.sistema"%>
<%@page import="modelo.Categoria"%>
<%
    try {
        Cliente c;
        String action = "A";
        Integer id = -1;
        String razonSocial = "";
        String cuit = "";
        String telefono = "";
        String calle = "";
        String numero = "";
        Integer idLocalidad = -1;
        if (request.getParameter("action") != null) {
            action = request.getParameter("action");
        }
        if (request.getParameter("id") != null) {
            id = Integer.valueOf(request.getParameter("id"));
        }
        if (action.equals("M") || action.equals("B")) {
            c = sistema.CLIENTE_JPA_CONTROLLER.findCliente(id);
            razonSocial = c.getRazonSocial();
            cuit = c.getCuit();
            telefono = c.getTelefono();
            calle = c.getDireccion().getCalle();
            numero = c.getDireccion().getNumero();
            idLocalidad = c.getDireccion().getLocalidad().getId();
        }
%>
<form id="formLocalidad">
    <%if (action.equals("A") || action.equals("M")) {%>
    <div class="form-group">
        <label>Razón Social</label>
        <input type="text" class="form-control" required="" id="inputRazonSocial" placeholder="Razón Social" value="<%=razonSocial%>">
    </div>
    <div class="form-group">
        <label>Cuit</label>
        <input type="text" class="form-control" required="" id="inputCuit" placeholder="Cuit" value="<%=cuit%>">
    </div>
    <div class="form-group">
        <label>Teléfono</label>
        <input type="text" class="form-control" required="" id="inputTelefono" placeholder="Teléfono" value="<%=telefono%>">
    </div>
    <div class="form-group">
        <label>Localidad</label>
        <select class="form-control" required="" id="inputLocalidad">
            <option value="">Seleccione una localidad</option>
            <%for (Localidad l : sistema.LOCALIDAD_JPA_CONTROLLER.findLocalidadEntities()) {%>
            <option value="<%= l.getId()%>"><%= l.getNombre()%></option>
            <%}%>
        </select>
    </div>
    <div class="form-group">
        <label>Calle</label>
        <input type="text" class="form-control" required="" id="inputCalle" placeholder="Calle" value="<%=calle%>">
    </div>
    <div class="form-group">
        <label>Número</label>
        <input type="text" class="form-control" required="" id="inputNumero" placeholder="Número" value="<%=numero%>">
    </div>
    <%} else {%>
    <div class="alert alert-warning">¿Esta seguro que desea eliminar el cliente? <strong><%=razonSocial%></strong></div>
    <%}%>
    <button type="submit" class="btn btn-default">Aceptar</button>
    <button type="reset" onclick="$('#modal').modal('hide')" class="btn btn-default">Cancelar</button>
</form>
<div id="actionResult">
</div>
<script>
    $(document).ready(function () {
        $("#inputLocalidad").val('<%=idLocalidad%>').attr("selected", "selected");
        $("#formLocalidad").submit(function (e) {
            e.preventDefault();
            $.ajax({
                dataType: 'json',
                url: "clientes/action.jsp",
                data: {
                    id: '<%=id%>',
                    action: '<%= action%>',
                    razonSocial : $("#inputRazonSocial").val(),
                    cuit : $("#inputCuit").val(),
                    telefono : $("#inputTelefono").val(),
                    calle : $("#inputCalle").val(),
                    numero : $("#inputNumero").val(),
                    idLocalidad : $("#inputLocalidad").val()
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