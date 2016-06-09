import Ember from 'ember';

export default Ember.Route.extend({
  actions: {
    save(timezone) {
      timezone.save().then(() => {
        this.transitionTo('timezones.index');
      }).catch(() => {
        alert('cannot save');
      });
    }
  },
  model() {
    return this.store.createRecord('timezone');
  },
});
