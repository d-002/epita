// ==UserScript==
// @name         Constant 404
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  try to take over the world!
// @author       You
// @match        *://*/*
// @icon         data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==
// @grant        none
// @run-at       document-start
// ==/UserScript==

function _404() {
  let href = document.location.href;
  console.log(href);
  if (!href.endsWith(add)) {
    href = href.substring(0, href.lastIndexOf("/")) + add;
    console.log(href);
    document.location.href = href;
  }
}

let add = "/slkdfjhgskdlfjghsdklfjghsdflkjghsdkfljgh";
window.setInterval(_404, 1000);
