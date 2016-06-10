import { moduleForComponent, test } from 'ember-qunit';
import hbs from 'htmlbars-inline-precompile';

export default function startMirage(container) {
  mirageInitializer.initialize(container);
}
moduleForComponent('user-list', 'Integration | Component | user list', {
  integration: true
});

test('it renders', function(assert) {
  this.render(hbs`{{user-list}}`);

  assert.equal(this.$('tbody').length, 1);
});
