<%-- 
    Document   : actionVisual
    Created on : 12-sep-2015, 10:34:02
    Author     : marcelo
--%>
<%@page import="modelo.Producto"%>
<%@page import="persistencia.sistema"%>
<%@page import="modelo.Categoria"%>
<%
    try {
        Producto p;
        String action = "A";
        Integer id = -1;
        String codigo = "";
        String descripcion = "";
        String cantidad = "";
        String precioCosto = "";
        String precioVenta = "";
        String stockMinimo = "";
        Integer idCategoria = -1;
        if (request.getParameter("action") != null) {
            action = request.getParameter("action");
        }
        if (request.getParameter("id") != null) {
            id = Integer.valueOf(request.getParameter("id"));
        }
        if (action.equals("M") || action.equals("B")) {
            p = sistema.PRODUCTO_JPA_CONTROLLER.findProducto(id);
            codigo = p.getCodigo();
            descripcion = p.getDescripcion();
            cantidad = sistema.PRODUCTO_JPA_CONTROLLER.getProductoCount(codigo).toString();
            precioCosto = p.getPrecioCosto().toString();
            precioVenta = p.getPrecioVenta().toString();
            stockMinimo = p.getStockMinimo().toString();
            idCategoria = p.getCategoria().getId();
        }
%>
<form id="formPro">
    <%if (action.equals("A") || action.equals("M")) {%>
    <div class="form-group">
        <label>Código</label>
        <input type="text" class="form-control" required="" id="inputCodigo" placeholder="Código" value="<%=codigo%>">
    </div>
    <div class="form-group">
        <label>Descripción</label>
        <input type="text" class="form-control" required="" id="inputDescripción" placeholder="Descripción" value="<%=descripcion%>">
    </div>
    <div class="form-group">
        <label>Cantidad</label>
        <input type="number" min="1" class="form-control" required="" id="inputCantidad" placeholder="Cantidad" value="<%=cantidad%>">
    </div>
    <div class="form-group">
        <label>Precio Costo</label>
        <input type="text" min="1" class="form-control moneda" required="" id="inputPrecioCosto" placeholder="Precio Costo" value="<%=precioCosto%>">
    </div>
    <div class="form-group">
        <label>Precio Venta</label>
        <input type="text" min="1" class="form-control moneda" required="" id="inputPrecioVenta" placeholder="Precio Venta" value="<%=precioVenta%>">
    </div>
    <div class="form-group">
        <label>Stock Mínimo</label>
        <input type="number" min="1" class="form-control" required="" id="inputStockMinimo" placeholder="Stock Mínimo" value="<%=stockMinimo%>">
    </div>
    <div class="form-group">
        <label>Categoría</label>
        <select class="form-control" required="" id="inputCategoria">
            <option value="">Seleccione una categoría</option>
            <%for (Categoria c1 : sistema.CATEGORIA_JPA_CONTROLLER.findCategoriaEntities()) {%>
            <option value="<%= c1.getId()%>"><%= c1.getNombre()%></option>
            <%}%>
        </select>
    </div>
    <%} else {%>
    <div class="alert alert-warning">¿Esta seguro que desea eliminar el producto? <strong><%=codigo%></strong></div>
    <%}%>
    <button type="submit" class="btn btn-default">Aceptar</button>
    <button type="reset" onclick="$('#modal').modal('hide')" class="btn btn-default">Cancelar</button>
</form>
<div id="actionResult">
</div>
<script>
    $(document).ready(function () {
        $(".moneda").priceFormat({
            prefix: '',
            centsSeparator: '.',
            thousandsSeparator: '.'
        });
        $("#inputCategoria").val('<%=idCategoria%>').attr("selected", "selected");
        $("#formPro").submit(function (e) {
            e.preventDefault();
            $.ajax({
                dataType: 'json',
                url: "productos/action.jsp",
                data: {
                    id: '<%=id%>',
                    action: '<%= action%>',
                    codigo: $("#inputCodigo").val(),
                    descripcion: $("#inputDescripción").val(),
                    cantidad: $("#inputCantidad").val(),
                    precioCosto: $("#inputPrecioCosto").val(),
                    precioVenta: $("#inputPrecioVenta").val(),
                    stockMinimo: $("#inputStockMinimo").val(),
                    idCategoria: $("#inputCategoria").val()
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