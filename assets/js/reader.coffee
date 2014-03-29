class @ReadOrDieReader
  offsetX: 282
  offsetY: 94

  constructor: (canvasEl) ->
    @canvasEl = $(canvasEl)
    @originalWidth = @canvasEl.width()
    @originalHeight = @canvasEl.height()
    @setContext()
    # @enableHighRes()
    @setFontStyles()

  setContext: ->
    @ctx = @canvasEl[0].getContext('2d')

  # backingScale: ->
  #   if 'devicePixelRatio' of window
  #     if window.devicePixelRatio > 1
  #       return window.devicePixelRatio
  #   1

  # enableHighRes: ->
  #   @canvasEl.width @originalWidth * @backingScale()
  #   @canvasEl.height @originalHeight * @backingScale()
  #   @setContext()

  width: -> @canvasEl.width()
  height: -> @canvasEl.height()

  centerCharPos: (term) ->
    len = term.length

    if len is 1
      0
    else if len in [2..5]
      1
    else if len in [6..8]
      2
    else
      3

  splitAtCenter: (term) ->
    idx = @centerCharPos term

    left = term[0...idx]
    center = term[idx...idx+1]
    right = term[idx+1..-1]

    [left, center, right]

  measureWidth: (term) ->
    @ctx.measureText(term).width

  offset: (term) ->
    [left, center, right] = @splitAtCenter term

    first = @measureWidth left
    second = @measureWidth left + center

    offset = second + (second - first) / 2

    console.info offset

    @offsetX - offset

  setFontStyles: ->
    @ctx.font = '48px Arial'

  draw: (term) ->
    @clear()
    parts = @splitAtCenter term
    x = @offset term

    for i, part of parts
      color = if i % 2 == 1 then 'red' else 'black'
      @ctx.setFillColor color
      @ctx.fillText part, x, @offsetY
      x += @measureWidth part
    true

  clear: ->
    @ctx.clearRect 0, 0, @width(), @height()

