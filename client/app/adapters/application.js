import JSONApiAdapter from 'ember-data/adapters/json-api';
import config from '../config/environment';
import DataAdapterMixin from 'ember-simple-auth/mixins/data-adapter-mixin';

const { host } = config;

export default JSONApiAdapter.extend(DataAdapterMixin, {
  authorizer: 'authorizer:oauth2',
  host
});
