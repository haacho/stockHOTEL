/*
 * 100%  CICHA 20/02/2014 (idea y programacion)
 * Este es un plugin creado por mi para la creacion de botones de acciones
 * Es de la misma forma que crean plugins para jquery :) 
 */
(function($) {

    function btnActionsIsEnabled(btn) {
        if ($(btn).prop("tagName") === "A") {//es del tipo small
            return !$(btn).hasClass("grey");
        } else {// es un button es del tipo grande
            return !$(btn).prop('disabled');
        }
    }
    function btnActionsSetEnabled(btn, enabled) {
        //alert($(btn).prop("tagName"));
        if ($(btn).prop("tagName") === "A") {//es del tipo small
            if (enabled) {
                $(btn).removeClass("grey");
            } else {
                $(btn).addClass("grey");
            }
        } else {// es un button es del tipo grande
            if (enabled) {
                //$(btn).removeClass("btn-disabled");
                $(btn).prop('disabled', false);
            } else {
                //$(btn).addClass("btn-disabled");
                $(btn).prop('disabled', true);
            }
        }
    }
    function btnActionsConfEnnabled(idObj, btnRem, btnUpd) {
        if (idObj === -1) {
            btnActionsSetEnabled(btnRem, false);
            btnActionsSetEnabled(btnUpd, false);
        } else {
            btnActionsSetEnabled(btnRem, true);
            btnActionsSetEnabled(btnUpd, true);
        }
    }
    $.fn.extend({
        btnActions: function(param) {
            this.each(function() {
                //configuraciones por defecto
                var conf = {
                    type: 'small',
                    efect: true
                };
                //si manda alguna configuracion por el parametro
                if (typeof param !== 'undefined') {
                    if (typeof param.actions !== 'undefined') {
                        conf.actions = param.actions;
                    }
                    if (typeof param.type !== 'undefined') {
                        conf.type = param.type;
                    }
                    if (typeof param.add !== 'undefined') {
                        conf.add = param.add;
                    }
                    if (typeof param.rem !== 'undefined') {
                        conf.rem = param.rem;
                    }
                    if (typeof param.upd !== 'undefined') {
                        conf.upd = param.upd;
                    }
                    if (typeof param.abm !== 'undefined') {
                        conf.abm = param.abm;
                    }
                    if (typeof param.tblSelect !== 'undefined') {
                        conf.tblSelect = param.tblSelect;
                    }
                    if (typeof param.efect !== 'undefined') {
                        conf.efect = param.efect;
                    }
                    if (typeof param.idObj !== 'undefined') {
                        conf.idObj = param.idObj;
                    }
                }

                //configuracion por defecto
                if ($(this).find("[data-typeAction]").size() === 0) {//todavia no existen los botones
                    if (typeof conf.actions === 'undefined') {//si no se definio las acciones
                        conf.actions = 'ABM';//acciones por defecto
                    }
                }

                //CREANDO LOS BOTONES
                if (typeof conf.actions !== 'undefined') {
                    if (conf.efect && conf.type === 'small') {
                        $(this).append("<div class=\"visible-md visible-lg hidden-sm hidden-xs action-buttons\"></div>");
                    } else {
                        if (conf.type === 'small') {
                            $(this).append("<div style='display:inline'></div>");
                        } else {
                            $(this).append("<div class='btn-group'></div>");
                        }
                    }
                    var divBtn = $(this).find("div:last-child");
                    if (conf.actions.indexOf('A') !== -1) {
                        if (conf.type === 'small') {
                            $(divBtn).append("<a class=\"green\" data-typeAction='A'><i class=\"icon-plus-sign bigger-150 \" data-toggle=\"tooltip\" title=\"Crear\"></i></a>");
                        } else {
                            $(divBtn).append("<button data-typeAction='A' class=\"btn btn-primary  btn-sm\" ><i class=\"icon-plus-sign \"></i>Nuevo</button>");
                        }
                    }
                    if (conf.actions.indexOf('B') !== -1) {
                        if (conf.type === 'small') {
                            $(divBtn).append("<a data-typeAction='B' class=\"red\"><i class=\"icon-trash bigger-150 \" data-toggle=\"tooltip\" title=\"Eliminar\"></i></a>");
                        } else {
                            $(divBtn).append("<button data-typeAction='B' class=\"btn btn-danger   btn-sm\"  ><i class=\"icon-trash \"></i>Eliminar</button>");
                        }
                    }
                    if (conf.actions.indexOf('M') !== -1) {
                        if (conf.type === 'small') {
                            $(divBtn).append("<a data-typeAction='M'><i class=\"icon-pencil bigger-150\" data-toggle=\"tooltip\" title=\"Modificar\"></i></a>");
                        } else {
                            $(divBtn).append("<button data-typeAction='M' class=\"btn btn-success  btn-sm\"  ><i class=\"icon-pencil \"></i>Modificar</button>");
                        }
                    }
                }


                var btnAdd = $(this).find("[data-typeAction='A']");
                var btnRem = $(this).find("[data-typeAction='B']");
                var btnUpd = $(this).find("[data-typeAction='M']");

                //AGREGANDO LOS EVENTOS
                if (typeof conf.add !== 'undefined') {
                    $(btnAdd).click(function() {
                        if (btnActionsIsEnabled(btnAdd)) {
                            conf.add({idObj: conf.idObj, action: 'A'});
                        }

                    });
                }
                if (typeof conf.rem !== 'undefined') {
                    $(btnRem).click(function() {
                        if (btnActionsIsEnabled(btnRem)) {
                            conf.rem({idObj: conf.idObj, action: 'B'});
                        }
                    });
                }
                if (typeof conf.upd !== 'undefined') {
                    $(btnUpd).click(function() {
                        if (btnActionsIsEnabled(btnUpd)) {
                            conf.upd({idObj: conf.idObj, action: 'M'});
                        }
                    });
                }
                if (typeof conf.abm !== 'undefined') {
                    $(btnUpd).click(function() {
                        if (btnActionsIsEnabled(btnUpd)) {
                            conf.abm({idObj: conf.idObj, action: 'M'});
                        }
                    });
                    $(btnAdd).click(function() {
                        if (btnActionsIsEnabled(btnAdd)) {
                            conf.abm({idObj: conf.idObj, action: 'A'});
                        }
                    });
                    $(btnRem).click(function() {
                        if (btnActionsIsEnabled(btnRem)) {
                            conf.abm({idObj: conf.idObj, action: 'B'});
                        }
                    });
                }


                //Configurando botones si es que se le paso una tabla asociada
                if (typeof conf.tblSelect !== 'undefined') {
                    //configuro segun seleccion actual de la tabla
                    btnActionsConfEnnabled($(conf.tblSelect).tblGetSelected(), btnRem, btnUpd);
                    //asigno al evento
                    $(conf.tblSelect).on("tblSelectedChange", function(event, idObj) {
                        btnActionsConfEnnabled(idObj, btnRem, btnUpd);
                    });

                }
            });
        }
    });



    $.fn.extend({
        btnActionEnable: function(param) {
            this.each(function() {
                var $this = $(this);
                if (typeof param !== 'undefined') {
                    param = 'ABM';
                }
                if (param.indexOf('A') !== -1) {
                    btnActionsSetEnabled($(this).find("[data-typeAction='A']"), true);
                }
                if (param.indexOf('B') !== -1) {
                    btnActionsSetEnabled($(this).find("[data-typeAction='B']"), true);
                }
                if (param.indexOf('M') !== -1) {
                    btnActionsSetEnabled($(this).find("[data-typeAction='M']"), true);
                }
            });
        }
    });
    $.fn.extend({
        btnActionTbl: function(tbl) {
            var $this = $(this);
            this.each(function() {
                if ($(tbl).tblGetSelected() === -1) {
                    btnActionsSetEnabled($this, false);
                }
                $(tbl).on("tblSelectedChange", function(event, idObj) {
                    btnActionsSetEnabled($this, idObj !== -1);
                });
            });
        }
    });
    $.fn.extend({
        btnActionDisable: function(param) {
            this.each(function() {
                var $this = $(this);
                if (typeof param !== 'undefined') {
                    param = 'ABM';
                }
                if (param.indexOf('A') !== -1) {
                    btnActionsSetEnabled($(this).find("[data-typeAction='A']"), false);
                }
                if (param.indexOf('B') !== -1) {
                    btnActionsSetEnabled($(this).find("[data-typeAction='B']"), false);
                }
                if (param.indexOf('M') !== -1) {
                    btnActionsSetEnabled($(this).find("[data-typeAction='M']"), false);
                }
            });
        }
    });
})(jQuery)