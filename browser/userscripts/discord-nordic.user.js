// ==UserScript==
// @include     https://*discord.com/*
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

(function IIFE() {
	'use strict';

	document.addEventListener('readystatechange', function onReadyStateChange() {
		if (document.readyState == 'interactive') {
			const style = document.createElement('style');
			document.head.appendChild(style);
			style.innerHTML = `

/**
   * SOURCE CODE
   * /!\ DON'T TOUCH ! /!\
   */
:root {
    --nord-dark1-hsl: 220deg calc(var(--saturation-factor, 1) * 16.36%) 21.57%;
    --nord-dark1: hsl(var(--nord-dark1-hsl) / 1);
    --nord-dark2-hsl: 221.74deg calc(var(--saturation-factor, 1) * 16.31%) 27.65%;
    --nord-dark2: hsl(var(--nord-dark2-hsl) / 1);
    --nord-dark3-hsl: 220deg calc(var(--saturation-factor, 1) * 16.77%) 31.57%;
    --nord-dark3: hsl(var(--nord-dark3-hsl) / 1);
    --nord-dark4-hsl: 220deg calc(var(--saturation-factor, 1) * 16.48%) 35.69%;
    --nord-dark4: hsl(var(--nord-dark4-hsl) / 1);
    --nord-light1-hsl: 218.82deg calc(var(--saturation-factor, 1) * 27.87%) 88.04%;
    --nord-light1: hsl(var(--nord-light1-hsl) / 1);
    --nord-light2-hsl: 218.18deg calc(var(--saturation-factor, 1) * 26.83%) 91.96%;
    --nord-light2: hsl(var(--nord-light2-hsl) / 1);
    --nord-light3-hsl: 217.5deg calc(var(--saturation-factor, 1) * 26.67%) 94.12%;
    --nord-light3: hsl(var(--nord-light3-hsl) / 1);
    --nord-green-blue-hsl: 178.67deg calc(var(--saturation-factor, 1) * 25.14%) 64.9%;
    --nord-green-blue: hsl(var(--nord-green-blue-hsl) / 1);
    --nord-turquoise-hsl: 193.33deg calc(var(--saturation-factor, 1) * 43.37%) 67.45%;
    --nord-turquoise: hsl(var(--nord-turquoise-hsl) / 1);
    --nord-cyan-hsl: 210deg calc(var(--saturation-factor, 1) * 34.04%) 63.14%;
    --nord-cyan: hsl(var(--nord-cyan-hsl) / 1);
    --nord-blue-hsl: 213.08deg calc(var(--saturation-factor, 1) * 31.97%) 52.16%;
    --nord-blue: hsl(var(--nord-blue-hsl) / 1);
    --nord-red-hsl: 354.26deg calc(var(--saturation-factor, 1) * 42.34%) 56.47%;
    --nord-red: hsl(var(--nord-red-hsl) / 1);
    --nord-orange-hsl: 14.38deg calc(var(--saturation-factor, 1) * 50.53%) 62.75%;
    --nord-orange: hsl(var(--nord-orange-hsl) / 1);
    --nord-yellow-hsl: 40deg calc(var(--saturation-factor, 1) * 70.59%) 73.33%;
    --nord-yellow: hsl(var(--nord-yellow-hsl) / 1);
    --nord-green-hsl: 92.4deg calc(var(--saturation-factor, 1) * 27.78%) 64.71%;
    --nord-green: hsl(var(--nord-green-hsl) / 1);
    --nord-pink-hsl: 311.05deg calc(var(--saturation-factor, 1) * 20.21%) 63.14%;
    --nord-pink: hsl(var(--nord-pink-hsl) / 1);
}
.default-colors,
:root {
    --primary-130-hsl: 240deg calc(var(--saturation-factor, 1) * 20%) 99.02%;
    --primary-160-hsl: var(--primary-130-hsl);
    --primary-200-hsl: var(--nord-light1-hsl);
    --primary-230-hsl: var(--primary-200-hsl);
    --primary-260-hsl: 222.86deg calc(var(--saturation-factor, 1) * 18.42%) 85.1%;
    --primary-300-hsl: 221.05deg calc(var(--saturation-factor, 1) * 14.96%) 75.1%;
    --primary-330-hsl: 219.31deg calc(var(--saturation-factor, 1) * 16.2%) 64.9%;
    --primary-360-hsl: var(--primary-330-hsl);
    --primary-400-hsl: 218.92deg calc(var(--saturation-factor, 1) * 16.16%) 55.1%;
    --primary-430-hsl: 218.92deg calc(var(--saturation-factor, 1) * 16.16%) 44.9%;
    --primary-460-hsl: var(--nord-dark4-hsl);
    --primary-500-hsl: var(--nord-dark3-hsl);
    --primary-530-hsl: var(--primary-500-hsl);
    --primary-560-hsl: 221.54deg calc(var(--saturation-factor, 1) * 16.46%) 30.98%;
    --primary-600-hsl: var(--nord-dark2-hsl);
    --primary-630-hsl: var(--nord-dark1-hsl);
    --primary-660-hsl: 221.25deg calc(var(--saturation-factor, 1) * 15.69%) 20%;
    --primary-700-hsl: 220deg calc(var(--saturation-factor, 1) * 15.79%) 14.9%;
    --primary-800-hsl: 220deg calc(var(--saturation-factor, 1) * 17.65%) 10%;
    --green-230-hsl: var(--green-500-hsl);
    --green-330-hsl: var(--green-500-hsl);
    --green-360-hsl: var(--green-500-hsl);
    --green-400-hsl: var(--green-500-hsl);
    --green-430-hsl: var(--green-500-hsl);
    --green-500-hsl: var(--nord-green-hsl);
    --green-560-hsl: var(--green-500-hsl);
    --green-600-hsl: var(--green-500-hsl);
    --green-660-hsl: var(--green-500-hsl);
    --green-730-hsl: 92.61deg calc(var(--saturation-factor, 1) * 21.7%) 58.43%;
    --green-760-hsl: 92.86deg calc(var(--saturation-factor, 1) * 17.07%) 51.76%;
    --red-360-hsl: var(--red-500-hsl);
    --red-345-hsl: var(--red-500-hsl);
    --red-400-hsl: var(--red-500-hsl);
    --red-430-hsl: var(--red-500-hsl);
    --red-500-hsl: var(--nord-red-hsl);
    --red-530-hsl: var(--red-500-hsl);
    --red-560-hsl: 353.57deg calc(var(--saturation-factor, 1) * 33.6%) 50.98%;
    --red-600-hsl: var(--red-560-hsl);
    --red-630-hsl: 354.93deg calc(var(--saturation-factor, 1) * 30.74%) 45.29%;
    --yellow-300-hsl: var(--yellow-400-hsl);
    --yellow-360-hsl: var(--yellow-400-hsl);
    --yellow-400-hsl: var(--nord-yellow-hsl);
    --yellow-430-hsl: var(--yellow-400-hsl);
    --yellow-500-hsl: var(--yellow-400-hsl);
    --yellow-560-hsl: var(--yellow-400-hsl);
    --yellow-630-hsl: var(--orange-500-hsl);
    --yellow-660-hsl: var(--orange-500-hsl);
    --orange-345-hsl: var(--orange-500-hsl);
    --orange-360-hsl: var(--orange-500-hsl);
    --orange-500-hsl: var(--nord-orange-hsl);
    --white-500-hsl: var(--nord-light2-hsl);
    --black-500-hsl: var(--primary-660-hsl);
    --blue-330-hsl: var(--nord-blue-hsl);
    --blue-345-hsl: 213.12deg calc(var(--saturation-factor, 1) * 75.49%) 60%;
    --brand-100-hsl: 180deg calc(var(--saturation-factor, 1) * 15.38%) 94.9%;
    --brand-200-hsl: 180deg calc(var(--saturation-factor, 1) * 23.81%) 87.65%;
    --brand-260-hsl: var(--brand-200-hsl);
    --brand-360-hsl: var(--brand-500-hsl);
    --brand-400-hsl: 178.13deg calc(var(--saturation-factor, 1) * 25%) 74.9%;
    --brand-430-hsl: var(--brand-400-hsl);
    --brand-500-hsl: var(--nord-green-blue-hsl);
    --brand-530-hsl: 180deg calc(var(--saturation-factor, 1) * 19.82%) 57.45%;
    --brand-560-hsl: var(--brand-530-hsl);
    --brand-600-hsl: 180deg calc(var(--saturation-factor, 1) * 14.4%) 50.98%;
    --brand-800-hsl: 180deg calc(var(--saturation-factor, 1) * 13.97%) 35.1%;
    --premium-tier-2-pink-hsl: var(--nord-pink-hsl);
    --premium-tier-2-pink-for-gradients-hsl: var(--premium-tier-2-pink-hsl);
    --premium-tier-2-pink-for-gradients-2-hsl: var(--premium-tier-2-pink-for-gradients-hsl);
    --premium-tier-2-purple-hsl: var(--premium-tier-2-pink-hsl);
    --premium-tier-2-purple-for-gradients-hsl: var(--premium-tier-2-pink-for-gradients-hsl);
    --premium-tier-2-purple-for-gradients-2-hsl: var(--premium-tier-2-pink-for-gradients-hsl);
    --premium-tier-0-blue-hsl: var(--nord-blue-hsl);
    --premium-tier-0-purple-hsl: var(--premium-tier-2-pink-hsl);
    --premium-tier-0-header-gradient-1-hsl: var(--premium-tier-0-blue-hsl);
    --premium-tier-0-header-gradient-2-hsl: var(--premium-tier-0-blue-hsl);
    --premium-tier-0-header-gradient-3-hsl: var(--premium-tier-0-purple-hsl);
    --premium-tier-0-header-gradient-4-hsl: var(--premium-tier-0-purple-hsl);
    --premium-tier-0-header-gradient-5-hsl: var(--premium-tier-0-purple-hsl);
    --guild-boosting-pink-hsl: var(--premium-tier-2-pink-hsl);
    --guild-boosting-purple-hsl: var(--premium-tier-2-pink-hsl);
    --guild-boosting-blue-hsl: var(--premium-tier-0-blue-hsl);
    --guild-boosting-blue-for-gradients-hsl: var(--premium-tier-0-blue-hsl);
    --guild-boosting-purple-for-gradients-hsl: var(--premium-tier-2-purple-for-gradients-hsl);
    --premium-perk-purple-hsl: var(--premium-tier-2-pink-hsl);
    --premium-perk-pink-hsl: var(--premium-tier-2-pink-hsl);
    --premium-perk-green-hsl: var(--green-560-hsl);
    --premium-perk-yellow-hsl: var(--nord-yellow-hsl);
    --premium-perk-dark-blue-hsl: var(--nord-blue-hsl);
    --premium-perk-light-blue-hsl: var(--nord-turquoise-hsl);
    --premium-perk-blue-hsl: var(--nord-cyan-hsl);
    --premium-perk-orange-hsl: var(--yellow-500-hsl);
    --premium-perk-gold-hsl: var(--yellow-500-hsl);
    --partner-hsl: var(--nord-blue-hsl);
    --twitch-hsl: var(--nord-pink-hsl);
    --application-subscription-start-hsl: var(--nord-blue-hsl);
    --application-subscription-end-hsl: var(--nord-cyan-hsl);
    --button-danger-background-hover: var(--red-560);
    --button-danger-background-active: var(--red-630);
    --button-outline-danger-background-active: var(--red-560);
    --button-positive-background-hover: var(--green-730);
    --button-positive-background-active: var(--green-760);
    --home-background: var(--background-primary);
}
.theme-dark,
.theme-light {
    --status-positive-text: var(--black-500);
    --search-popout-date-picker-hint-value-text: var(--black-500);
}
.theme-dark {
    --header-secondary: var(--primary-300);
    --text-muted: var(--primary-300);
    --interactive-muted: var(--primary-430);
    --background-mentioned: hsl(var(--brand-500-hsl) / 0.18);
    --background-mentioned-hover: hsl(var(--brand-500-hsl) / 0.15);
    --mention-background: hsl(var(--brand-500-hsl) / 0.25);
    --search-popout-option-fade-hover: linear-gradient(90deg, hsl(var(--primary-530-hsl) / 0), hsl(var(--primary-530-hsl) / 0.2) 50%);
    --background-modifier-selected: hsl(var(--primary-460-hsl) / 0.6);
    --channel-text-area-placeholder: var(--primary-400);
    --channeltextarea-background: var(--primary-500);
    --scrollbar-thin-thumb: var(--primary-500);
    --scrollbar-auto-thumb: var(--primary-500);
}
.theme-light {
    --header-secondary: var(--primary-600);
    --interactive-muted: var(--primary-360);
    --background-message-hover: hsl(var(--primary-260-hsl) / 0.3);
    --background-mentioned: hsl(var(--brand-500-hsl) / 0.5);
    --background-mentioned-hover: hsl(var(--brand-500-hsl) / 0.4);
    --mention-foreground: var(--black-500);
    --mention-background: hsl(var(--brand-600-hsl) / 0.4);
    --scrollbar-thin-thumb: var(--primary-260);
    --scrollbar-auto-thumb: var(--primary-260);
    --scrollbar-auto-track: var(--background-message-hover);
    --search-popout-option-fade-hover: linear-gradient(90deg, hsl(var(--primary-260-hsl) / 0), var(--primary-260) 50%);
    --background-primary: var(--nord-light3);
    --background-secondary: var(--nord-light2);
    --background-secondary-alt: var(--primary-200);
    --background-tertiary: var(--primary-260);
}
:root {
    --user-status-online-hsl: var(--green-560-hsl);
    --user-status-online: hsl(var(--user-status-online-hsl) / 1);
    --user-status-idle-hsl: var(--orange-500-hsl);
    --user-status-idle: hsl(var(--user-status-idle-hsl) / 1);
    --user-status-dnd-hsl: var(--red-500-hsl);
    --user-status-dnd: hsl(var(--user-status-dnd-hsl) / 1);
    --user-status-invisible-hsl: var(--primary-430-hsl);
    --user-status-invisible: hsl(var(--user-status-invisible-hsl) / 1);
    --user-status-twitch-hsl: var(--nord-pink-hsl);
    --user-status-twitch: hsl(var(--user-status-twitch-hsl) / 1);
}
::selection {
    background-color: hsl(var(--blue-345-hsl) / 0.25);
}
.slider-HJFN2i rect[fill="white"] {
    fill: var(--white-500);
}
.container-1QtPKm[style*="background-color: rgb(35, 165, 90)"] {
    background-color: var(--green-560) !important;
}
.slider-HJFN2i path[fill^="rgba(35, 165, 90"] {
    fill: var(--green-760);
}
.container-1QtPKm[style*="background-color: rgb(128, 132, 142)"] {
    background-color: var(--primary-500) !important;
}
.slider-HJFN2i path[fill^="rgba(128, 132, 142"] {
    fill: var(--primary-500);
}
.theme-dark .bar-2H7Q9u,
.theme-dark .markDash-1ATsxA {
    background-color: var(--primary-460);
}
.theme-light .bar-2H7Q9u,
.theme-light .markDash-1ATsxA {
    background-color: var(--primary-160);
}
.categoryItem-Kc_HK_.selectedCategoryItem-ZjqSui,
.colorDefault-2_rLdz.focused-3LIdPu:not(.colorDanger-3umuSx):not(.menuItemFocused-2cC4Ku),
.colorDefault-2_rLdz.focused-3LIdPu:not(.colorDanger-3umuSx):not(.menuItemFocused-2cC4Ku) .caret-1TZU-U,
.colorDefault-2_rLdz.focused-3LIdPu:not(.colorDanger-3umuSx):not(.menuItemFocused-2cC4Ku) .checkbox-397WsK,
.colorDefault-2_rLdz.focused-3LIdPu:not(.colorDanger-3umuSx):not(.menuItemFocused-2cC4Ku) .radioSelection-3PDNAQ,
.colorDefault-2_rLdz.focused-3LIdPu:not(.colorDanger-3umuSx):not(.menuItemFocused-2cC4Ku) .subtext-1mqKVB,
.focused-3RdCfX .userMenuUsername-2xdVcJ .userMenuDiscriminator-2Vj2p9,
.focused-3RdCfX .userMenuUsername-2xdVcJ .userMenuText-2e3Dry,
.lookFilled-1H2Jvj.colorBrand-2M3O3N:not(.button-1EGGcP):not(.button-35nmN9),
.lookFilled-1H2Jvj.colorBrandNew-abZT3v,
.lookOutlined-3RTC7c.colorBrand-2M3O3N:hover,
.premiumLabel-3HPvdB.selected-2Uns2B {
    color: var(--black-500);
}
.activeButton-LRWFC_,
.button-2WPG1w[style*="color: rgb(255, 255, 255)"] {
    color: var(--black-500) !important;
}
.-allow-1h61-Z.selected-3jieYB,
.activeCircle-3rE6-u,
.button-1EGGcP.buttonColor-3bP3fX.buttonActive-Uc1jHx,
.calendarPicker-sDhzdi .react-datepicker__day.react-datepicker__day--keyboard-selected,
.calendarPicker-sDhzdi .react-datepicker__day.react-datepicker__day--selected:hover,
.calendarPicker-sDhzdi .react-datepicker__day:hover,
.checkmark-1lGv7h,
.colorDefault-2_rLdz .check-3-73a4,
.lookFilled-1H2Jvj.colorGreen-jIPCAS,
.uploadDropModal-13Kd20 .inner-rBP-MS .instructions-272j2A,
.uploadDropModal-13Kd20 .inner-rBP-MS .title-3ChJ_v,
.uploadDropModal-13Kd20 .inner-rBP-MS .title-3ChJ_v strong {
    color: var(--black-500);
}
.activeIcon-1ykRnF circle[fill="var(--white-500)"],
.activeIcon-1ykRnF path[fill="var(--white-500)"],
.checkIcon-3eAeN_ path[fill="var(--white-500)"],
.checkbox-1LuCGM[style*="background-color: rgb(35, 165, 90)"] path[fill="var(--white-500)"],
.checked-22NTbO[style*="background-color: var(--brand-experiment-500)"] path[fill="var(--white-500)"],
.checklistIcon-nKaK0A circle[fill="var(--white-500)"],
.descriptionIcon-3nDZrK circle[cx="12"][fill="var(--white-500)"],
.icon-2dMyvd circle[fill="var(--white-500)"],
.premiumLabel-3HPvdB.selected-2Uns2B path[fill="url(#paint0_linear_6413_12612)"],
.premiumLabel-3HPvdB.selected-2Uns2B path[fill="url(#paint1_linear_6413_12612)"],
.selectedIcon-122rMx circle[fill="white"] {
    fill: var(--black-500);
}
.content-FDHp32 a {
    color: var(--text-link);
}
.fixed-cTX7Hp {
    color: var(--status-danger);
}
.fixed-cTX7Hp::after {
    background-color: var(--status-danger);
}
.improved-2SJXHz {
    color: var(--brand-500);
}
.improved-2SJXHz::after {
    background-color: var(--brand-500);
}
.streamerModeEnabledBtn-2nlJTD:hover {
    background-color: #a3759b;
}
.searchAnswer-23w-CH,
.searchFilter-2UfsDk {
    background-color: var(--background-primary) !important;
    color: var(--text-normal);
}
.icon-HW4tZ-.two-1t2_74 {
    filter: drop-shadow(0 0 48px hsla(var(--brand-500-hsl) / 0.5));
}
.document-1u6V3N {
    background-image: url(https://raw.githubusercontent.com/orblazer/discord-nordic/v4.10.5/assets/global/upload-document.svg);
}
.code-rRQnfi {
    background-image: url(https://raw.githubusercontent.com/orblazer/discord-nordic/v4.10.5/assets/global/upload-code.svg);
}
.image-2ssF8k {
    background-image: url(https://raw.githubusercontent.com/orblazer/discord-nordic/v4.10.5/assets/global/upload-image.svg);
}
.webcode-18ObW7 {
    background-image: url(https://raw.githubusercontent.com/orblazer/discord-nordic/v4.10.5/assets/global/upload-webcode.svg);
}
.scroller-3X7KbA {
    background-color: var(--background-secondary-alt) !important;
}
.panels-3wFtMD {
    border-left: 1px solid var(--background-secondary);
}
.expandedFolderBackground-1kSAf6,
.folder-241Joy:not(.hover-3m7-WT) {
    background-color: var(--background-primary) !important;
}
.theme-dark .folder-241Joy.hover-3m7-WT,
.theme-dark .wrapper-38slSD .wrapper-3kah-n:not(.selected-1Drb7Z) .childWrapper-1j_1ub {
    background-color: var(--primary-500);
}
.theme-light .folder-241Joy.hover-3m7-WT,
.theme-light .wrapper-38slSD .wrapper-3kah-n:not(.selected-1Drb7Z) .childWrapper-1j_1ub {
    background-color: var(--primary-160);
}
.childWrapper-1j_1ub rect[fill="#6370f4"] {
    fill: var(--brand-500);
}
.wrapper-3kah-n.selected-1Drb7Z .childWrapper-1j_1ub g[fill="var(--white-500)"] {
    fill: var(--white-100);
}
.content-2Nqgau,
.contentPremium-_Y0-cX .lookLink-13iF2K.colorWhite-Eshn2o,
.iconBadge-32fMme.participating-2Z81oO,
.premiumIcon-hLV4L9,
.subheaderText-3eTD8a a,
.wrapper-3kah-n.selected-1Drb7Z .childWrapper-1j_1ub,
.wrapper-3kah-n:hover .childWrapper-1j_1ub {
    color: var(--black-500);
}
.defaultColor-1GKx81[style*="color: white"],
.subheaderText-3eTD8a[style*="color: white"],
.subheaderText-Jg7wmo[style*="color: white"],
.text-sm-normal-AEQz4v[style*="color: white"] {
    color: var(--black-500) !important;
}
.contentPremium-_Y0-cX .lookLink-13iF2K.colorWhite-Eshn2o:hover .contents-3NembX {
    --button--underline-color: var(--black-500);
}
.contentPremium-_Y0-cX .pointer-1iS5lL {
    border-top-color: var(--premium-tier-2-pink);
}
.circleIconButton-1VxDrg.selected-2r1Hvo {
    color: var(--black-500);
}
.iconContainer-GFfNaA circle[fill="#5865f2"i],
.snowsgivingIcon-3d0pr1 path[fill="#5865f2"i] {
    fill: var(--brand-500);
}
.iconContainer-GFfNaA circle[fill="#5865f2"i] + path[fill="white"] {
    fill: var(--black-500);
}
.hljs-ansi-background-cyan,
.hljs-ansi-background-green,
.hljs-ansi-background-magenta,
.hljs-ansi-background-white,
.hljs-ansi-background-yellow,
.hljs-ansi-foreground-black .hljs-ansi-background-black,
.hljs-ansi-foreground-black .hljs-ansi-background-blue,
.hljs-ansi-foreground-black .hljs-ansi-background-cyan,
.hljs-ansi-foreground-black .hljs-ansi-background-green,
.hljs-ansi-foreground-black .hljs-ansi-background-magenta,
.hljs-ansi-foreground-black .hljs-ansi-background-red,
.hljs-ansi-foreground-black .hljs-ansi-background-white,
.hljs-ansi-foreground-black .hljs-ansi-background-yellow {
    color: var(--primary-800);
}
.hljs-ansi-foreground-black {
    color: var(--primary-430);
}
.hljs-ansi-foreground-red {
    color: var(--nord-red);
}
.hljs-ansi-foreground-green {
    color: var(--nord-green);
}
.hljs-ansi-foreground-yellow {
    color: var(--nord-yellow);
}
.hljs-ansi-foreground-blue {
    color: var(--nord-blue);
}
.hljs-ansi-foreground-magenta {
    color: var(--nord-pink);
}
.hljs-ansi-foreground-cyan {
    color: var(--nord-cyan);
}
.hljs-ansi-background-blue,
.hljs-ansi-background-red,
.hljs-ansi-foreground-white .hljs-ansi-background-black,
.hljs-ansi-foreground-white .hljs-ansi-background-blue,
.hljs-ansi-foreground-white .hljs-ansi-background-cyan,
.hljs-ansi-foreground-white .hljs-ansi-background-green,
.hljs-ansi-foreground-white .hljs-ansi-background-magenta,
.hljs-ansi-foreground-white .hljs-ansi-background-red,
.hljs-ansi-foreground-white .hljs-ansi-background-white,
.hljs-ansi-foreground-white .hljs-ansi-background-yellow {
    color: var(--primary-160);
}
.hljs-ansi-background-black {
    background-color: var(--primary-700);
}
.hljs-ansi-background-red {
    background-color: var(--nord-orange);
}
.hljs-ansi-background-green {
    background-color: var(--nord-green);
}
.hljs-ansi-background-yellow {
    background-color: var(--nord-yellow);
}
.hljs-ansi-background-blue {
    background-color: var(--nord-blue);
}
.hljs-ansi-background-magenta {
    background-color: var(--nord-pink);
}
.hljs-ansi-background-cyan {
    background-color: var(--nord-cyan);
}
.hljs-ansi-background-white {
    background-color: var(--nord-light3);
}
.hljs-attribute,
.hljs-params,
.hljs-subst,
.hljs-template-variable,
.hljs-variable {
    color: var(--header-secondary) !important;
}
.hljs-comment,
.hljs-quote {
    color: var(--primary-430) !important;
}
.theme-light .hljs-emphasis {
    color: var(--primary-600);
}
.theme-dark .hljs-emphasis {
    color: var(--primary-400);
}
.hljs-link {
    color: inherit;
}
.hljs-builtin-name,
.hljs-bullet,
.hljs-doctag,
.hljs-keyword,
.hljs-literal,
.hljs-name,
.hljs-operator,
.hljs-selector-tag,
.hljs-symbol,
.hljs-tag {
    color: var(--nord-cyan) !important;
}
.hljs-selector-id {
    font-weight: 700;
}
.hljs-attr,
.hljs-built_in,
.hljs-class,
.hljs-code,
.hljs-formula,
.hljs-selector-attr,
.hljs-selector-class,
.hljs-selector-id,
.hljs-title,
.hljs-type {
    color: var(--nord-green-blue) !important;
}
.hljs-function,
.hljs-function > .hljs-title,
.hljs-section,
.hljs-selector-pseudo {
    color: var(--nord-turquoise) !important;
}
.hljs-number {
    color: var(--nord-pink) !important;
}
.hljs-regexp {
    color: var(--nord-yellow) !important;
}
.hljs-meta-string,
.hljs-string {
    color: var(--nord-green) !important;
}
.hljs-link {
    text-decoration: underline;
}
.hljs-meta-keyword,
.hljs-template-tag {
    color: var(--nord-blue) !important;
}
.hljs-meta {
    color: var(--nord-orange) !important;
}
.hljs-addition,
.hljs-deletion {
    color: var(--white-100) !important;
    background-color: hsl(var(--red-500-hsl) / 0.45) !important;
}
.hljs-addition {
    background-color: hsl(var(--green-500-hsl) / 0.45) !important;
}
.hljs-title ~ .hljs-title {
    font-weight: 700;
}
.abnf .hljs-attribute,
.apache .hljs-attribute,
.arduino .hljs-built_in,
.aspectj > .hljs-title,
.clojure .hljs-name,
.coq .hljs-built_in,
.css .hljs-built_in,
.glsl .hljs-built_in,
.julia .hljs-meta,
.lisp .hljs-name,
.lua .hljs-built_in,
.moonscript .hljs-built_in,
.nginx .hljs-attribute,
.pf .hljs-built_in,
.processing .hljs-built_in,
.rb .hljs-subst,
.ruby .hljs-subst,
.swift .hljs-subst,
.vim .hljs-built_in {
    color: var(--nord-turquoise) !important;
}
.abnf .hljs-symbol,
.clojure .hljs-symbol,
.css .hljs-attribute,
.less .hljs-attribute,
.scss .hljs-attribute {
    color: var(--nord-yellow) !important;
}
.apache .hljs-section,
.bash .hljs-variable,
.ini .hljs-variable,
.makefile .hljs-variable,
.powershell .hljs-operator,
.powershell .hljs-type,
.ps1 .hljs-operator,
.ps1 .hljs-type,
.rb .hljs-variable,
.ruby .hljs-variable {
    color: var(--nord-cyan) !important;
}
.aspectj .hljs-meta,
.css .hljs-keyword,
.groovy .hljs-meta:not(:first-child),
.haxe .hljs-meta,
.java .hljs-meta,
.swift .hljs-meta,
.yaml .hljs-meta {
    color: var(--nord-orange) !important;
}
.bnf .hljs-attribute,
.cpp .hljs-meta-string,
.diff .hljs-meta,
.ebnf .hljs-attribute,
.ldif .hljs-attribute {
    color: var(--nord-green-blue) !important;
}
.nginx .hljs-section {
    color: var(--nord-blue) !important;
}
.vim .hljs-built_in {
    font-style: italic;
}
.handlebars .hljs-template-tag {
    color: var(--header-secondary) !important;
}
.markdown .hljs-string,
.md .hljs-string {
    color: var(--nord-turquoise) !important;
}
.ini .hljs-attr {
    color: var(--nord-cyan) !important;
}
.link-39sEB3 .offerBadge-1KDtMz.isSelected-2AgtRL {
    color: inherit !important;
}
.icon-2O29O0[src="/assets/d759f3acc6286c964cc8118d7f68b374.svg"] {
    content: url(https://raw.githubusercontent.com/orblazer/discord-nordic/v4.10.5/assets/user/friends/discover.svg);
}
.profileBadge-2YySEb[src="/assets/48d5bdcffe9e7848067c2e187f1ef951.svg"] {
    content: url(https://raw.githubusercontent.com/orblazer/discord-nordic/v4.10.5/assets/user/profile/badge-staff.svg);
}
.profileBadge-2YySEb[src="/assets/34306011e46e87f8ef25f3415d3b99ca.svg"],
.profileBadge18-2GrGvU[src*="3f9748e53446a137a052f3454e2de41e.png"] {
    content: url(https://raw.githubusercontent.com/orblazer/discord-nordic/v4.10.5/assets/user/profile/badge-partner.svg);
}
.profileBadge-2YySEb[src="/assets/e666a84a7a5ea2abbbfa73adf22e627b.svg"],
.profileBadge18-2GrGvU[src*="bf01d1073931f921909045f3a39fd264.png"] {
    content: url(https://raw.githubusercontent.com/orblazer/discord-nordic/v4.10.5/assets/user/profile/badge-hypesquad-event.svg);
}
.profileBadge-2YySEb[src="/assets/efcc751513ec434ea4275ecda4f61136.svg"] {
    content: url(https://raw.githubusercontent.com/orblazer/discord-nordic/v4.10.5/assets/user/profile/badge-hypesquad-bravery.svg);
}
.profileBadge-2YySEb[src="/assets/ec8e92568a7c8f19a052ef42f862ff18.svg"] {
    content: url(https://raw.githubusercontent.com/orblazer/discord-nordic/v4.10.5/assets/user/profile/badge-hypesquad-brillance.svg);
}
.profileBadge-2YySEb[src="/assets/9f00b18e292e10fc0ae84ff5332e8b0b.svg"],
.profileBadge18-2GrGvU[src*="3aa41de486fa12454c3761e8e223442e.png"] {
    content: url(https://raw.githubusercontent.com/orblazer/discord-nordic/v4.10.5/assets/user/profile/badge-hypesquad-balance.svg);
}
.profileBadge-2YySEb[src="/assets/4441e07fe0f46b3cb41b79366236fca6.svg"] {
    content: url(https://raw.githubusercontent.com/orblazer/discord-nordic/v4.10.5/assets/user/profile/badge-early-verified-bot.svg);
}
.profileBadge-2YySEb[src="/assets/b945002f0e0fd7f11990d800e98b5504.svg"] {
    content: url(https://raw.githubusercontent.com/orblazer/discord-nordic/v4.10.5/assets/user/profile/badge-certified-moderator.svg);
}
.profileBadge-2YySEb[src="/assets/26c7a60fb1654315e0be26107bd47470.svg"],
.profileBadge18-2GrGvU[src*="6bdc42827a38498929a4920da12695d9.png"] {
    content: url(https://raw.githubusercontent.com/orblazer/discord-nordic/v4.10.5/assets/user/profile/badge-active-developer.svg);
}
.botTagRegular-kpctgU:not(.botTagOP-3pUTXu) {
    color: var(--black-500);
}
.profileBadge18-2GrGvU[src*="6f9e37f9029ff57aef81db857890005e.png"],
.profileBadge22-3OAigE[src="/assets/498591d63b352256a1bf18061eff9d57.svg"] {
    content: url(https://raw.githubusercontent.com/orblazer/discord-nordic/v4.10.5/assets/user/profile/badge-commands.svg);
}
.mask-1y0tyc rect[fill="#23a55a"] {
    fill: var(--user-status-online);
}
.mask-1y0tyc rect[fill="#f0b232"] {
    fill: var(--user-status-idle);
}
.mask-1y0tyc rect[fill="#f23f43"] {
    fill: var(--user-status-dnd);
}
.mask-1y0tyc rect[fill="#80848e"] {
    fill: var(--user-status-invisible);
}
.mask-1y0tyc rect[fill="#593695"] {
    fill: var(--user-status-twitch);
}
.offerBadge-1KDtMz,
.upsellTooltipWrapper-1wqikQ .content-3aT_vH,
.upsellTooltipWrapper-1wqikQ .header-HL0rH- {
    color: var(--black-500) !important;
}
.mask-3tgVZv rect[fill="#23a55a"],
.mask-3tgVZv rect[fill^="rgba(35, 165, 90"] {
    fill: var(--user-status-online);
}
.mask-3tgVZv rect[fill="#f0b232"],
.mask-3tgVZv rect[fill^="rgba(240, 178, 50"] {
    fill: var(--user-status-idle);
}
.mask-3tgVZv rect[fill="#f23f43"],
.mask-3tgVZv rect[fill^="rgba(242, 63, 67"] {
    fill: var(--user-status-dnd);
}
.mask-3tgVZv rect[fill="#593695"],
.mask-3tgVZv rect[fill^="rgba(89, 54, 149"] {
    fill: var(--user-status-twitch);
}
.mask-3tgVZv rect[fill="#80848e"],
.mask-3tgVZv rect[fill^="rgba(128, 132, 142"] {
    fill: var(--user-status-invisible);
}
.icon-JRJzJz[style*='background-image: url("/assets/7f75ab26bc5deb393cd8db44d9fe14e7.svg")'] {
    background-image: url(https://raw.githubusercontent.com/orblazer/discord-nordic/v4.10.5/assets/user/dm-channel/call-incoming.svg) !important;
}
.icon-JRJzJz[style*='background-image: url("/assets/5e64269a40d5bb745c2f3df29f26738d.svg")'] {
    background-image: url(https://raw.githubusercontent.com/orblazer/discord-nordic/v4.10.5/assets/user/dm-channel/call-missed.svg) !important;
}
.base-3IDx3L[style*="background-color: var(--brand-500)"] {
    color: var(--black-500);
}
.limitedTimeBadge-JvRtll {
    background: 0 0;
    background-color: var(--premium-tier-2-pink) !important;
}
.limitedTimeText-1YqDvf[style*="color: white"],
.upsellTextContainer-2_9JSn .text-lg-semibold-UQkeZc[style*="color: white"] {
    color: var(--black-500) !important;
}
.lockIcon-3t6Ow0[src="/assets/55b367aaef0b83c837ac6c3bfe01da4c.svg"],
.secured-2wavXv:before {
    content: url(https://raw.githubusercontent.com/orblazer/discord-nordic/v4.10.5/assets/user/settings/general/lock.svg);
}
.questionMark-3V9mGJ .icon-3JHfo7 {
    color: var(--black-500);
}
.theme-dark .imageUploaderIcon-2OHmFu {
    background-image: url(https://raw.githubusercontent.com/orblazer/discord-nordic/v4.10.5/assets/user/settings/general/upload.svg);
}
.premiumFeatureBorder-1i95si,
.upsellOverlayContainer-3NMgTS {
    background: linear-gradient(var(--background-primary), var(--background-primary)) padding-box, linear-gradient(45deg, var(--premium-tier-2-purple-for-gradients), var(--premium-tier-2-pink-for-gradients)) border-box;
}
.upsellTextContainer-2_9JSn {
    background: linear-gradient(90deg, var(--premium-tier-2-purple-for-gradients), var(--premium-tier-2-pink-for-gradients));
}
.checklistIcon-S-7rG0 circle[fill="var(--white-100)"],
.selectedIcon-19TbzU circle[fill="white"] {
    fill: var(--black-500);
}
.permissionCheckmark-ji-OoY {
    background-image: url(https://raw.githubusercontent.com/orblazer/discord-nordic/v4.10.5/assets/user/settings/general/checkmark.svg);
}
.promoHeader-1ai_Qc {
    color: currentColor !important;
}
.hero-2rQ_qr .description-3QR_Ur a,
.rulesLink-15zGJh {
    color: currentColor;
}
.hero-2rQ_qr {
    background: linear-gradient(100.54deg, var(--nord-blue) 18.42%, var(--nord-cyan) 76.57%, var(--nord-turquoise) 99.51%);
}
.hero-2rQ_qr .description-3QR_Ur {
    color: var(--white-100) !important;
}
.betaTag-1SPc-F,
.betaTag-3EG9SR {
    background: var(--premium-perk-pink) !important;
    color: var(--black-500);
}
.settingsTextContainer-3grHhq .defaultColor-1GKx81[style*="color: white"],
.settingsTextContainer-3grHhq .description-2_tPhd[style*="color: white"] {
    color: var(--header-primary) !important;
}
.lookInverted-2GrLaB.colorBrand-2M3O3N,
.upsellButton-36YQ7c {
    color: var(--brand-800);
}
.premiumCards-36uMGt .pricePerInterval-1HgDkM[style*="color: white"],
.premiumCards-36uMGt .text-md-normal-2rFCH3[style*="color: white"],
.tier2-qNjKTW .text-md-normal-2rFCH3 {
    color: currentColor !important;
}
.tier0-17mYUd {
    background: var(--premium-tier-0-blue);
}
.tier2-qNjKTW {
    background: var(--premium-tier-2-pink);
    color: var(--primary-660);
}
.newTagItem-1LPxlR {
    background: var(--white-500);
    color: var(--black-500);
}
.containerColored-3FAZAx .sparkle-20-Tko.sparkleStarTopRight-9-iiLE,
.theme-light .sparkle-20-Tko.sparkleStarTopRight-9-iiLE {
    color: var(--brand-experiment-400);
}
.containerColored-3FAZAx .sparkle-20-Tko.sparkleStarRight-1EeOs8,
.theme-light .sparkle-20-Tko.sparkleStarRight-1EeOs8 {
    color: var(--premium-perk-pink);
}
.tier2-qNjKTW .containerColored-3FAZAx .sparkle-20-Tko.sparkleStarRight-1EeOs8 {
    color: var(--premium-perk-light-blue);
}
.tag-3Upstw:not(.smallPerkCardNewBadge-3-NllX) {
    color: var(--black-500);
}
.smallPerkCardNewBadge-3-NllX {
    background: var(--premium-perk-pink);
    color: var(--black-500) !important;
}
.mostPopularText-1WuXKM {
    color: var(--primary-660);
}
.sparkleStar1-2v0V0s {
    color: var(--premium-perk-blue);
}
.sparkleStar2-1ry0eu {
    color: var(--premium-perk-dark-blue);
}
.sparkleStar3-3rxehx {
    color: var(--premium-perk-light-blue);
}
.sparkleStar4-3-pq8C {
    color: var(--premium-perk-pink);
}
.planOptionDiscount-2nex9n[style*="color: white"] {
    color: var(--black-500) !important;
}
.warnIcon-3ly1wg {
    background-image: url(https://raw.githubusercontent.com/orblazer/discord-nordic/v4.10.5/assets/user/settings/payment/warn.svg);
}
.audioQualityIcon-2V2mE1 {
    color: var(--nord-blue);
}
.uploadSizeIcon-3OSRBC {
    color: var(--premium-tier-2-pink);
}
.notches-2w7UZJ.gray-3wP137 {
    color: var(--background-primary) !important;
}
.theme-dark .progress-1S-TDF {
    background-color: var(--primary-430);
}
.theme-light .progress-1S-TDF {
    background-color: var(--nord-light);
}
.theme-dark .container-30qY7E {
    border-color: var(--primary-630);
}
.nowPlaying-3UpuKc .gameName-zbZetm,
.nowPlaying-3UpuKc .lastPlayed-1jum9A,
.nowPlaying-3UpuKc .overlayStatusText-In0YrK {
    color: var(--black-500) !important;
}
.default-1Tkeeg {
    background-image: url(https://raw.githubusercontent.com/orblazer/discord-nordic/v4.10.5/assets/user/settings/activity/cross.svg);
}
.newChannel-3q3LPr {
    color: var(--brand-900);
}
.icon-3BYlXK {
    color: var(--black-500);
}
.iconBackgroundTierNone-3M21Zn,
.iconBackgroundTierOne-1S68CI,
.iconBackgroundTierThree-2hfNBO,
.iconBackgroundTierTwo-2XoNXD {
    color: var(--primary-500) !important;
}
.ping-2J18Tq {
    content: url(https://raw.githubusercontent.com/orblazer/discord-nordic/v4.10.5/assets/server/ping.svg);
}
.container-20TyK0[style*="background-color: rgb(17, 18, 20)"] {
    background-color: var(--background-floating) !important;
}
.button-29sJG8:hover,
.button-3_1yil:hover {
    background-color: var(--brand-experiment-500);
    color: var(--black-500);
}
.header-16U6Vf {
    background: center 15%/90%auto url(https://raw.githubusercontent.com/orblazer/discord-nordic/v4.10.5/assets/server/boost/sparks.svg) no-repeat, linear-gradient(359.37deg, rgba(0, 0, 0, 0.5) 12.68%, hsla(0deg, 0%, 100%, 0) 50.4%),
        linear-gradient(
            159.15deg,
            var(--premium-tier-0-header-gradient-1) 8.49%,
            var(--premium-tier-0-header-gradient-2) 32.21%,
            var(--premium-tier-0-header-gradient-3) 62.9%,
            var(--premium-tier-0-header-gradient-4) 86.06%,
            var(--premium-tier-0-header-gradient-5) 91.4%
        );
}
.header-16U6Vf .guildName-3bWSIw,
.header-16U6Vf .heading-r8UAKC {
    color: var(--white-500) !important;
}
.guildBoostCount-ghTpE8 {
    color: var(--white-100);
}
.guildBoostCtaBoostContent-FoEo51 {
    color: var(--brand-800);
}
.progressBarMarker-2dy17R + .progressBarMarker-2dy17R .progressBarMarkerLabel-2EgZ3G {
    color: var(--primary-800);
}
.tierCardCurrentTier-ed2p6N {
    background: var(--guild-boosting-purple);
    color: var(--black-500) !important;
}
.tierCardNewFeatureBadge-Ber503 {
    background: var(--white-500);
    color: var(--black-500);
}
.tierCardBoostRequirement-1ZQXbZ {
    color: var(--primary-800) !important;
}
.tierCardHeading-2752oA,
.tierCardListItem-n3jr78 {
    color: var(--primary-700) !important;
}
.tierCardListIcon-1nx1pO circle[fill="white"],
.tierCardListIcon-1nx1pO rect[fill="white"] {
    fill: currentColor;
}
.recommendedTierHighlightTag-2Vgifo {
    color: var(--black-500) !important;
    background: var(--guild-boosting-purple);
}
.wrapper-1ReDXd .defaultColor-1GKx81[style*="color: white"] {
    color: var(--black-500) !important;
}
.directoryModal-YJsOMv {
    background-color: var(--background-primary) !important;
}
.premiumIcon-3uw5J0[src="/assets/61550500acf9704ea60d48d688f07f08.svg"] {
    content: url(https://raw.githubusercontent.com/orblazer/discord-nordic/v4.10.5/assets/server/app-directory/dollar.svg);
}
.button-35nmN9 {
    color: var(--primary-700) !important;
}
.scopeCheck-3trytX {
    color: var(--black-500);
}
.headerSuccess-3n55Ht {
    background-image: url(https://raw.githubusercontent.com/orblazer/discord-nordic/v4.10.5/assets/server/app-directory/success.svg);
}
.checked-22NTbO[style*="background-color: rgba(35, 165, 90, 0.15)"] {
    border-color: hsl(var(--green-360-hsl) / 0.15) !important;
    background-color: hsl(var(--green-360-hsl) / 0.15) !important;
}
.checked-22NTbO path[fill="#23a55a"] {
    fill: var(--green-360);
}
.checked-22NTbO[style*="background-color: rgb(35, 165, 90)"] {
    border-color: var(--green-360) !important;
    background-color: var(--green-360) !important;
}
.serverBoostTabItem-3QwA3W[aria-selected="true"] {
    color: var(--black-500) !important;
}
.serverBoostTabItem-3QwA3W[aria-selected="true"] .icon-3FU6Ir {
    fill: var(--black-500) !important;
}
.icon-3FU6Ir[fill="#ff73fa"i] {
    fill: var(--guild-boosting-pink);
}
.upsellDescription-2O_p3B,
.upsellHeader-3707cG {
    color: var(--white-100);
}
.currentTierIcon-23IR3F {
    color: var(--black-500) !important;
}
.permissionV3BannerContainer-3_4aSa path[fill="#737FFF"] {
    fill: var(--brand-400);
}
.permissionV3BannerContainer-3_4aSa path[fill="#202225"] {
    fill: var(--background-tertiary);
}
.permissionV3BannerContainer-3_4aSa path[fill="#2F3136"] {
    fill: var(--background-primary);
}
.permissionV3BannerContainer-3_4aSa line[stroke="#3B3D42"] {
    stroke: var(--background-secondary-alt);
}
.permissionV3BannerContainer-3_4aSa path[fill="white"] {
    fill: var(--header-primary);
}
.permissionV3BannerContainer-3_4aSa path[fill="#B9BBBE"] {
    fill: var(--text-muted);
}
.permissionV3BannerContainer-3_4aSa path[fill="#00B0F4"] {
    fill: var(--text-link);
}
.permissionV3BannerContainer-3_4aSa path[fill="#8CD9FF"] {
    fill: var(--nord-cyan);
}
.permissionV3BannerContainer-3_4aSa path[fill="#3442D9"],
.permissionV3BannerContainer-3_4aSa path[fill="#66BCFF"] {
    fill: var(--blue-330);
}
.permissionV3BannerContainer-3_4aSa path[fill="black"] {
    fill: var(--black-500);
}
.permissionV3BannerContainer-3_4aSa path[fill="#FFE75C"] {
    fill: var(--yellow-500);
}
.permissionV3BannerContainer-3_4aSa path[fill="#57F287"] {
    fill: var(--green-500);
}
.permissionV3BannerContainer-3_4aSa path[fill="#FF78B9"] {
    fill: var(--nord-pink);
}
.applicationIcon-SVAEk2[src="/assets/bd935213414be433dbfce91f7506bf54.svg"] {
    content: url(https://raw.githubusercontent.com/orblazer/discord-nordic/v4.10.5/assets/server/settings/moderation/rules.svg);
}
.applicationIcon-SVAEk2[src="/assets/c90de2083432d65530258ceac785f427.svg"] {
    content: url(https://raw.githubusercontent.com/orblazer/discord-nordic/v4.10.5/assets/server/settings/moderation/rules-light.svg);
}
.textBadge-v9EW9y[style*="background-color: var(--brand-500)"] {
    color: var(--black-500);
}
.automodText-azqvwf {
    color: currentColor;
}
.typeCreate--o_pRH:after {
    background: url(https://raw.githubusercontent.com/orblazer/discord-nordic/v4.10.5/assets/server/settings/moderation/type-create.svg);
}
.typeUpdate-34INPr:after {
    background: url(https://raw.githubusercontent.com/orblazer/discord-nordic/v4.10.5/assets/server/settings/moderation/type-update.svg);
}
.typeDelete-1AYMTg:after {
    background: url(https://raw.githubusercontent.com/orblazer/discord-nordic/v4.10.5/assets/server/settings/moderation/type-delete.svg);
}
.container-ZSFRqx {
    border-color: var(--c-reaction-border);
}
.sparkles-1nSL9S[src="/assets/7418d03d0480ed13eed00c28584d275a.svg"] {
    content: url(https://raw.githubusercontent.com/orblazer/discord-nordic/v4.10.5/assets/server/settings/community/stars.svg);
}
.overviewSidebar-3JDLaJ {
    background: linear-gradient(180deg, var(--brand-500) 6.65%, var(--brand-600) 69.44%, var(--brand-800) 106.24%);
}
.header-3ABLD1,
.selected-2HDz3F .stepTitle-2LVW-a,
.stepIndex-Kqaht-,
.stepTitle-2LVW-a {
    color: var(--black-500);
}
.selected-2HDz3F .stepIndex-Kqaht- {
    color: var(--brand-900);
}
.content--gAC_W img[src="/assets/070f1b98adc8ce07c7823021133efed5.svg"] {
    content: url(https://raw.githubusercontent.com/orblazer/discord-nordic/v4.10.5/assets/server/settings/community/shield.svg);
}
.content--gAC_W img[src="/assets/d8a03b9985d824edc78c6eb4785dc949.svg"] {
    content: url(https://raw.githubusercontent.com/orblazer/discord-nordic/v4.10.5/assets/server/settings/community/wrench.svg);
}
.content--gAC_W img[src="/assets/b6193b9564ca0ecbbd1ed6b80f47646d.svg"] {
    content: url(https://raw.githubusercontent.com/orblazer/discord-nordic/v4.10.5/assets/server/settings/community/check.svg);
}
.sparkles-1JOsCC[src="/assets/89c185367e2d2dd521f4265f2b8c93ee.svg"] {
    content: url(https://raw.githubusercontent.com/orblazer/discord-nordic/v4.10.5/assets/server/settings/community/discovery-stars.svg);
}
.earningsPreviewContainer-2I6S8Z[style*="background-color: rgb(46, 54, 56)"] {
    background-color: hsl(var(--green-760-hsl) / 0.1) !important;
}
.subscriberCountValue-LI_0MN {
    background-color: var(--brand-800);
}
.subscriberCountValue-LI_0MN > .text-md-normal-2rFCH3 {
    color: var(--white-500) !important;
}
.subscriberCountText-2UmR-T path[fill="var(--white-500)"] {
    fill: var(--black-500);
}
.subscriberCountText-2UmR-T > .text-md-normal-2rFCH3 {
    color: var(--black-500) !important;
}
.checkmark-bW9BK8,
.interactive:hover,
.newMessagesBar-1hF-9G .barButtonBase-Sk2mdB {
    color: var(--black-500);
}
.icon-2dMhn4[style*='background-image: url("/assets/be71475205180432aaa6a89bd8ee306c.svg")'] {
    background-image: url(https://raw.githubusercontent.com/orblazer/discord-nordic/v4.10.5/assets/server/channel/text/invite.svg) !important;
}
.icon-2dMhn4[style*='background-image: url("/assets/40aa3feae87e9745dd56756762029544.svg")'] {
    background-image: url(https://raw.githubusercontent.com/orblazer/discord-nordic/v4.10.5/assets/server/channel/text/customize.svg) !important;
}
.icon-2dMhn4[style*='background-image: url("/assets/364cec2cc5dfb64873e3a33626a56ba1.svg")'] {
    background-image: url(https://raw.githubusercontent.com/orblazer/discord-nordic/v4.10.5/assets/server/channel/text/chat.svg) !important;
}
.icon-JRJzJz[style*='background-image: url("/assets/d1382af8d9e755bc44811b1fd92990a8.svg")'] {
    background-image: url(https://raw.githubusercontent.com/orblazer/discord-nordic/v4.10.5/assets/server/channel/text/join.svg) !important;
}
.userJoinSystemMessageIcon-3FQ_Mo path[fill="#3ba55c"] {
    fill: var(--green-600);
}
.mentioned-Tre-dv:before {
    background-color: var(--brand-500);
}
.theme-light .embedFull-1HGV2S,
.theme-light .reaction-3vwAF2 {
    background-color: var(--primary-160);
}
.theme-dark .header-13P3fr {
    background-image: url(https://raw.githubusercontent.com/orblazer/discord-nordic/v4.10.5/assets/server/channel/announcement/follow-bg.svg);
}
.theme-light .header-13P3fr {
    background-image: url(https://raw.githubusercontent.com/orblazer/discord-nordic/v4.10.5/assets/server/channel/announcement/follow-bg-light.svg);
}
.background-fkKrXt {
    background-color: var(--background-secondary-alt) !important;
}
.theme-dark .headerBarInner-2pcZSM:after {
    background: linear-gradient(180deg, rgba(var(--primary-660-rgb), 0) 0, var(--background-secondary-alt)) !important;
}
.theme-light .headerBarInner-2pcZSM:after {
    background: linear-gradient(180deg, rgba(var(--primary-160-rgb), 0) 0, var(--background-secondary-alt)) !important;
}
.container-1um7CU,
.container-2IKOsH,
.emptyPage-2TGR7j,
.header-3xB4vB,
.scrollerContainer-y16Rs9 {
    background-color: var(--background-primary) !important;
}
.innerHeader-1cC3Fp:after {
    background: linear-gradient(180deg, rgba(var(--background-primary-rgb), 0) 0, var(--background-primary)) linear-gradient(180deg, rgba(var(--background-primary-rgb), 0) 0, var(--background-primary)) !important;
}
.newBadge-24ERrk,
.newBadge-2NdCeG {
    color: var(--brand-900);
}
.channelRow-4X_3fi,
.profileCard-2gVmvm,
.prompt-1sE27N {
    background-color: var(--background-secondary);
}
.channelRow-4X_3fi:hover:not(.disabled-3cfocy) {
    background-color: var(--background-modifier-hover);
}
.botTagOP-3pUTXu,
.newBadge-1LcB6t[style*="background-color: var(--brand-260)"],
.newPostCount-3SXe5K,
.titleBadge-13kJKi[style*="background-color: var(--brand-260)"] {
    color: var(--brand-900);
}
.base-3IDx3L[style*="background-color: var(--status-positive-background)"],
.countText-1d5thl,
.countText-35ewVE,
.discordIcon-2-SnKe,
.root-1BPI9i .colorBrand-2M3O3N .defaultColor-1EVLSt {
    color: var(--black-500);
}
.inline-1Al0JA img[src="/assets/513f881c80a414c9f58190184516189b.svg"] {
    content: url(https://raw.githubusercontent.com/orblazer/discord-nordic/v4.10.5/assets/server/channel/forum/guide.svg);
}
.container-yn4cwV rect[fill="var(--white-500)"] + path,
.pinIcon-3I5-gm path[fill="white"] {
    fill: var(--black-500);
}
.contentPreview-3fWiuC,
.mainCard-3KBsBI {
    background-color: var(--background-secondary);
}
.container-2qVG6q:hover {
    background-color: var(--background-modifier-hover);
}
.reaction-102jx9 {
    background-color: var(--background-primary);
}
.gradientContainer-phMG8d {
    --color-rgb: var(--primary-700-hsl);
    background-image: linear-gradient(
        hsl(var(--color-rgb)),
        hsl(var(--color-rgb) / 0.738) 19%,
        hsl(var(--color-rgb) / 0.541) 34%,
        hsl(var(--color-rgb) / 0.382) 47%,
        hsl(var(--color-rgb) / 0.278) 56.5%,
        hsl(var(--color-rgb) / 0.194) 65%,
        hsl(var(--color-rgb) / 0.126) 73%,
        hsl(var(--color-rgb) / 0.075) 80.2%,
        hsl(var(--color-rgb) / 0.042) 86.1%,
        hsl(var(--color-rgb) / 0.021) 91%,
        hsl(var(--color-rgb) / 0.008) 95.2%,
        hsl(var(--color-rgb) / 0.002) 98.2%,
        transparent
    );
}
.selectorTextSelected-2zup8I,
.tryItOutBadge-27UB1L {
    color: var(--black-500);
}
.gradientBackground-MytxDL {
    background: linear-gradient(90deg, var(--premium-tier-2-purple-for-gradients), var(--premium-tier-2-pink-for-gradients));
    color: var(--black-500);
}
.iconColor-3MUqJ2,
.textLink-VbUIXl,
.upsellText-29l7Q- {
    color: currentColor;
}
.tooltipBrand-uKW6Xn,
.tooltipBrand-uKW6Xn .tooltipText-2kLmrq {
    color: var(--black-500) !important;
}
.emojiPickerHeader-2mWh2T img[src="/assets/99088efd1b1b695e2b026ae6923924d2.svg"] {
    content: url(https://raw.githubusercontent.com/orblazer/discord-nordic/v4.10.5/assets/server/channel/voice/emoji-party.svg);
}
.buttonColor-28DXIe {
    color: var(--white-500);
}
.buttonColor-28DXIe,
.colorable-3rVGna.primaryDark-2UJt1G,
.container-1IyjjY {
    background-color: var(--background-primary);
}
.buttonColor-28DXIe:hover,
.colorable-3rVGna.primaryDark-2UJt1G.active-3D763s,
.colorable-3rVGna.primaryDark-2UJt1G:hover,
.container-1IyjjY:hover {
    background-color: var(--background-secondary);
}
.icon-3CZSYe[style*="background-color: var(--brand-500)"],
.icon-3CZSYe[style*="background-color: var(--green-360)"] {
    color: var(--black-500);
}
.sparkleIcon-aHefnO[src="/assets/a4e25b25c89b862150e6eeb520e67dd5.svg"] {
    content: url(https://raw.githubusercontent.com/orblazer/discord-nordic/v4.10.5/assets/server/channel/stage/star.svg);
}
.sparkleIcon-aHefnO[src="/assets/72db7a1fbe5d3c861fe63c26f634b5d2.svg"] {
    content: url(https://raw.githubusercontent.com/orblazer/discord-nordic/v4.10.5/assets/server/channel/stage/cross.svg);
}
.pageWrapper-2PwDoS {
    background-color: var(--background-primary) !important;
}
.card-2TuZPZ,
.iconMask-2fMR98 {
    background-color: var(--background-secondary) !important;
}
.card-2TuZPZ:hover,
.iconMask-2fMR98:hover {
    background-color: var(--background-modifier-hover) !important;
}
.footerImage-3DpC_8[src="/assets/3ed9c7cdbea131bc485afa998a5ec93e.svg"] {
    content: url(https://raw.githubusercontent.com/orblazer/discord-nordic/v4.10.5/assets/discover/discover.svg);
}
.icon-2kPPWH {
    background-image: url(https://raw.githubusercontent.com/orblazer/discord-nordic/v4.10.5/assets/discover/hub.svg);
}
.addButton-Jt0onL {
    color: var(--black-500);
}
.artwork-L5TAwQ > path[fill="#5865f2"] {
    fill: var(--brand-600);
}
.artwork-L5TAwQ circle[stroke="#29cc7a"] {
    stroke: var(--nord-green);
}
.artwork-L5TAwQ g[data-name="Layer 21"] > path[fill="#4452f2"],
.artwork-L5TAwQ g[data-name="Layer 22"] > path[fill="#4452f2"],
.artwork-L5TAwQ path[fill="#6270fc"],
.artwork-L5TAwQ path[fill="#6874f7"],
.artwork-L5TAwQ > path[fill="#4452f2"] {
    fill: var(--brand-500);
}
.artwork-L5TAwQ path[fill="#6a77fc"],
.artwork-L5TAwQ path[fill="#707cff"] {
    fill: var(--brand-400);
}
.artwork-L5TAwQ circle[fill="#0c1aad"],
.artwork-L5TAwQ > path[fill="#3442d9"] {
    fill: var(--brand-800);
}
.artwork-L5TAwQ g[data-name="Layer 22"] > path[fill="#eb459f"],
.artwork-L5TAwQ > path[fill="#ff78b9"] {
    fill: var(--nord-pink);
}
.artwork-L5TAwQ path[fill="#91ffad"] {
    fill: var(--nord-green);
}
.artwork-L5TAwQ circle[fill="#66bcff"],
.artwork-L5TAwQ g[data-name="Layer 14"] > path[fill="#66bcff"],
.artwork-L5TAwQ path[fill="#4ab0ff"],
.artwork-L5TAwQ > path[fill="#66bcff"] {
    fill: var(--nord-cyan);
}
.iconApple-3GcJtX {
    background-image: url(https://raw.githubusercontent.com/orblazer/discord-nordic/v4.10.5/assets/web/apple.svg);
}
.iconAndroid-2DSyPS {
    background-image: url(https://raw.githubusercontent.com/orblazer/discord-nordic/v4.10.5/assets/web/android.svg);
}
.iconWindows-1o_-54 {
    background-image: url(https://raw.githubusercontent.com/orblazer/discord-nordic/v4.10.5/assets/web/windows.svg);
}
.button-1iHNQ2 {
    color: var(--black-500) !important;
}
.button-1iHNQ2:not(:hover) {
    border-color: currentColor !important;
}
.closeIcon-3eoP1e path {
    fill: var(--black-500);
}

/**
   * CUSTOMIZATION
   * Add '!important' non hsl discord colors, like 'primary-dark-200'
   */
:root {
}
.theme-dark {
}
.theme-light {
}
			`;
		}
	});
})();
