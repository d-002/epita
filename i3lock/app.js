import { RainManager } from "./rain.js";

// matrix rain
const manager = new RainManager(document.getElementById("matrix"));
manager.update();
clearInterval(manager.interval);
