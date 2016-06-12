import { test } from 'qunit';
import moduleForAcceptance from 'world-times/tests/helpers/module-for-acceptance';

moduleForAcceptance('Acceptance | users/delete');

import {
  authenticateSession
} from 'world-times/tests/helpers/ember-simple-auth';

test('destroying user', function(assert) {
  authenticateSession(this.application);
  server.create('user');
  visit('/users');
  click('.delete');

  andThen(function() {
    assert.equal(currentURL(), '/users');
    assert.equal($('table tbody tr').length, 0);
  });
});
