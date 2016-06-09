import Ember from 'ember';
import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin';

export default Ember.Route.extend(AuthenticatedRouteMixin, {
  actions: {
    saved(user) {
      timezone.save().then(() => {
        this.transitionTo('users.user', user);
      }).catch(() => {
        alert('cannot save');
      });
    }
  },
});

