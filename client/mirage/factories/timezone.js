import { Factory, belongsTo } from 'ember-cli-mirage';

export default Factory.extend({
  name: faker.lorem.word(),
  city: faker.address.city(),
  difference: faker.random.number(-12, 12),
});
