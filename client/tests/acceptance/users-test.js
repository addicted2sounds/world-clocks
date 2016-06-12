import { test } from 'qunit';
import moduleForAcceptance from 'world-times/tests/helpers/module-for-acceptance';

import {
  invalidateSession,
  authenticateSession
} from 'world-times/tests/helpers/ember-simple-auth';

moduleForAcceptance('Acceptance | users');

test('visiting /timezones', function(assert) {
  authenticateSession(this.application);
  visit('/users');

  andThen(function() {
    assert.equal(currentURL(), '/users');
  });
});

test('redirects to / when unauthorized', function(assert) {
  invalidateSession(this.application);
  visit('/timezones');
  andThen(function() {
    assert.equal(currentURL(), '/');
  });
});
