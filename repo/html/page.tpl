<!--{
	@title HTML basic page
	@name  page
	@version 1.0
	@author Rafa Rodriguez <rafageist86@gmail.com>
	@vars:
		optional string pageTitle Title of the page
		optional list[key,value] Meta tags
		optional list pageScripts JS scripts of the page
		optional list pageStyles CSS styles of the page
}-->
<!DOCTYPE html>
<html>
	<head>
		?$pageTitle
		<title>{$pageTitle}</title>
		$pageTitle?

		<!--{ meta tags }-->
		[$pageMetas]
		<meta key="{$key}" value="{$value}" />
		@empty@
		[/$pageMetas]

		<!--{ assets }-->
		[$pageStyles]
		<link rel="stylesheet" href="{$value}" />
		@empty@
		[/$pageStyles]
	</head>
	<body>
		(( body ))

		<!--{ more assets }-->
		[$pageScripts]
		<script type="text/javascript" src="{$value}"></script>
		@empty@
		[/$pageScripts]

	</body>
</html>