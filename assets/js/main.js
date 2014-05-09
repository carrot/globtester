var mm = require('minimatch'),
    zlib = require('zlib'),
    qs = require('query-string'),
    $ = require('zepto-browserify').$;

//
// minimatch validation
//

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

//
// "save" functionality
//

var params = qs.parse(location.hash)

if (Object.keys(params).length) {

  zlib.inflate(new Buffer(params.p || params['#p'], 'base64'), function(err, res){
    $('.prompt').val(String(res));
  });

  zlib.inflate(new Buffer(params.r || params['#r'], 'base64'), function(err, res){
    $('.results').html(String(res));
  });
}

$('.save').on('click', function(){
  if (location.hash.length) location.hash = ''
  deflate_hash($('.prompt').val(), 'p')
  deflate_hash($('.results').html(), 'r')
});

function deflate_hash(input, key){
  zlib.deflate(input, function(err, res){
    obj = {}; obj[key] = res.toString('base64')
    location.hash += qs.stringify(obj);
    location.hash += '&'
  });
}
