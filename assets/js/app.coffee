#= require lib/jquery-2.1.0.min.js
#= require lib/mousetrap.min
#= require data
#= require canvas
#= require player


$ ->
  canvas = new Canvas $('#canvas')
  canvas.draw('Hello')

  player = new Player(canvas, window.data.tokens)
  setTimeout player.play, 2000

  Mousetrap.bind 'space', ->
    player.toggle()
    false

  Mousetrap.bind 'left', ->
    player.drawPrev()
    false

  Mousetrap.bind 'right', ->
    player.drawNext()
    false

  Mousetrap.bind 'up', ->
    player.faster()
    console.info player.wpm, 'wpm'
    false

  Mousetrap.bind 'down', ->
    player.slower()
    console.info player.wpm, 'wpm'
    false

