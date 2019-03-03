mm = require('micromatch')
zlib = require('zlib')
qs = require('query-string')
$ = require('zepto-browserify').$;

#
# utils
#

validate = ->
  results = $('.results').children()
  prompt = $('.prompt').val()

  for div in results
    method = if mm($(div).text(), prompt) then 'add' else 'remove'
    $(div)["#{method}Class"]('match')

deflate_hash = (input, key) ->
  zlib.deflate input, (err, res) ->
    obj = {}
    obj[key] = res.toString('base64')
    location.hash += qs.stringify(obj)
    location.hash += '&'

#
# micromatch validation
#

validate()
$('.prompt').on('keyup', validate)
$('.results').on('keyup', validate)

#
# "save" functionality
#

params = qs.parse(location.hash)

if Object.keys(params).length

  zlib.inflate new Buffer(params.p || params['#p'], 'base64'), (err, res) ->
    $('.prompt').val(String(res))

  zlib.inflate new Buffer(params.r || params['#r'], 'base64'), (err, res) ->
    $('.results').html(String(res))

$('.save').on 'click', ->
  if (location.hash.length) then location.hash = ''
  deflate_hash($('.prompt').val(), 'p')
  deflate_hash($('.results').html(), 'r')
