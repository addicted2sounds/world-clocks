import { test } from 'qunit';
import moduleForAcceptance from 'world-times/tests/helpers/module-for-acceptance';

import {
  invalidateSession,
  authenticateSession
} from 'world-times/tests/helpers/ember-simple-auth';

moduleForAcceptance('Acceptance | users/update');

test('visiting /users/:id/edit', function(assert) {
  authenticateSession(this.application);
  const user = server.create('user');
  visit(`/users/${user.id}/edit`);

  andThen(function() {
    assert.equal(currentURL(), `/users/${user.id}/edit`);
  });
});

test('redirects to / when not authenticated', function(assert) {
  invalidateSession(this.application);
  visit('/users/1/edit');

  andThen(function() {
    assert.equal(currentURL(), '/');
  });
});

test('updating record', function(assert) {
  authenticateSession(this.application);
  const user = server.create('user');
  visit(`/users/${user.id}/edit`);
  andThen(function() {
    fillIn('#email', 'test@test.dev');
    fillIn('#password', 'test');
    click('button[type="submit"]');
    andThen(function() {
      assert.equal(currentURL(), '/users/1');
    });
  });
});
