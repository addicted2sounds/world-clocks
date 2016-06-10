import Ember from 'ember';
import Model from 'ember-data/model';
import attr from 'ember-data/attr';
import { hasMany } from 'ember-data/relationships';

export default Model.extend({
  email: attr('string'),
  password: attr('string'),
  role: attr('string'),
  timezones: hasMany('user'),
  isAdmin: Ember.computed('role', function() {
    return this.get('role') == 'admin';
  }),
  isManager: Ember.computed('role', function() {
    return this.get('isAdmin') || this.get('role') == 'manager';
  })
});
