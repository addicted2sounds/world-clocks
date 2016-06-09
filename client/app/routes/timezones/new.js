import Ember from 'ember';

export default Ember.Route.extend({
  model() {
    return this.store.createRecord('timezone');
  },
  actions: {
    willTransition() {
      let timezone = this.controller.get('model');
      timezone.destroyRecord();
    }
  }
});
