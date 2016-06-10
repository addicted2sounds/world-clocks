import Ember from 'ember';
import Model from 'ember-data/model';
import attr from 'ember-data/attr';

export default Model.extend({
  email: attr('string'),
  password: attr('string'),
  role: attr('string'),
  isAdmin: Ember.computed('role', function() {
    return this.get('role') == 'admin';
  })
});
