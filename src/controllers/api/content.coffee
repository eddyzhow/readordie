exports.index = (req, res) ->
  # text = "Sorry, this isn't the text from your page. We're busy working on this service, but it isn't quite finished yet. Please show us some support by tweeting to @readordietoday."
  text = "In reading, it turns out that most of our time and energy is spent actually moving our eyes to the next word. But when we keep words in a static space, our eyes can relax. That's why you're now reading many times faster than the average person."
  tokens = text.split(' ').map (t) ->
    {term: t, duration: 1.0, pause: 1.0}

  res.send
    n: tokens.length
    tokens: tokens

