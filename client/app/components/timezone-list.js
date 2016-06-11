import Ember from 'ember';

export default Ember.Component.extend({
  session: Ember.inject.service(),
  actions: {
    delete(timezone) {
      timezone.destroyRecord().then(() => {
        console.log('Timezone deleted');
      }).catch(() => {
        console.log('Error deleting timezone');
      });
    }
  }
});
