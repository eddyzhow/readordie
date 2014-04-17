wordcut = require '../../init_wordcut'

exports.index = (req, res) ->
  tokens = wordcut.cut(req.query.terms).split('|').map (t) ->
    {
      term: t
      duration: 1.0
      pause: 1.0
    }

  res.send
    n: tokens.length
    tokens: tokens
