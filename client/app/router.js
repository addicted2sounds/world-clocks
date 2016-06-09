import Ember from 'ember';
import config from './config/environment';

const Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route('timezones', function() {
    this.route('index', { path: '/' });
    this.route('new');

    this.route('timezone', {
      path: ':timezone_id'
    });
    this.route('edit', { path: ':timezone_id/edit' });
  });
  this.route('users', function() {
    this.route('index', { path: '/' });
    this.route('new');
    this.route('user', {
      path: ':user_id'
    });
    this.route('edit', { path: ':user_id/edit' });
  });
});

export default Router;
