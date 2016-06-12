import { test } from 'qunit';
import moduleForAcceptance from 'world-times/tests/helpers/module-for-acceptance';

import {
  authenticateSession
} from 'world-times/tests/helpers/ember-simple-auth';

moduleForAcceptance('Acceptance | users/new');

test('creates new user', function(assert) {
  authenticateSession(this.application);
  visit('/users/new');

  andThen(function() {
    fillIn('#email', 'test@test.dev');
    fillIn('#password', '123');
    click('button');
  });

  andThen(function() {
    assert.equal(currentURL(), '/users/1');
  });
});
