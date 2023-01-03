HTMLWidgets.widget({

  name: 'lux_to_relative',

  type: 'output',

  factory: function(el, width, height) {
    
    const DateTime = luxon.DateTime
    // const durations = ["months", "weeks", "days", "hours", "minutes", "seconds"]
    const durations = ["seconds"]
    let timeInterval = 1000
    
    const setRelative = (dt) => {
      el.innerText = dt.toRelative()
    }
    
    // TODO: Make more efficient time intervals. For example if diff = 2h 10m => 10m
    const computeTimeIntervalFromDiff = (difference) => {
      let timeInterval = 0
      if (difference.seconds > (1000 * 60 * 60 * 24 * 2)) {
        timeInterval = 1000 * 60 * 60 * 24
      } else if (difference.seconds > (1000 * 60 * 60 * 2)){
        timeInterval = 1000 * 60 * 60
      } else if (difference.seconds > (1000 * 60 * 2)){
        timeInterval = 1000 * 60
      } else {
        timeInterval = 1000
      }
      return timeInterval
    }
    
    /* test
    computeTimeIntervalFromDiff(
      {months: 0, 
        weeks: 0, 
        days: 0, 
        hours: 1, 
        minutes: 11, 
        seconds: 0}
    )
    */
    
    const checkTimeInterval = (dt) => {
      const now = DateTime.now()
      
      const difference = now.diff(dt, durations).toObject()
      
      // TODO: change timeInterval dinamically
      
      timeInterval = computeTimeIntervalFromDiff(difference)
    }
    
    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {
        
        const dt = DateTime.fromISO(x.datetime)
        
        checkTimeInterval(dt)
        // TODO: code to render the widget, e.g.
        setInterval(() => setRelative(dt), timeInterval);

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
