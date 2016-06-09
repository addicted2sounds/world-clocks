import Ember from 'ember';

export default Ember.Component.extend({
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
