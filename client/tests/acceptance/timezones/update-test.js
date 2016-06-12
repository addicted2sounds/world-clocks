import { test } from 'qunit';
import moduleForAcceptance from 'world-times/tests/helpers/module-for-acceptance';

import {
  currentSession,
  invalidateSession ,
  authenticateSession
} from 'world-times/tests/helpers/ember-simple-auth';

moduleForAcceptance('Acceptance | timezones/update');

test('update record from list', function(assert) {
  authenticateSession(this.application);
  this.server.createRecord
  visit('/timezones/1');

  andThen(function() {
    assert.equal(currentURL(), '/timezones/new');
  });
});

//test('redirects to / when not authenticated', function(assert) {
  //invalidateSession(this.application);
  //visit('/timezones/new');

  //andThen(function() {
    //assert.equal(currentURL(), '/');
  //});
//});
//test('visiting /timezones/update', function(assert) {
  //visit('/timezones/update');

  //andThen(function() {
    //assert.equal(currentURL(), '/timezones/update');
  //});
//});
