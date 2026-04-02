import { RainManager } from "../scripts/rain.js?v=1.1.5";
import { setupAntidotes } from "../scripts/antidote.js?v=1.1.5";
import { listenSelection } from "../scripts/selection.js?v=1.1.5";

// true when the focus is performance over visuals
const perf = false;

// matrix rain
const rain = new RainManager(document.getElementById("matrix"));
listenSelection();
setupAntidotes();

if (perf) {
    rain.update();
    clearInterval(rain.interval);
}
