import Ember from 'ember';

export default Ember.Route.extend({
  model() {
    return this.store.createRecord('timezone');
  },
  actions: {
    save(timezone) {
      timezone.save().then(() => {
        this.transitionTo('timezones.index');
      }).catch(() => {
        alert('cannot save');
      });
    }
  }
});
