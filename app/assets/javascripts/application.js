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
//= require bootstrap-sprockets
//= require bootstrap-wysihtml5
//= require flipclock.min
//= require_tree .

$(document).ready(function() {

  $('.wysihtml5').each(function(i, elem) {
    $(elem).wysihtml5({ toolbar:{ "fa": true, "html": true } });
  });

  var date = new Date(2016, 8, -30,0,0,0);
  var today = new Date();
  var dif = date.getTime() - today.getTime();
  var timeLeft = Math.abs(dif/1000)/60;

  var clock = new FlipClock($('.your-clock'), {
    autoStart: false,
    clockFace: 'DailyCounter',
    countdown: true
  });

  clock.setTime(timeLeft);
  clock.start();

  $(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();
  });

});
