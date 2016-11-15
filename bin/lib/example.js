'use strict';

Object.defineProperty(exports, "__esModule", {
  value: true
});
// Example lib file that gets bundled with your Lambda.

function getMessage(type) {
  return 'Hello ' + type + ' world!';
}

exports.getMessage = getMessage;
//# sourceMappingURL=example.js.map