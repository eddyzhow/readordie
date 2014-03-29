#= require lib/jquery-2.1.0.min.js
#= require lib/mousetrap.min
#= require data
#= require canvas
#= require player


$ ->
  canvas = new Canvas $('#canvas')
  canvas.draw('Heeeeey')

  player = new Player(canvas, window.data.tokens)
  setTimeout player.play, 2000

  Mousetrap.bind 'space', ->
    player.toggle()

  Mousetrap.bind 'left', ->
    player.drawPrev()

  Mousetrap.bind 'right', ->
    player.drawNext()

  Mousetrap.bind 'up', ->
    player.faster()
    console.info player.wpm, 'wpm'

  Mousetrap.bind 'down', ->
    player.slower()
    console.info player.wpm, 'wpm'

