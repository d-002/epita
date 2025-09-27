// ==UserScript==
// @name         Page destroyer
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  try to take over the world!
// @author       You
// @match        *://*/*
// @icon         data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==
// @grant        none
// @run-at       document-idle
// ==/UserScript==

let style = document.createElement("style");
style.innerHTML = `
@keyframes anim {
  0% {
    filter: opacity(1) var(--other-filter);
    transform: scale(1) var(--other-transform);
  }

  100% {
    filter: opacity(0);
    transform: scale(0);
  }
}

.destroy {
  animation: 2s anim;
  animation-delay: 1s;
	animation-fill-mode: forwards;
}
`;
document.head.appendChild(style);

let H = window.innerHeight;
if (H > 200) {
  console.log("Destroyer targeted a page");
  document.addEventListener("mousemove", (e) => {
    let elt = e.target;
    if (elt.getBoundingClientRect().height < H/5 || elt.children.length < 5) {
      let eltStyle = window.getComputedStyle(elt, null);
      let filter = eltStyle.getPropertyValue("filter");
      let transform = eltStyle.getPropertyValue("transform");
      elt.style = elt.getAttribute("style") + "; --other-filter: "+filter+"; --other-transform: "+transform;
      elt.className += " destroy";
    }
  });
}
