import Ember from 'ember';

export default Ember.Component.extend({
  session: Ember.inject.service(),
  actions: {
    login() {
      this.set('loginError', false);
      const { identification, password } = this.getProperties( 'identification', 'password');
      const s = this.get('session');
      s.authenticate('authenticator:knockjwt', { identification, password }).catch(() => {
        this.set('loginError', true);
      });
    },
    signout() {
      this.get('session').invalidate();
    }
  }
});
