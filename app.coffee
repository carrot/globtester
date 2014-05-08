axis         = require 'axis-css'
autoprefixer = require 'autoprefixer-stylus'
rupture      = require 'rupture'

module.exports =
  ignores: ['readme.md', '**/layout.*', '**/_*', '.gitignore']
  watcher_ignores: ['node_modules']

  stylus:
    use: [axis(), autoprefixer(), rupture()]
