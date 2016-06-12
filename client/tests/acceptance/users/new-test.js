import { test } from 'qunit';
import moduleForAcceptance from 'world-times/tests/helpers/module-for-acceptance';

import {
  authenticateSession,
  invalidateSession
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

test ('redirect to login if not signed in', function(assert) {
  invalidateSession(this.application);
  visit('/users/new');
  andThen(function() {
    assert.equal(currentURL(), '/');
  });
});
