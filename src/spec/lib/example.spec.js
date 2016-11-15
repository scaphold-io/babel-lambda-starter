import { getMessage } from '../../lib/example.js';

describe('getMessage', function() {

  it('should greet my type of world', function() {
    expect(getMessage('my awesomesauce')).toBe('Hello my awesomesauce world!');
  });
});