#= require lib/jquery-2.1.0.min.js
#= require reader


$ ->
  reader = window.reader = new ReadOrDieReader $('#canvas')
  reader.draw('Foooo')

