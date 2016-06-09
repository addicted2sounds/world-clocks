import RESTAdapter from 'ember-data/adapters/rest';
import config from '../config/environment';
import DataAdapterMixin from 'ember-simple-auth/mixins/data-adapter-mixin';

const { host } = config;

export default RESTAdapter.extend(DataAdapterMixin, {
  authorizer: 'authorizer:oauth2',
  host
});
