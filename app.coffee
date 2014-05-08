axis         = require 'axis-css'
autoprefixer = require 'autoprefixer-stylus'
rupture      = require 'rupture'
browserify   = require 'roots-browserify'

module.exports =
  ignores: ['readme.md', '**/layout.*', '**/_*', '.gitignore']
  watcher_ignores: ['node_modules']

  extensions: browserify(files: 'assets/js/main.js', out: 'js/build.js')

  stylus:
    use: [axis(), autoprefixer(), rupture()]
