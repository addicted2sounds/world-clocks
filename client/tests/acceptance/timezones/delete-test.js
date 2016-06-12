import { test } from 'qunit';
import moduleForAcceptance from 'world-times/tests/helpers/module-for-acceptance';

moduleForAcceptance('Acceptance | timezones/delete');

import {
  authenticateSession
} from 'world-times/tests/helpers/ember-simple-auth';

test('destroying timezone', function(assert) {
  authenticateSession(this.application);
  server.create('timezone');
  visit('/timezones');
  click('.delete');

  andThen(function() {
    assert.equal(currentURL(), '/timezones');
    assert.equal($('table tbody tr').length, 0);
  });
});
