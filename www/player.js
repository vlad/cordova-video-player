var exec = require('cordova/exec');

/**
 * Provides access to the vibration mechanism on the device.
 */

module.exports = {
    playRegular: function(path) {
      exec(null, null, "Player", "playRegular", [path]);
    }
};
