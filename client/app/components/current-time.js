import Ember from 'ember';

export default Ember.Component.extend({
  clock: Ember.inject.service('world-clock'),
  diff: 0,
  currentTime: Ember.computed('clock.date', function() {
    const d = this.get('clock.date');
    d.setHours(d.getUTCHours() + this.diff);
    return d.toLocaleTimeString();
  }),
});
