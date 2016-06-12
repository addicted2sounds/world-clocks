import Ember from 'ember';

export default Ember.Component.extend({
  session: Ember.inject.service(),
  actions: {
    save(timezone) {
      timezone.save().then(() => {
        this.sendAction('action', this.get('timezone'));
      }).catch((err) => {
        console.log(err);
      });
    }
  }
});
