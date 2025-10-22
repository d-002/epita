import { RainManager } from "./rain.js";
import { setupAntidotes } from "./antidote.js";
import { listenSelection } from "./selection.js";

const perf = true;

// matrix rain
const rain = new RainManager(document.getElementById("matrix"));
listenSelection();
setupAntidotes();

if (perf) {
    rain.update();
    clearInterval(rain.interval);
}
