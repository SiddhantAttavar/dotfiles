// ==UserScript==
// @include     https://*none.com/*
// @run-at      document-start
// ==/UserScript==

(function IIFE() {
	'use strict';

	document.addEventListener('readystatechange', function onReadyStateChange() {
		if (document.readyState == 'interactive') {
			const style = document.createElement('style');
			document.head.appendChild(style);
			style.innerHTML = `

			`;
		}
	});
})();
