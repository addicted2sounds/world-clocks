import Ember from 'ember';
import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin';

export default Ember.Route.extend(AuthenticatedRouteMixin, {
  model() {
    return this.store.findAll('timezone');
  },

  actions: {
    saved(timezone) {
      timezone.save().then(() => {
        this.transitionTo('timezones.timezone', timezone);
      }).catch(() => {
        alert('cannot save');
      });
    }
  },
});
