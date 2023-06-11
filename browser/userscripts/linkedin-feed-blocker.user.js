// ==UserScript==
// @include     https://*linkedin.com/*
// @run-at      document-start
// @name        Discord Nordic
// @namespace   https://github.com/orblazer/discord-nordic
// @homepageURL https://github.com/orblazer/discord-nordic
// @version     4.10.5
// @license     CC BY-NC-SA 4.0
// @description Complete theme for Nordic (https://www.nordtheme.com/)
// @author      orblazer
// @supportURL  https://github.com/orblazer/discord-nordic/issues
// ==/UserScript==
/* ==UserStyle== */

(function IIFE() {
	'use strict';

	document.addEventListener('readystatechange', function onReadyStateChange() {
		if (document.readyState == 'interactive') {
			const style = document.createElement('style');
			document.head.appendChild(style);
			style.innerHTML = `

    .feed-new-update-pill__new-update-button,
    .feed-right-rail,
    .feed-shared-update-v2,
    .nav-item__badge--doughnut,
    .feed-shared-news-module,
    .feed-follows-module {
        display: none !important;
    }
			`;
		}
	});
})();
