import Ember from 'ember';

export default Ember.Controller.extend({
  clock: Ember.inject.service('world-clock'),
  time: Ember.computed('clock.date', function() {
    console.log(this.get('model.difference'));
    const time = this.get('clock.date') + this.get('model.difference') * 60 * 100;
    console.log(time, new Date());
    return new Date(time);
  })
});
