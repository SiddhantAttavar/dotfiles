// ==UserScript==
// @include     https://*yewtu.be/*
// @include     https://invidious*
// @include     https://inv.*
// @include     https://invidio.*
// @include     https://invidious-*
// @include     https://iv.*
// @include     https://vid.*
// @include     https://y.com.*
// @include     https://yt*
// @include     tube.*
// @include     https://watch.thekitty.zone
// @include     https://yewtu.be
// @include     https://youtube.076.ne.jp
// @include     https://youtube.owacon.moe
// @include     https://am74vkcrjp2d5v36lcdqgsj2m6x36tbrkhsruoegwfcizzabnfgf5zyd.onion
// @include     https://c7hqkpkpemu6e7emz5b4vyz7idjgdvgaaa3dyimmeojqbgpea3xqjoid.onion
// @include     https://euxxcnhsynwmfidvhjf6uzptsmh4dipkmgdmcmxxuo7tunp3ad2jrwyd.onion
// @include     https://grwp24hodrefzvjjuccrkw3mjq4tzhaaq32amf33dzpmuxe7ilepcmad.onion
// @include     https://inv.vernccvbvyi5qhfzyqengccj7lkove6bjot2xhh5kajhwvidqafczrad.onion
// @include     https://invidious.esmail5pdn24shtvieloeedh7ehz3nrwcdivnfhfcedl7gf4kwddhkqd.onion
// @include     https://iv.odysfvr23q5wgt7i456o5t3trw2cw5dgn56vbjfbq2m7xsc5vqbqpcyd.onion
// @include     https://kbjggqkzv65ivcqj6bumvp337z6264huv5kpkwuv6gu5yjiskvan7fad.onion
// @include     https://ng27owmagn5amdm7l5s3rsqxwscl5ynppnis5dqcasogkyxcfqn7psid.onion
// @include     https://osbivz6guyeahrwp2lnwyjk2xos342h4ocsxyqrlaopqjuhwn2djiiyd.onion
// @include     https://u2cvlit75owumwpy4dj2hsmvkq7nvrclkpht7xgyye2pyoxhpmclkrad.onion
// @include     https://w6ijuptxiku4xpnnaetxvnkc5vqcdu7mgns2u77qefoixi63vbvnpnqd.onion
// @run-at      document-start
// @name        Invidious - Nord Theme
// @namespace   https://github.com/Tsyron/Invidious-Theme
// @version     1.6.0
// @license     GPLv3
// @description Invidious Website In Nord Theme/Style
// @author      Tsyron
// @preprocessor stylus
// @var         select select-color "Colours" ["Frost", "Colourful"] 
// @var         select theatre-mode "Theatre Mode at Screen Size" ["No", "Yes"]
// @var         select select-corners "Corners" {
//              "Slightly Rounded":         "SlightlyRounded",
//              "Very Rounded":             "VeryRounded",
//              "Squared":                  "Squared" }
// @var         select select-screen-width "Screen Width" ["Default", "Slim", "Wide"]
// ==/UserScript==

