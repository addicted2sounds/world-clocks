import { Factory, faker } from 'ember-cli-mirage';

export default Factory.extend({
  email: faker.internet.email(),
  role: 'user',
  createdAt: faker.date.past(),
  updatedAt: faker.date.past()
});
