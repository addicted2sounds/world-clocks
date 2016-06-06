import Mirage from 'ember-cli-mirage';
//import Ember from 'ember';

export default function() {

  //this.namespace = 'api';

  this.post('/user_token', (db, request) => {
    const req = JSON.parse(request.requestBody);
    const password = Ember.get(req, 'auth.password');

    if (password == '123qwe') {
      return new Mirage.Response(201, {}, { jwt: 'cola' });
    } else {
      return new Mirage.Response(404, {}, {});
    }
  });

  this.get('/timezones', ({ timezone }, request) => {
    const token = Ember.get(request, 'requestHeaders.Authorization');
    if (token == 'Bearer cola') {
      return timezone.all();
    } else {
      return new Mirage.Response(401, {}, {});
    }
  });
}
