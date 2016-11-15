// Example lib file that gets bundled with your Lambda.

function getMessage(type) {
  return 'Hello ' + type + ' world!';
}

export {
  getMessage
};