(function IIFE() {
	'use strict';

	document.addEventListener('readystatechange', function onReadyStateChange() {
		if (document.readyState == 'interactive') {
			const style = document.createElement('style');
			document.head.appendChild(style);
			style.innerHTML = `
    :root {
        /* Darker Tints */
        --Night1: #2E3440;
        --Night2: #3B4252;
        --Night3: #434C5E;
        --Night4: #4C566A;
        --Night4Hover: #21262E;
        /* Lighter Tints */
        --Light1: #D8DEE9;
        --Light1Hover: #BDC2CC;
        --Light2: #E5E9F0;
        --Light3: #ECEFF4;
        /* Clickable Links */
        --Linked: #81A1C1;
        --LinkedHover: #7490AD;
        /* Colours: Frost */
        /* if select-color=="Colourful" { */
            --Color1: #BF616A;
            --Color1Hover: #A6545C;
            --Color2: #D08770;
            --Color2Hover: #B77662;
            --Color3: #B48EAD;
            --Color3Hover: #9A7A94;
            --Color4: #EBCB8B;
            --Color4Hover: #D6B97F;
            --Color5: #A3BE8C;
            --Color5Hover: #8AA177; /* } */

        /* if select-color=="Frost" {
            --Color1: #88C0D0;
            --Color1Hover: #709EAB;
            --Color2: #5E81AC;
            --Color2Hover: #4F6C90;
            --Color3: #5E81AC;
            --Color3Hover: #4F6C90;
            --Color4: #8FBCBB;
            --Color4Hover: #7CA4A3;
            --Color5: #88C0D0;
            --Color5Hover: #709EAB; } */
        
        /* if theatre-mode=="No" { */
            --MBottom: 0%;
            --MLeft: 1em;
            --MBRight: 1em;
            --BlackBorders: 56.25%; /* } */

        /* if theatre-mode=="Yes" {
            --MBottom: 6%;
            --MLeft: -3.2%;
            --MBRight: -3.2%; } */
            
        /* if select-corners=="SlightlyRounded" { */
            --Corners: 0.4em; /* } */

        /* if select-corners=="VeryRounded" {
            --Corners: 1.5em; } */

        /* if select-corners=="Squared" {
            --Corners: false; } */

        if select-screen-width=="Default" {
            --Width: 85em; }

        if select-screen-width=="Slim" {
            --Width: 70em; }

        if select-screen-width=="Wide" {
            --Width: 115em; } }

    /* Main Theme : The Dark Theme */
    body.dark-theme,
    body.no-theme {
        background-color: var(--Night1);
        color: var(--Light1); }

    /* Light Theme */
    body.light-theme {
        background-color: var(--Light3);
        color: var(--Night3); }

    .dark-theme .pure-g,
    .dark-theme .pure-form legend,
    .no-theme .pure-g,
    .no-theme .pure-form legend {
        background: var(--Night1);
        color: var(--Light1); }

    .light-theme .pure-g,
    .light-theme .pure-form legend {
        background: var(--Light3);
        color: var(--Night3); }

    /* Clickable Links */
    .dark-theme a,
    .dark-theme a:visited,
    .dark-theme a:active,
    .dark-theme footer a,
    .dark-theme summary,
    .dark-theme a:not([data-id]) > .icon,
    .dark-theme a:link:not(.pure-button):not(.channel-owner),
    .no-theme a,
    .no-theme a:visited,
    .no-theme a:active,
    .no-theme footer a,
    .no-theme summary,
    .no-theme a:not([data-id]) > .icon,
    .no-theme a:link:not(.pure-button):not(.channel-owner),
    .light-theme a,
    .light-theme a:visited,
    .light-theme a:active,
    .light-theme footer a,
    .light-theme summary,
    .light-theme a:not([data-id]) > .icon,
    .light-theme a:link:not(.pure-button):not(.channel-owner) {
        color: var(--Linked); }

    .dark-theme a:hover,
    .dark-theme footer a:hover,
    .dark-theme summary:hover,
    .dark-theme a:not([data-id]) > .icon:hover,
    .no-theme a:hover,
    .no-theme footer a:hover,
    .no-theme summary:hover,
    .no-theme a:not([data-id]) > .icon:hover,
    .light-theme a:hover,
    .light-theme footer a:hover,
    .light-theme summary:hover,
    .light-theme a:not([data-id]) > .icon:hover {
        color: var(--LinkedHover) !important; }

    /* Multiple option Select Box */
    .dark-theme .pure-form input[type="color"],
    .dark-theme .pure-form input[type="date"],
    .dark-theme .pure-form input[type="datetime-local"],
    .dark-theme .pure-form input[type="datetime"],
    .dark-theme .pure-form input[type="email"],
    .dark-theme .pure-form input[type="month"],
    .dark-theme .pure-form input[type="number"],
    .dark-theme .pure-form input[type="password"],
    .dark-theme .pure-form input[type="search"],
    .dark-theme .pure-form input[type="tel"],
    .dark-theme .pure-form input[type="text"],
    .dark-theme .pure-form input[type="time"],
    .dark-theme .pure-form input[type="url"],
    .dark-theme .pure-form input[type="week"],
    .dark-theme .pure-form select,
    .dark-theme .pure-form textarea,
    .no-theme .pure-form input[type="color"],
    .no-theme .pure-form input[type="date"],
    .no-theme .pure-form input[type="datetime-local"],
    .no-theme .pure-form input[type="datetime"],
    .no-theme .pure-form input[type="email"],
    .no-theme .pure-form input[type="month"],
    .no-theme .pure-form input[type="number"],
    .no-theme .pure-form input[type="password"],
    .no-theme .pure-form input[type="search"],
    .no-theme .pure-form input[type="tel"],
    .no-theme .pure-form input[type="text"],
    .no-theme .pure-form input[type="time"],
    .no-theme .pure-form input[type="url"],
    .no-theme .pure-form input[type="week"],
    .no-theme .pure-form select,
    .no-theme .pure-form textarea {
        box-shadow: transparent 0px 1px 3px inset;
        border: var(--Light1);
        border-radius: var(--Corners);
        background-color: var(--Night2);
        color: var(--Light1);
        margin: 1px; }

    .light-theme .pure-form input[type="color"],
    .light-theme .pure-form input[type="date"],
    .light-theme .pure-form input[type="datetime-local"],
    .light-theme .pure-form input[type="datetime"],
    .light-theme .pure-form input[type="email"],
    .light-theme .pure-form input[type="month"],
    .light-theme .pure-form input[type="number"],
    .light-theme .pure-form input[type="password"],
    .light-theme .pure-form input[type="search"],
    .light-theme .pure-form input[type="tel"],
    .light-theme .pure-form input[type="text"],
    .light-theme .pure-form input[type="time"],
    .light-theme .pure-form input[type="url"],
    .light-theme .pure-form input[type="week"],
    .light-theme .pure-form select,
    .light-theme .pure-form textarea {
        box-shadow: transparent 0px 1px 3px inset;
        border: var(--Light2);
        border-radius: var(--Corners);
        background-color: var(--Light1);
        color: var(--Night3);
        margin: 1px; }

    /* General Button */
    .dark-theme button.pure-button.pure-button-primary,
    .no-theme button.pure-button.pure-button-primary {
        background-color: var(--Night2);
        color: var(--Light1);
        border-radius: var(--Corners);
        margin: 1px;
        margin-bottom: 10px; }

    .light-theme button.pure-button.pure-button-primary {
        background-color: var(--Light1);
        color: var(--Night3);
        border-radius: var(--Corners);
        margin: 1px;
        margin-bottom: 10px; }

    /* Checkbox & Radio */
    input[type="checkbox"],
    [type='radio'] {
        -webkit-appearance: none;
        height: 1.3em;
        width: 1.3em;
        cursor: pointer;
        position: relative;
        -webkit-transition: .10s;
        border-radius: var(--Corners);
        vertical-align: middle;
        margin: 1px; }

    /* Checkbox & Radio: Background color */
    .dark-theme input[type="checkbox"],
    .no-theme input[type="checkbox"],
    .dark-theme input[type='radio'],
    .no-theme input[type='radio'] {
        background-color: var(--Night3); }

    .light-theme input[type="checkbox"],
    .light-theme input[type='radio'] {
        background-color: var(--Light1); }

    /* Checkbox & Radio: Color check */
    .dark-theme input[type="checkbox"]:checked,
    .no-theme input[type="checkbox"]:checked,
    .dark-theme input[type='radio']:checked,
    .no-theme input[type='radio']:checked,
    .light-theme input[type="checkbox"]:checked,
    .light-theme input[type='radio']:checked {
        background-color: var(--Color5); }

    /* Color checkbox and radio button */
    .dark-theme input[type="checkbox"]:before,
    .dark-theme input[type="checkbox"]:checked:before,
    .dark-theme input[type='radio']:before,
    .dark-theme input[type='radio']:checked:before,
    .no-theme input[type="checkbox"]:before,
    .no-theme input[type="checkbox"]:checked:before,
    .no-theme input[type='radio']:before,
    .no-theme input[type='radio']:checked:before {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        line-height: 1.5em;
        text-align: center;
        color: var(--Night3); }

    .light-theme input[type="checkbox"]:before,
    .light-theme input[type="checkbox"]:checked:before,
    .light-theme input[type='radio']:before,
    .light-theme input[type='radio']:checked:before {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        line-height: 1.5em;
        text-align: center;
        color: var(--Light1) }

    /* Checkbox & Radio: Icons */
    input[type='radio'] {
        border-radius: 50%; }

    input[type="checkbox"]:checked:before {
        content: '✔'; }

    /* Range slider: Background */
    .dark-theme input[type='range'],
    .no-theme input[type='range'] {
        background-color: var(--Night3); }

    .light-theme input[type='range'] {
        background-color: var(--Light1); }

    /* Range slider: Slider and Round */
    .dark-theme input[type='range']::-webkit-slider-thumb,
    .no-theme input[type='range']::-webkit-slider-thumb,
    .light-theme input[type='range']::-webkit-slider-thumb {
        width: 15px;
        border-radius: 15px;
        -webkit-appearance: none;
        height: 15px;
        background: var(--Color5);
        box-shadow: -80px 0 0 75px var(--Color5Hover); }

    /* Range slider: Padding */
    input[type='range'] {
        overflow: hidden;
        -webkit-appearance: none;
        border-radius: 1em; }

    input[type='range']::-webkit-slider-runnable-track {
        height: 15px;
        -webkit-appearance: none; }

    /* Home Screen: Thumbnail */
    img {
        border-radius: var(--Corners); }

    /* Home Screen: Donate/Popular/Trending */
    .dark-theme a.feed-menu-item.pure-menu-heading,
    /* Volume Text Color (Settings) */
    .dark-theme span#volume-value,
    .no-theme a.feed-menu-item.pure-menu-heading,
    .no-theme span#volume-value {
        color: var(--Light1); }

    .light-theme a.feed-menu-item.pure-menu-heading,
    .light-theme span#volume-value {
        color: var(--Night3); }

    /* Home Screen: Clickable links colors */
    .dark-theme p,
    /* Date, Views removing hover */
    .dark-theme p.video-data:hover,
    .no-theme p,
    .no-theme p.video-data:hover {
        color: var(--Light1); }

    .light-theme p,
    .light-theme p.video-data:hover {
        color: var(--Night4); }

    /* Home Screen: Only Highlights YouTube Video's */
    .dark-theme a[href^="/watch?v="] p:not(.length):hover {
        color: var(--Light1Hover); }

    .no-theme a[href^="/watch?v="] p:not(.length):hover {
        color: var(--Light1Hover); }

    .light-theme a[href^="/watch?v="] p:not(.length):hover {
        color: var(--Night4Hover); }

    /* Home Screen: Screen Width */
    @media screen and (min-width: 48em) {
        .pure-u-md-1-12,
        .pure-u-md-1-6, 
        .pure-u-md-4-24 {
            width: 0%; } }

    /* Home Screen: Length Time*/
    .dark-theme .length,
    .dark-theme p.length,
    .no-theme .length,
    .no-theme p.length {
        color: var(--Light1);
        background-color: var(--Night3); }

    .light-theme .length,
    .light-theme p.length {
        color: var(--Night3);
        background-color: var(--Light3); }

    .dark-theme .length,
    .dark-theme p.length,
    .no-theme .length,
    .no-theme p.length,
    .light-theme .length,
    .light-theme p.length {
        padding: 5px;
        margin-top: 2px;
        right: 0.4em;
        bottom: -0.60em;
        border-radius: var(--Corners); }

    .dark-theme p.channel-name,
    .no-theme p.channel-name,
    .light-theme p.channel-name {
        color: var(--Linked); }

    .dark-theme p.channel-name:hover,
    .no-theme p.channel-name:hover,
    .light-theme p.channel-name:hover {
        color: var(--LinkedHover); }

    /* Home Screen: Invidious icon / Log in */
    .dark-theme .navbar .index-link,
    .no-theme .navbar .index-link,
    .light-theme .navbar .index-link {
        color: var(--Color1); }
        
    .dark-theme .pure-menu-heading,
    .no-theme .pure-menu-heading,
    .light-theme .pure-menu-heading {
        color: var(--Color1); }

    /* Home Screen: Little icons beside video */
    .dark-theme i.icon.ion-md-headset,
    .no-theme i.icon.ion-md-headset,
    .light-theme i.icon.ion-md-headset {
        color: var(--Color4) !important; }

    .dark-theme i.icon.ion-md-headset:hover,
    .no-theme i.icon.ion-md-headset:hover,
    .light-theme i.icon.ion-md-headset:hover {
        color: var(--Color4Hover) !important; }

    .dark-theme i.icon.ion-logo-youtube,
    .no-theme i.icon.ion-logo-youtube,
    .light-theme i.icon.ion-logo-youtube {
        color: var(--Color1) !important; }

    .dark-theme i.icon.ion-logo-youtube:hover,
    .no-theme i.icon.ion-logo-youtube:hover,
    .light-theme i.icon.ion-logo-youtube:hover {
        color: var(--Color1Hover) !important; }

    .dark-theme i.icon.ion-md-jet,
    .no-theme i.icon.ion-md-jet,
    .light-theme i.icon.ion-md-jet {
        color: var(--Color3) !important; }

    .dark-theme i.icon.ion-md-jet:hover,
    .no-theme i.icon.ion-md-jet:hover,
    .light-theme i.icon.ion-md-jet:hover {
        color: var(--Color3Hover) !important; }

    /* Searchbar: Zooming Padding */
    .pure-g:not(.h-box) > .pure-u-md-1-4 .h-box,
    .pure-g:not(.searchbar) > .searchbar,
    .pure-form-aligned {
        border-radius: var(--Corners);
        padding: 8px;
        transition: all 0.2s; }

    .h-box {
        padding-left: 1.1em;
        padding-right: 1.1em; }

    .pure-g:not(.h-box) > .pure-u-md-1-4 .h-box:hover {
        transform: scale(1.025);
        transition: all 0.2s;
        opacity: 1;
        box-shadow: 0px 1px 20px rgba(0, 0, 0, 0.3);
        z-index: 99999; }

    /* Search: Filter box */
    .dark-theme #filters-box,
    .no-theme #filters-box {
        background-color: var(--Night1); }

    .light-theme #filters-box {
        background-color: var(--Light3); }

    .dark-theme .underlined,
    .no-theme .underlined,
    .light-theme .underlined {
        border-bottom-color: var(--Color2); }

    /* Video player: play button: color */
    .dark-theme .video-js .vjs-slider:hover,
    .dark-theme .video-js button:hover,
    .no-theme .video-js .vjs-slider:hover,
    .no-theme .video-js button:hover {
        color: var(--Light1); }

    .light-theme .video-js .vjs-slider:hover,
    .light-theme .video-js button:hover {
        color: var(--Night4Hover); }

    /* Video player: play button: Border */
    .dark-theme .video-js .vjs-big-play-button,
    .no-theme .video-js .vjs-big-play-button,
    .light-theme .video-js .vjs-big-play-button {
        border-radius: var(--Corners);
        background-color: var(--Color1);
        border: 0em solid transparent;
        font-size: 4.5em;
        top: 44%;
        left: 43%; }
        
    /* Volume Slider */
    .dark-theme .video-js .vjs-volume-level,
    .no-theme .video-js .vjs-volume-level,
    .light-theme .video-js .vjs-volume-level {
        border-radius: var(--Corners);
        background-color: var(--Color1); }

    /* Video player: Controls: Color */
    .dark-theme .video-js .vjs-control-bar,
    .dark-theme .vjs-menu-button-popup .vjs-menu .vjs-menu-content,
    .no-theme .video-js .vjs-control-bar,
    .no-theme .vjs-menu-button-popup .vjs-menu .vjs-menu-content {
        background-color: var(--Night1);
        color: var(--Light3); }

    .light-theme .video-js .vjs-control-bar,
    .light-theme .vjs-menu-button-popup .vjs-menu .vjs-menu-content {
        background-color: var(--Light3);
        color: var(--Night3); }

    /* Video player: Controls: Floating */
    .dark-theme .video-js .vjs-control-bar,
    .dark-theme .vjs-menu-button-popup .vjs-menu .vjs-menu-content,
    .no-theme .video-js .vjs-control-bar,
    .no-theme .vjs-menu-button-popup .vjs-menu .vjs-menu-content,
    .light-theme .video-js .vjs-control-bar,
    .light-theme .vjs-menu-button-popup .vjs-menu .vjs-menu-content {
        font-family: sans-serif;
        opacity: 1;
        border-radius: var(--Corners);
        left: 0.5%;
        right: 0.5%;
        width: 99%;
        margin-bottom: 0.5%; }

    /* Video player: Controls: Progress Bar: Color */
    .dark-theme .video-js.player-style-invidious .vjs-play-progress,
    .no-theme .video-js.player-style-invidious .vjs-play-progress,
    .light-theme .video-js.player-style-invidious .vjs-play-progress {
        background-color: var(--Color1); }

    /* Video player: Controls: Hovering Over Selected Option colors */
    .dark-theme .vjs-menu li.vjs-menu-item:focus,
    .dark-theme .vjs-menu li.vjs-menu-item:hover,
    .no-theme .vjs-menu li.vjs-menu-item:focus,
    .no-theme .vjs-menu li.vjs-menu-item:hover,
    .light-theme .vjs-menu li.vjs-menu-item:focus,
    .light-theme .vjs-menu li.vjs-menu-item:hover {
        background-color: var(--Color1Hover);
        color: var(--Light1); }

    /* Video player: Controls: The Selected option colors */
    .dark-theme .vjs-menu li.vjs-selected,
    .dark-theme .vjs-menu li.vjs-selected:focus,
    .dark-theme .vjs-menu li.vjs-selected:hover,
    .no-theme .vjs-menu li.vjs-selected,
    .no-theme .vjs-menu li.vjs-selected:focus,
    .no-theme .vjs-menu li.vjs-selected:hover {
        background-color: var(--Color1);
        color: var(--Light1); }

    .light-theme .vjs-menu li.vjs-selected,
    .light-theme .vjs-menu li.vjs-selected:focus,
    .light-theme .vjs-menu li.vjs-selected:hover {
        background-color: var(--Color1);
        color: var(--Light3); }
    
    /* Video player: Share Links */
    .dark-theme .video-js .vjs-share__short-link,
    .dark-theme .video-js .vjs-share__btn,
    .dark-theme .vjs-share__short-link-wrapper,
    .no-theme .video-js .vjs-share__short-link,
    .no-theme .video-js .vjs-share__btn,
    .no-theme .vjs-share__short-link-wrapper {
        font-family: sans-serif;
        background-color: var(--Night2);
        color: var(--Light1); }

    .light-theme .video-js .vjs-share__short-link,
    .light-theme .video-js .vjs-share__btn,
    .light-theme .vjs-share__short-link-wrapper {
        font-family: sans-serif;
        background-color: var(--Light1);
        color: var(--Night1); }
        
    .dark-theme .video-js.vjs-videojs-share_open .vjs-modal-dialog .vjs-close-button,
    .dark-theme .video-js .vjs-share__subtitle,
    .dark-theme .video-js .vjs-share__title,
    .no-theme .video-js.vjs-videojs-share_open .vjs-modal-dialog .vjs-close-button,
    .no-theme .video-js .vjs-share__subtitle,
    .no-theme .video-js .vjs-share__title {
        font-family: sans-serif;
        color: var(--Light1); }
        
    .light-theme .video-js.vjs-videojs-share_open .vjs-modal-dialog .vjs-close-button,
    .light-theme .video-js .vjs-share__subtitle,
    .light-theme .video-js .vjs-share__title {
        font-family: sans-serif;
        color: var(--Night1); }

    .dark-theme .video-js.vjs-videojs-share_open .vjs-modal-dialog .vjs-modal-dialog-content,
    .dark-theme .video-js .vjs-modal-dialog,
    .no-theme .video-js.vjs-videojs-share_open .vjs-modal-dialog .vjs-modal-dialog-content,
    .no-theme .video-js .vjs-modal-dialog, {
        background: var(--Night1); }

    .light-theme .video-js.vjs-videojs-share_open .vjs-modal-dialog .vjs-modal-dialog-content,
    .light-theme .video-js .vjs-modal-dialog {
        background: var(--Light3); }

    .video-js.vjs-videojs-share_open .vjs-modal-dialog .vjs-modal-dialog-content,
    .video-js .vjs-modal-dialog {
        width: 80%;
        height: 80%;
        top: 10%;
        left: 10%;
        border-radius: var(--Corners); }

    .video-js .vjs-share__social_fbFeed,
    .video-js .vjs-share__social_tw,
    .video-js .vjs-share__social_reddit,
    .video-js .vjs-share__social_mail,
    .video-js .vjs-share__social_email,
    .video-js .vjs-share__short-link,
    .video-js .vjs-share__btn,
    .vjs-share__short-link-wrapper {
        border-radius: var(--Corners); }
        
    .video-js .vjs-share__social_fbFeed {
        background-color: var(--Color1); }
        
    .video-js .vjs-share__social_tw {
        background-color: var(--Color3); }
        
    .video-js .vjs-share__social_reddit {
        background-color: var(--Color2); }
        
    .video-js .vjs-share__social_mail,
    .video-js .vjs-share__social_email {
        background-color: var(--Color4); }
        
    /* Video player: Settings */
    .dark-theme .vjs-text-track-settings legend,
    .no-theme .vjs-text-track-settings legend {
        color: var(--Light1); }

    .light-theme .vjs-text-track-settings legend {
        color: var(--Night3); }
        
    .video-js.vjs-videojs-share_open .vjs-modal-dialog .vjs-close-button::before {
        display: none; }
  
    /* Video player: Size */
    .pure-u-md-20-24 {
        width: 94% !important;
        max-width: var(--Width) !important;
        margin: auto; }

    /* Video player: Remove black borders */
    .player-dimensions.vjs-fluid {
        padding-top: 56.25% !important; }

    #player-container {
        box-shadow: 0px 10px 17px rgba(0, 0, 0, 0.3);
        transition: all 0.2s;
        padding-bottom: 54.25% !important; }

    @media screen and (max-width: 1420px) {
        #player-container {
            margin-bottom: var(--MBottom);
            margin-left: var(--MLeft);
            margin-right: var(--MBRight); } }
            
    @media screen and (max-width: 48em) {
        #player-container {
            margin-bottom: 8%; } }

    /* Description: Padding and Form */
    .channel-profile {
        margin-top: 10px; }

    .pure-g:not(.h-box) > .pure-u-md-1-4 .h-box {
        margin: 5px }

    .pure-control-group {
        margin-top: 3px;
        margin-bottom: 7px; }

    /* Description: Subscribe button */
    .dark-theme #subscribe,
    .no-theme #subscribe,
    .light-theme #subscribe,
    body a.pure-button-primary,
    body a.pure-button-primary:hover {
        color: var(--Light1);
        background-color: var(--Color1);
        border-radius: var(--Corners);
        float: right;
        padding: 7.5px;
        margin-top: -55px; }
        
    /* Description: Download Multiple Section Bold */
    select#download_widget {
        font-weight: bold;
        margin-top: 15px; }

    /* Description: Download Button */
    .dark-theme input,
    .dark-theme select,
    .dark-theme textarea,
    .no-theme input,
    .no-theme select,
    .no-theme textarea {
        background-color: var(--Night2);
        color: var(--Light1); }

    .light-theme input,
    .light-theme select,
    .light-theme textarea{
        background-color: var(--Light1);
        color: var(--Night3); }
        
    input, select, textarea {
        font-family: sans-serif;
        border: 0px;
        border-radius: var(--Corners); }

    /* Scrollbar */
    .dark-theme::-webkit-scrollbar,
    .no-theme::-webkit-scrollbar {
        background-color: var(--Night2);
        width: 15px; }

    .light-theme::-webkit-scrollbar {
        background-color: var(--Light1);
        width: 15px; }

    .dark-theme::-webkit-scrollbar-thumb,
    .no-theme::-webkit-scrollbar-thumb {
        background-color: var(--Night3); }

    .light-theme::-webkit-scrollbar-thumb {
        background-color: var(--Light2); }

    /* Comment Section: Heart icon */
    .icon.ion-ios-heart.creator-heart-small-container {
        color: var(--Color1); }

    /* Comment Section: OC Channel: Comment */
    body a.channel-owner {
        background-color: var(--Color1);
        padding: 6px 8px;
        border-radius: var(--Corners);
        color: var(--Light3) !important; }

    body a.channel-owner:hover {
        background-color: var(--Color1Hover);
        color: var(--Light1Hover) !important; }

    /* Banner on Channel */
    .pure-u-md-20-24 > .h-box > img {
        border-radius: var(--Corners);
        margin: 5px;
        opacity: 0.8;
        box-shadow: 0px 1px 13px rgba(0, 0, 0, 0.3);
        transition: all 0.2s }

    /* White Line (Spacer/padding) */
    .dark-theme hr,
    .no-theme hr,
    .light-theme hr {
        margin: 15px 0;
        border-color: var(--Color2); }

    .pure-form legend {
        text-align: center;
        border-color: var(--Color2);
        padding: 15px; }

    /* Selection of text color */
    .dark-theme ::selection, .no-theme ::selection {
        background-color: var(--Light1);
        color: var(--Night3); }
        
    .light-theme ::selection {
        background-color: var(--Night1);
        color: var(--Light1); }

    /* Hidden items */
    #comments > div > b {
        display: none; }

    :root {
        --edge-table: #0000;
        --bg-primary: #2E3440;
        --bg-secondary: #3B4252;
        --bg-tertiary: #434C5E;
        --fg-primary: #D8DEE9;
        --fg-link: #81A1C1;
        --fg-linkHover: #7490AD;
        --fg-header: #88C0D0;
        if select-theme=="Frost" {
            --fg-header: #88C0D0;
            --fg-dim: #5E81AC; }

        if select-theme=="Colorful" {
            --fg-header: #BF616A;
            --fg-dim: #BF616A; } }

    /* Hovering over links */
    a:hover {
        color: var(--fg-linkHover); }

    .script-warning {
        background: var(--fg-dim);
        color: var(--fg-primary); }
			`;
		}
	});
})();
