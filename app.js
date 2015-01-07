'use strict';

require('coffee-script').register();

var mongo = require('mongoose');
var app = require('express')();

app.use(require('body-parser').json());

app.use('/', require('./routes/index'));
app.use('/instrument', require('./routes/instrument'));
app.use('/instrument/wii/mote', require('./routes/wiimote'));
app.use('/instrument/wii/guitar', require('./routes/wiiguitar'));

mongo.connect('mongodb://localhost/noiserver');

var server = app.listen(3000, function() {
  console.log('Listening on port %d', server.address().port);
});
