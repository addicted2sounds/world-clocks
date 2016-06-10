import Model from 'ember-data/model';
import attr from 'ember-data/attr';
import { belongsTo } from 'ember-data/relationships';

export default Model.extend({
  name: attr('string'),
  city: attr('string'),
  difference: attr('number'),
  user: belongsTo('user')
});
