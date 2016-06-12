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
  this.get('/users/:id', ({ users }, request) => {
    const id = request.params.id;
    const token = Ember.get(request, 'requestHeaders.Authorization');
    if (token == 'Bearer cola') {
      return users.find(id);
    } else {
      return new Mirage.Response(401, {}, {});
    }
  });
  this.patch('/users/:id', ({ users }, request) => {
    const id = request.params.id;
    const token = Ember.get(request, 'requestHeaders.Authorization');
    if (token == 'Bearer cola') {
      const user = users.find(id);
      const attrs = JSON.parse(request.requestBody).data.attributes;
      return user.update(attrs);
    } else {
      return new Mirage.Response(401, {}, {});
    }
  });
  this.delete('users/:id', ({ users }, request) => {
    const id = request.params.id;
    const token = Ember.get(request, 'requestHeaders.Authorization');
    if (token == 'Bearer cola') {
      const user = users.find(id);
      return user.destroy();
    } else {
      return new Mirage.Response(401, {}, {});
    }
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
  this.get('/timezones/:id', ({ timezones }, request) => {
    const id = request.params.id;
    const token = Ember.get(request, 'requestHeaders.Authorization');
    if (token == 'Bearer cola') {
      return timezones.find(id);
    } else {
      return new Mirage.Response(401, {}, {});
    }
  });
  this.patch('/timezones/:id', ({ timezones }, request) => {
    const id = request.params.id;
    const token = Ember.get(request, 'requestHeaders.Authorization');
    if (token == 'Bearer cola') {
      const timezone = timezones.find(id);
      const attrs = JSON.parse(request.requestBody).data.attributes;
      return timezone.update(attrs);
    } else {
      return new Mirage.Response(401, {}, {});
    }
  });
  this.delete('timezones/:id', ({ timezones }, request) => {
    const id = request.params.id;
    const token = Ember.get(request, 'requestHeaders.Authorization');
    if (token == 'Bearer cola') {
      const timezone = timezones.find(id);
      return timezone.destroy();
    } else {
      return new Mirage.Response(401, {}, {});
    }
  });
}
