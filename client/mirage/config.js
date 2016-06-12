import Mirage from 'ember-cli-mirage';
//import Ember from 'ember';

export default function() {
  this.post('/user_token', (db, request) => {
    const req = JSON.parse(request.requestBody);
    const password = Ember.get(req, 'auth.password');

    if (password == '123qwe') {
      return new Mirage.Response(201, {}, { jwt: 'cola' });
    } else {
      return new Mirage.Response(404, {}, {});
    }
  });
  this.get('/users', ({ users }, request) => {
    const token = Ember.get(request, 'requestHeaders.Authorization');
    if (token == 'Bearer cola') {
      return users.all();
    } else {
      return new Mirage.Response(401, {}, {});
    }
  });
  this.post('/users', function(db, request) {
    const attrs = JSON.parse(request.requestBody).user;
    const user = db.users.create(attrs);
    return new Mirage.Response(201, {}, user);
  });
  this.get('/timezones', ({ timezones }, request) => {
    const token = Ember.get(request, 'requestHeaders.Authorization');
    if (token == 'Bearer cola') {
      return timezones.all();
    } else {
      return new Mirage.Response(401, {}, {});
    }
  });
  this.post('/timezones', function(db, request) {
    const attrs = JSON.parse(request.requestBody).data.attributes;
    const timezone = db.users.create(attrs);
    return new Mirage.Response(201, {}, timezone);
  });
}
