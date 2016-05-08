$(document).ready(function(){
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
 