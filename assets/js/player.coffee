class @Player
  wpm: 300

  constructor: (canvas, tokens) ->
    @canvas = canvas
    @tokens = tokens
    @count = tokens.length
    @reset()

  reset: ->
    @manualPause = false
    @current = 0

  atEnd: ->
    @current >= @count

  playing: ->
    !@manualPause and !@atEnd()

  play: =>
    if @playing()
      @draw()
      token = @tokens[@current]
      setTimeout @play, @durationFor(token)
      @current++

  pause: ->
    @manualPause = true

  toggle: ->
    if @playing()
      @pause()
    else
      if @atEnd()
        @reset()
      else
        @manualPause = false
      @play()

  draw: ->
    token = @tokens[@current]
    @canvas.draw token.term

  drawPrev: ->
    @pause()
    @current-- if @current > 0
    @draw()

  drawNext: ->
    @pause()
    @current++ if @current < @count - 1
    @draw()

  durationFor: (token) ->
    60000 / @wpm * token.duration

  faster: ->
    @wpm += 50

  slower: ->
    if @wpm > 100
      @wpm -= 50
    else
      @wpm = 100

