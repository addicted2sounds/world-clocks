import Ember from 'ember';

export default Ember.Route.extend({
  //model() {
    //return this.store.createRecord('user');
  //},
  actions: {
    willTransition() {
      let user = this.controller.get('model');
      user.rollback();
    }
  }
});

