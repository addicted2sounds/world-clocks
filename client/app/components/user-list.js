import Ember from 'ember';

export default Ember.Component.extend({
  actions: {
    delete(timezone) {
      timezone.destroyRecord().then(() => {
        console.log('User deleted');
      }).catch(() => {
        console.log('Error deleting user');
      });
    }
  }
});
