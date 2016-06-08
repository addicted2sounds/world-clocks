import Ember from 'ember';

export default Ember.Controller.extend({
  actions: {
    save() {
      //console.log(this.get('name'));
      console.log(this);
    }
  }
});
