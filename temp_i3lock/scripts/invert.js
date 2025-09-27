// ==UserScript==
// @name         Epileptic invert
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  try to take over the world!
// @author       You
// @match        *://*/*
// @icon         data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==
// @grant        none
// @run-at       document-start
// ==/UserScript==

let style = document.createElement("style");
style.innerHTML = `
* {
  transition-duration: 1s;
}

*:not(html):not(body):hover {
  filter: invert(1);
}
`;
document.head.appendChild(style);
