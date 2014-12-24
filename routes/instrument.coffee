router = require('express').Router()

router.get '/', (req, res) ->
  res.json
    wii: ['GET']
    #ios: ['GET']

router.get '/wii', (req, res) ->
  verbs = ['GET', 'POST', 'DELETE']
  res.json
    mote:   verbs
    #guitar: verbs

module.exports = router
