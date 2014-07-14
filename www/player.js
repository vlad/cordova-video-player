var exec = require('cordova/exec');

/**
 * Provides access to the vibration mechanism on the device.
 */

module.exports = {
//    play: function(language, type, id) {
//      exec(null, null, "Player", "play", [language, type, id]);
//    },
    playRegular: function(path) {
      exec(null, null, "Player", "playRegular", [path]);
    }
};
