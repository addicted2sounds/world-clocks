import Ember from 'ember';

export default Ember.Component.extend({
  actions: {
    save(user) {
      user.save().then(() => {
        this.sendAction('action', user);
      }).catch((err) => {
        alert(`Error saving: ${err}`);
      });
    }
  }
});
