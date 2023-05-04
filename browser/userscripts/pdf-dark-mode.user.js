// ==UserScript==
// @name         PDF Dark Mode
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  Inverts the colors on a pdf
// @author       You
// @match        *.pdf
// @grant        none
// ==/UserScript==

(function() {
    'use strict';

    // Your code here...
    var cover = document.createElement("div");
    let css = `
position: fixed;
pointer-events: none;
top: 0;
left: 0;
width: 100vw;
height: 100vh;
background-color: #cecece;
mix-blend-mode: difference;
z-index: 1;
`
    cover.setAttribute("style", css);
    document.body.appendChild(cover);
})();