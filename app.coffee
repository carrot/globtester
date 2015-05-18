axis         = require 'axis'
autoprefixer = require 'autoprefixer-stylus'
rupture      = require 'rupture'
browserify   = require 'roots-browserify'

module.exports =
  ignores: ['readme.md', '**/layout.*', '**/_*', '.gitignore', 'ship.conf', '.editorconfig', 'license.md']
  watcher_ignores: ['node_modules']

  extensions: browserify(files: 'assets/js/main.coffee', out: 'js/build.js')

  stylus:
    use: [axis(), autoprefixer(), rupture()]
