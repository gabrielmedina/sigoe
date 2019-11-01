//= require jquery
//= require jquery-mask-plugin/dist/jquery.mask
//= require jquery.turbolinks
//= require jquery-ui
//= require select2/dist/js/select2
//= require fancybox/dist/js/jquery.fancybox
//= require project/alert
//= require alert_message
//= require turbolinks

document.addEventListener('turbolinks:load', function() {
  // Select 2
  $(".select2").select2();

  // fancybox
  $(".fancybox").fancybox({ parent: "body"});

  // Calendar
  $(".calendar").datepicker();

  // Translate datepicket
  $.datepicker.regional['pt-BR'] = {
    closeText: 'Fechar',
    prevText: '&#x3c;Anterior',
    nextText: 'Pr&oacute;ximo&#x3e;',
    currentText: 'Hoje',
    monthNames: ['Janeiro','Fevereiro','Mar&ccedil;o','Abril','Maio','Junho',
    'Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
    monthNamesShort: ['Jan','Fev','Mar','Abr','Mai','Jun',
    'Jul','Ago','Set','Out','Nov','Dez'],
    dayNames: ['Domingo','Segunda-feira','Ter&ccedil;a-feira','Quarta-feira','Quinta-feira','Sexta-feira','Sabado'],
    dayNamesShort: ['Dom','Seg','Ter','Qua','Qui','Sex','Sab'],
    dayNamesMin: ['Dom','Seg','Ter','Qua','Qui','Sex','Sab'],
    weekHeader: 'Sm',
    dateFormat: 'dd/mm/yy',
    firstDay: 0,
    isRTL: false,
    showMonthAfterYear: false,
    yearSuffix: ''};

  $.datepicker.setDefaults($.datepicker.regional['pt-BR']);

  // Macks
  $('.date').mask('00/00/0000');
  $('.cpf').mask('000.000.000-00');
  $('.time').mask('00:00');

  // Mobile menu
  $('.menu-mobile').on('click touchstart', function(e){
    $('html').toggleClass('menu-mobile-active');
    e.preventDefault();
  })
});
