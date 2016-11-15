'use strict';

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.handler = undefined;

require('babel-polyfill');

var _example = require('./lib/example.js');

// Entrypoint for AWS Lambda
function handler(event, context) {
  if (event.type) {
    return context.succeed((0, _example.getMessage)(event.type));
  }
  return context.fail('No type provided!');
};

exports.handler = handler;
//# sourceMappingURL=lambda.js.map