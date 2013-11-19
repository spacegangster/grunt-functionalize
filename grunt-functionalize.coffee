functionalize = (grunt) ->
  { bind
    each
    map
    partial
    partialRight } = (require 'lodash')

  { file
    loadNpmTasks
    registerTask } = grunt


  log = (bind grunt.log.writeln, grunt.log)
  
  concat = (list, lists...) ->
    list.concat.apply(list, lists)
  
  prepend = (prefix, string) ->
    prefix.concat(string)


  {
    concat
    contrib       : (partialRight map, (partial prepend, 'grunt-contrib-'))
    loadNpmTasks  : (partialRight each, loadNpmTasks)
    log
    readJSON      : (bind file.readJSON, file)
    registerTasks : (partialRight each, (bind Function::apply, registerTask, grunt))
  }
module.exports = functionalize
