var mm = require('minimatch'),
    $ = require('zepto-browserify').$;

validate();

$('.prompt').on('keyup', validate);
$('.results').on('keyup', validate);

function validate() {
  var results = $('.results').children();
  var prompt = $('.prompt').val();

  results.forEach(function(div){
    if (mm($(div).text(), prompt)) {
      $(div).addClass('match');
    } else {
      $(div).removeClass('match');
    }
  });
}
