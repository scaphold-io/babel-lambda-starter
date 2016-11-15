import { handler } from '../bin/lambda'; 
var mockEvent = require('./localEvent.json');

handler(mockEvent, {
  succeed: function(result) {
    console.log('[SUCCEED] ', result);
  },
  fail: function(result) {
    console.log('[FAIL] ', result);
  }
});
