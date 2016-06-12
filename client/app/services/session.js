import Ember from 'ember';
import DS from 'ember-data';
import Session from "ember-simple-auth/services/session";

export default Session.extend({

  store: Ember.inject.service(),

  currentUser: Ember.computed('isAuthenticated', function() {
    if (this.get('isAuthenticated')) {
      const promise = this.get('store').queryRecord(
        'user', { current : 1 }
      );
      return DS.PromiseObject.create({ promise: promise });
    }
  })

});
