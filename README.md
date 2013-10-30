Package contains few sweet functions, for those who likes clean and concise code.
```coffeescript
# potential Gruntfile.coffee
module.exports = (grunt) ->
  { concat          # concatenate lists
    contrib         # prepends 'grunt-contrib-' to list of strings
    initConfig      # vs grunt.initConfig
    loadNpmTasks    # takes a list of npm tasks
    log             # grunt.log.writeln
    readJSON        # grunt.file.readJSON
    registerTasks   # special flavor of grunt.registerTask. Works with list of lists.
  } = ((require 'grunt-functionalize') grunt)

  initConfig
    pkg: (readJSON 'package.json')
    # ... your usual config ...

  (loadNpmTasks (concat (contrib [ 'clean'
                                   'coffee'
                                   'copy'
                                   'less'
                                   'uglify'
                                   'watch' ]), 
                                 [ 'grunt-groundskeeper' ]) )
  (registerTasks [ [ 'compile:dev', [ 'less:development'
                                      'coffee'             ] ]
                   [ 'dev'        , [ 'compile:dev'
                                      'copy:lib_js'
                                      'copy:jquery-ui.css' ] ]
                   [ 'build'      , [ 'clean:js'
                                      'less:production'
                                      'coffee'
                                      'uglify'
                                      'copy:lib_build'
                                      'copy:build_js'      ] ]
                   [ 'default'    , [ 'dev'                ] ] ] )
