import { test } from 'qunit';
import moduleForAcceptance from 'world-times/tests/helpers/module-for-acceptance';
import Ember from 'ember';

import {
  currentSession,
  invalidateSession ,
  authenticateSession
} from 'world-times/tests/helpers/ember-simple-auth';

moduleForAcceptance('Acceptance | timezones');

test('visiting /timezones', function(assert) {
  authenticateSession(this.application);
  console.log('aaaa');
  visit('/timezones');
  const sesh = currentSession(this.application);
  const isAuthed = Ember.get(sesh, 'isAuthenticated');

  //visit('/timezones');

  andThen(function() {
    console.log(isAuthed);
    assert.equal(currentURL(), '/timezones');
  });
});
