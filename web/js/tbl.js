/*
 * CICHA 04/02/2014
 * Este es un plugin creado por mi para la seleccion de tablas y la obtencion de las filas seleccionadas
 * Es de la misma forma que crean plugins para jquery :) 
 */
(function($) {
    var attrId = "idObj";
    function tblPrivateSelected(fila, tbl) {
        cambioSeleccion = false;
        if ($(fila).hasClass('success')) {
            $(fila).removeClass('success');
            cambioSeleccion = true;
        } else {
            if (typeof $(fila).attr(attrId) !== 'undefined') {
                $(fila).addClass('success').siblings().removeClass('success');
                cambioSeleccion = true;
            }
        }
        if (cambioSeleccion) {
            var idObj = $(tbl).tblGetSelected();
            $(tbl).trigger("tblSelectedChange", [idObj]);
        }
    }



    $.fn.extend({
        tblSelectable: function() {
            this.each(function() {
                var $this = $(this);
                $this.on('click', 'tbody tr', function(event) {
                    tblPrivateSelected(this, $this);
                });
            });
        }
    });
    $.fn.extend({
        tblGetSelected: function() {
            var res = $(this).find('tbody .success');
            if (res.size() == 0) {
                return -1;
            } else {
                idObj = res.attr(attrId);
                if (typeof idObj != 'undefined') {
                    return idObj;
                } else {
                    return -1;
                }
            }
        }
    });
    $.fn.extend({
        tblSetSelected: function(idObj) {
            var res = $(this).find("tbody tr[" + attrId + "='" + idObj + "']");
            if (res.size() != 0) {
                tblPrivateSelected(res, this);
            }
        }
    });
})(jQuery)


