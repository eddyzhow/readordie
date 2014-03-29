exports.index = (req, res) ->
  text = "Sorry, this isn't the text from your page. We're busy working on this service, but it isn't quite finished yet. Please show us some support by tweeting to @readordietoday."
  tokens = text.split(' ').map (t) ->
    {term: t, duration: 1.0, pause: 1.0}

  res.send
    n: tokens.length
    tokens: tokens

