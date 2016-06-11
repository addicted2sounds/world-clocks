import Clock from 'ember-cli-clock/services/clock';

export default Clock.extend({
  interval: 1000,
  timeDiff: null,
  difference: 0,
  timezoneTime() {
    const timenow = this.get('clock.date');
    this.timeDiff = (new Date()).getTimezoneOffset() * 60000;
    return new Date(timenow + timeDiff + difference * 60000);
  }
});
