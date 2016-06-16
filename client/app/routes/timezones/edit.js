import Ember from 'ember';

export default Ember.Route.extend({
  model(params) {
    return this.store.findRecord('timezone', params.timezone_id);
  },
  actions: {
    willTransition() {
      let timezone = this.controller.get('model');
      if (timezone.get('hasDirtyAttributes')) {
        timezone.rollbackAttributes();
      }
    }
  }
});
