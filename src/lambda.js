import 'babel-polyfill';
import { getMessage } from './lib/example.js';

// Entrypoint for AWS Lambda
function handler(event, context) {
  if(event.type) {
    return context.succeed(getMessage(event.type));
  }
  return context.fail('No type provided!');
};

export {
  handler
}
