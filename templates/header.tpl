<!DOCTYPE html>
<html lang="{function.localeToHTML, userLang, defaultLang}" <!-- IF languageDirection -->data-dir="{languageDirection}" style="direction: {languageDirection};" <!-- ENDIF languageDirection -->>

<head>
	<title>{browserTitle}</title>
	<!-- BEGIN metaTags -->
	<!-- IF metaTags.content -->
	{function.buildMetaTag}
	<!-- ENDIF metaTags.content -->
	<!-- END metaTags -->
	<link rel="stylesheet" type="text/css" href="{relative_path}/assets/client.css?{config.cache-buster}" />
	<!-- BEGIN linkTags -->{function.buildLinkTag}
	<!-- END linkTags -->

	<script>
		var config = JSON.parse('{{configJSON}}');
		var app = {
			user: JSON.parse('{{userJSON}}')
		};
	</script>

	<!-- IF useCustomHTML -->
	{{customHTML}}
	<!-- END -->
	<!-- IF useCustomCSS -->
	<style type="text/css">{{customCSS}}</style>
	<!-- END -->
</head>

<body class="{bodyClass} theme-{config.selectedSkin}">
	<nav id="menu" class="hidden">
		<section class="menu-profile">
			<!-- IF user.uid -->
			<!-- IF user.picture -->
			<img class="user-avatar" src="{user.picture}" />
			<!-- ELSE -->
			<div class="user-icon" style="background-color: {user.icon:bgColor};">{user.icon:text}</div>
			<!-- ENDIF user.picture -->
			<i component="user/status" class="fa fa-fw fa-circle status {user.status}"></i>
			<!-- ENDIF user.uid -->
		</section>

		<section class="menu-section" data-section="navigation">
			<h3 class="menu-section-title">[[global:header.navigation]]</h3>
			<ul class="menu-section-list"></ul>
		</section>

		<!-- IF config.loggedIn -->
		<section class="menu-section" data-section="profile">
			<h3 class="menu-section-title">[[global:header.profile]]</h3>
			<ul class="menu-section-list" component="header/usercontrol"></ul>
		</section>

		<section class="menu-section" data-section="notifications">
			<h3 class="menu-section-title">
				[[global:header.notifications]]
				<span class="counter" component="notifications/icon" data-content="0"></span>
			</h3>
			<ul class="menu-section-list notification-list-mobile" component="notifications/list"></ul>
			<p class="menu-section-list"><a href="{relative_path}/notifications">[[notifications:see_all]]</a></p>
		</section>
		{{{ if !config.disableChat }}}
		<section class="menu-section" data-section="chats">
			<h3 class="menu-section-title">
				[[global:header.chats]]
				<i class="counter" component="chat/icon" data-content="0"></i>
			</h3>
			<ul class="menu-section-list chat-list" component="chat/list"></ul>
		</section>
		{{{ end }}}
		<!-- ENDIF config.loggedIn -->
	</nav>

	<main id="panel">
		<nav class="navbar navbar-default navbar-fixed-top header" id="header-menu" component="navbar">
			<div class="load-bar">
				<div class="bar"></div>
				<div class="bar"></div>
				<div class="bar"></div>
			</div>
			<div class="container">
				<!-- IMPORT partials/menu.tpl -->
			</div>
		</nav>
		<div class="container" id="content">
			<!-- IMPORT partials/noscript/warning.tpl -->
