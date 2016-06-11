import { test } from 'qunit';
import moduleForAcceptance from 'world-times/tests/helpers/module-for-acceptance';

import {
  currentSession,
  invalidateSession ,
  authenticateSession
} from 'world-times/tests/helpers/ember-simple-auth';

moduleForAcceptance('Acceptance | create timezone');

test('visiting /timezones/new', function(assert) {
  authenticateSession(this.application);
  visit('/timezones/new');

  andThen(function() {
    assert.equal(currentURL(), '/timezones/new');
  });
});

test('redirects to / when not authenticated', function(assert) {
  invalidateSession(this.application);
  visit('/timezones/new');

  andThen(function() {
    assert.equal(currentURL(), '/');
  });
});

test('creates new timezone', function(assert) {
  authenticateSession(this.application);
  visit('/timezones/new');
  andThen(function() {
    fillIn('#name', 'test');
    fillIn('#city', 'test');
    fillIn('#difference', '-5');
    click('button');
    andThen(function() {
      assert.equal(currentURL(), '/timezones/1');
    });
  });
});

