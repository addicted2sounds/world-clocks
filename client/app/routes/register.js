import Ember from 'ember';
import UnauthenticatedRouteMixin from 'ember-simple-auth/mixins/unauthenticated-route-mixin';

export default Ember.Route.extend(UnauthenticatedRouteMixin, {
  model() {
    return this.store.createRecord('user');
  },
  actions: {
    register() {
      let user = this.controller.get('model');
      user.save().then(() => {
        this.transitionTo('/');
      }, (err) => {
        console.log(`Registration failed: ${err}`);
      });
    },
    willTransition() {
      let user = this.controller.get('model');
      if (user.get('isNew')) { user.destroyRecord(); }
    }
  }
});
