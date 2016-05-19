// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs

//= require_tree .
//= require materialize-sprockets
//= require materialize/extras/nouislider
$(document).ready(function(){
    $('select').material_select();
     $(".button-collapse").sideNav();
     $(".field").addClass("input-field col s12 m4 l4");
     $(".field-b").addClass("col s12 m4 l4");
     $(".actions").addClass("btn waves-effect waves-light");
     $(".crud-links").addClass("btn waves-effect red");
     $(".show p").addClass("card deep-orange lighten-1 col s12 m4 l4");
     $("table").addClass("responsive-table");
    
     $('.datepicker').pickadate({
    selectMonths: true, // Creates a dropdown to control month
    selectYears: 80, // Creates a dropdown of 15 years to control year
    // Strings and translations
    monthsFull: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
    monthsShort: ['Ene', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
    weekdaysFull: ['Domingo', 'Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sabado'],
    weekdaysShort: ['Dom', 'Lun', 'Mar', 'Mie', 'Jue', 'Vie', 'Sab'],
    showMonthsShort: undefined,
    showWeekdaysFull: undefined,
    
    // Buttons
    today: 'Hoy',
    clear: 'Limpiar',
    close: 'Cerrar',
    
    // Accessibility labels
    labelMonthNext: 'Siguente mes',
    labelMonthPrev: 'Mes anterior',
    labelMonthSelect: 'Seleciona un mes',
    labelYearSelect: 'Seleciona un año',
     });
});
