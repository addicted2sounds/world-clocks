import Ember from 'ember';

export default Ember.Component.extend({
  actions: {
    save(user) {
      console.log(user);
      user.save().then(() => {
        this.sendAction('action', user);
      }).catch((err) => {
        console.log(err);
      });
    }
  }
});
