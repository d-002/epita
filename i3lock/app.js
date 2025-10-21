import { RainManager } from "./rain.js";
import { setupAntidotes } from "./antidote.js";
import { listenSelection } from "./selection.js";

// matrix rain
const rain = new RainManager(document.getElementById("matrix"));
const listener = listenSelection();

setupAntidotes();

if (true) {
    rain.update();
    clearInterval(rain.interval);
}
