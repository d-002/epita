import { RainManager } from "/epita/scripts/rain.js";
import { setupAntidotes } from "/epita/scripts/antidote.js";
import { listenSelection } from "/epita/scripts/selection.js";

const perf = true;

// matrix rain
const rain = new RainManager(document.getElementById("matrix"));
listenSelection();
setupAntidotes();

if (perf) {
    rain.update();
    clearInterval(rain.interval);
}
