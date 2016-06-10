import Ember from 'ember';

export default Ember.Route.extend({
  model() {
    return this.store.createRecord('user');
  },
  actions: {
    register() {
      let user = this.controller.get('model');
      user.save().then(() => {
        console.log('registered');
      }, (err) => {
        console.log('failed');
      });
    },
    willTransition() {
      let user = this.controller.get('model');
      if (user.get('isNew')) user.destroyRecord();
    }
  }
});
