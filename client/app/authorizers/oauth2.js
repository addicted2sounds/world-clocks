import OAuth2BearerAuthorizer from 'ember-simple-auth/authorizers/oauth2-bearer';
import Ember from 'ember';

export default OAuth2BearerAuthorizer.extend({
  session: Ember.inject.service(),
  authorize(data, block) {
    if (Ember.testing) {
      block('Authorization', 'Bearer cola');
    }
    const { token } = data;
    if (this.get('session.isAuthenticated') && token) {
      block('Authorization', `Bearer ${token}`);
    }
  }
});
