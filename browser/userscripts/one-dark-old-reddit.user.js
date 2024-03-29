// ==UserScript==
// @include     https://*old.reddit.com/*
// @run-at      document-start
// @name        Old Reddit - One Dark
// @name           One Dark Old Reddit
// @namespace   USO Archive
// @version     20230311.19.55
// @description    `One Dark color scheme for old reddit`
// @author      tekami
// @license     CC-BY-4.0
// @version        20220730.20.23
// @license        CC0-1.0
// @preprocessor   uso
// ==/UserScript==

(function IIFE() {
	'use strict';

	document.addEventListener('readystatechange', function onReadyStateChange() {
		if (document.readyState == 'interactive') {
			const style = document.createElement('style');
			document.head.appendChild(style);
			style.innerHTML = `
@-moz-document domain(old.reddit.com) {
    /* One Dark Style For Old Reddit */
    /* Start of snippet based on https://userstyles.org/styles/129171/reddit-minimal-dark */
    /* Hide annoying stuff */
    .give-gold-button,
    .goldvertisement,
    .embed-comment,
    .nub {
        display: none !important;
    }

    /* Reset */
    *,
    *:before,
    *:after {
        background-color: #282C34 !important;
        color: #ABB2BE !important;
    }

    /* Default links */
    a {
        color: #62AEEF !important;
    }

    a:visited {
        color: #C778DD !important;
    }

    a:hover {
        color: #C778DD !important;
    }

    /* Background */
    html,
    body,
    #sr-more-link {
        background-color: #282C34 !important;
    }

    /* Top bar */
    .drop-choices,
    .hover-bubble,
    .modal-dialog {
        background: #282C34 !important;
    }

    .tabmenu .selected a {
        color: #999 !important;
    }

    /* Side bar */
    .listing-chooser-collapsed .grippy {
        width: 1px !important;
    }

    .listing-chooser-collapsed .listing-chooser {
        padding-right: 1px !important;
    }

    .listing-chooser li.selected {
        box-shadow: none !important;
    }

    .grippy:after {
        display: none !important;
    }

    /* Inputs and buttons */
    input,
    textarea,
    .linkinfo .shortlink input,
    .new-comment .usertext-body,
    .morelink a,
    .morelink:hover a,
    .fancy-toggle-button a,
    .usertext button {
        background: #333 !important;
        color: #999 !important;
        font-weight: normal !important;
    }

    /* Listing */
    .thing .title {
        color: #ABB2BF !important;
    }

    .title:visited {
        color: #777 !important;
    }

    .thing .title:hover {
        color: #f8f8f2 !important;
    }

    .expando-button {
        filter: brightness(45%) contrast(180%);
        background-color: transparent !important;
    }

    .moderator,
    .green {
        color: #3a3 !important;
    }

    .admin,
    .nsfw-stamp * {
        color: #E06B74 !important;
    }

    .pagename a,
    .trophy-name {
        color: #999 !important;
    }

    .buttons li {
        padding: 0 !important;
    }

    .buttons a {
        margin-right: 8px !important;
        color: #888 !important;
    }

    .buttons a:visited {
        color: #666 !important;
    }

    .buttons a:hover {
        color: #aaa !important;
    }

    .pagename,
    .tabmenu li,
    .link .midcol,
    .buttons a,
    .subreddit {
        font-weight: normal !important;
    }

    .search-expando.collapsed:before,
    .comment-fade {
        display: none !important;
    }

    .recommended-link {
        border-color: #333 !important;
    }

    /* Comments */
    .link .usertext .md,
    blockquote,
    pre,
    code,
    .md blockquote {
        border-left: solid 4px #333 !important;
    }

    .md td {
        border: solid 1px #333 !important;
    }

    hr {
        border-bottom: solid 1px #333 !important;
    }

    .comment .author,
    .morecomments a {
        font-weight: normal !important;
    }

    /* RES */
    .guider,
    .guiders_button,
    .res-fancy-toggle-button,
    #RESConsoleContainer,
    #RESShortcutsAddFormContainer {
        background: #222 !important;
    }

    .RESDialogSmall,
    .RESDropdownOptions,
    .RESNotification,
    #alert_message {
        background: #282C34 !important;
    }

    .RES-keyNav-activeElement,
    .RES-keyNav-activeElement .md-container {
        background: #333 !important;
    }

    .res-nightmode .arrow {
        filter: none !important;
    }

    /* End of snippet based on https://userstyles.org/styles/129171/reddit-minimal-dark */
    /* One Dark Style For Old Reddit */
    /* Thumbnails */
    .thumbnail.self {
        background-image: url(https://img.icons8.com/fluency/344/reddit.png);
        /* Reddit icon by Icons8: https://icons8.com/icon/h3FOPWMfgNnV/reddit */
        background-position: 4px -5px;
        background-repeat: no-repeat;
        background-size: 55px 55px;
    }

    .thumbnail.spoiler {
        background-image: url(https://i.imgur.com/lpzPMKX.png);
        /* Reddit icon by Icons8: https://icons8.com/icon/h3FOPWMfgNnV/reddit */
        background-position: 4px -5px;
        background-repeat: no-repeat;
        background-size: 55px 55px;
    }

    .thumbnail.default {
        background-image: url(https://i.imgur.com/ZPS7RHE.png);
        /* Reddit icon by Icons8: https://icons8.com/icon/h3FOPWMfgNnV/reddit */
        background-position: 4px -5px;
        background-repeat: no-repeat;
        background-size: 55px 55px;
    }


    /* Upvote/dowmnvote */
    .arrow.upmod {
        background-image: url(https://i.imgur.com/fmckYhF.png);
        /* Thick Arrow Pointing Up icon by Icons8: https://icons8.com/icon/99690/thick-arrow-pointing-up */
        background-position: -4.5px -1px;
        background-repeat: no-repeat;
        background-size: 24px 24px;
    }

    .arrow.downmod {
        background-image: url(https://i.imgur.com/aJJvTy5.png);
        /* Thick Arrow Pointing Up icon by Icons8: https://icons8.com/icon/99690/thick-arrow-pointing-up */
        background-position: -4.5px -9px;
        background-repeat: no-repeat;
        background-size: 24px 24px;
    }

    /* Score */
    .link .score.likes {
        color: #E06B73 !important;
    }

    .link .score.dislikes {
        color: #C778DD !important;
    }

    .linkinfo > div:nth-child(2) > span:nth-child(1) {
        color: #98C379 !important;
    }



    /* Subreddit header */
    .pagename a,
    .trophy-name {
        color: #55B6C2 !important;
    }

    .tabmenu .selected a {
        color: #55B6C2 !important;
        font-weight: bold;
    }

    /* Reddit logo */
    #header-img.default-header {
        text-indent: -9999px;
        background-image: url(https://i.imgur.com/3cKNTd1.png);
        background-position: 10px -11px;
        background-size: 112px 64px;
        background-repeat: no-repeat;
        height: 40px;
        width: 130px;
        display: inline-block;
        vertical-align: bottom;
    }


    /* Misc */
    a.edit-btn {
        background-color: #f8f8f2 !important;
        white-space: nowrap;
        float: none;
    }

    .linkinfo .shortlink input,
    .new-comment .usertext-body,
    .morelink a,
    .morelink:hover a,
    .fancy-toggle-button a {
        background: #282C33 !important;
        color: #f8f8f2 !important;
        font-weight: normal !important;
    }

    input,
    textarea {
        background: rgb(40, 44, 51) !important;
        color: #f8f8f2 !important;
    }

    .submit-link > div:nth-child(1) > a:nth-child(1) {
        background: #4d8cc3 !important;
        color: rgba(248, 248, 242, 0.85) !important;
        font-weight: bold !important;
    }

    .submit-text > div:nth-child(1) > a:nth-child(1) {
        background: #4d8cc3 !important;
        color: rgba(248, 248, 242, 0.85) !important;
        font-weight: bold !important;
    }

    a.hover {
        color: #55B6C2 !important;
    }

    /* Reset */
    *,
    *:before,
    *:after {
        background-color: #2220 !important;
    }

    div#pinnable-content-wrbpnx.pinnable-content.pinned {
        background-color: #282C34 !important;
    }

    div.reddit-video-seek-bar-root {
        background-color: #282c3480 !important;
    }

    div.seek-bar-bar:nth-child(4) {
        background-color: #ffffff75 !important;
    }

    .entry.res-selected, .entry.res-selected .md-container {
	background-color: #282C34 !important;
}

}
			`;
		}
	});
})();
