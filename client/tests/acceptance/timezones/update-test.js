import { test } from 'qunit';
import moduleForAcceptance from 'world-times/tests/helpers/module-for-acceptance';

import {
  invalidateSession,
  authenticateSession
} from 'world-times/tests/helpers/ember-simple-auth';

moduleForAcceptance('Acceptance | timezones/update');

test('visiting /timezone/:id/edit', function(assert) {
  authenticateSession(this.application);
  const timezone = server.create('timezone');
  visit(`/timezones/${timezone.id}/edit`);

  andThen(function() {
    assert.equal(currentURL(), `/timezones/${timezone.id}/edit`);
  });
});

test('redirects to / when not authenticated', function(assert) {
  invalidateSession(this.application);
  visit('/timezones/1/edit');

  andThen(function() {
    assert.equal(currentURL(), '/');
  });
});

test('updating record', function(assert) {
  authenticateSession(this.application);
  const timezone = server.create('timezone');
  visit(`/timezones/${timezone.id}/edit`);
  andThen(function() {
    fillIn('#name', 'test');
    fillIn('#city', 'test');
    fillIn('#difference', '-5');
    click('button[type="submit"]');
    andThen(function() {
      assert.equal(currentURL(), '/timezones/1');
    });
  });
});
