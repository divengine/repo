<?php

define("PACKAGES", "repo/");

include "div.php";
include "custom.php";

$u = null;

if (isset($_GET['_url']))
	$u = $_GET['_url'];

if ($u[0] == "/") $u = substr($u, 1);

if ( ! is_null($u))
{
	$actions = ['get', 'parse', 'view', 'download', 'doc', 'demo'];

	$router = explode("/", $u);
	$router = $router[0];

	if (array_search($router, $actions) === false)
		$router = "get";
	else 
		$u = substr($u, strlen($router)+1);

	if (isset($aliases[$u])) $u = $aliases[$u];

	if (file_exists("./repo/{$u}.tpl"))
	{
		$tpl = file_get_contents("./repo/{$u}.tpl");

        $data = $_GET;

		if (isset($_SERVER['REQUEST_METHOD']))
			if ($_SERVER['REQUEST_METHOD'] == "POST")
				$data = $_POST;

		foreach ($data as $key => $value)
        {
            $json = div::jsonDecode($value);

            if (!is_null($json))
                $data[$key] = $json;
        }

		switch($router)
		{
			case "get":		
				header("Content-type: text/plain; charset=utf8");
				echo $tpl;
				break;
				
			case "parse": 
				header("Content-type: text/plain; charset=utf8");
				echo new div($tpl, $data);
				break;

			case "view": 
				echo new div($tpl, $data);
				break;

            case "doc":
				header("Content-type: text/html; charset=utf8");
                div::docsOn();
                $out = (new div($tpl, $data))."";
                echo div::getDocsReadable();

            case "demo":
                header("Content-type: text/plain; charset=utf8");
                echo new div($tpl, "./repo/{$u}.json");
		}
	} else 
	{
		header("Content-type: text/html");
		header("HTTP/1.0 404 Not Found");
		echo new div("internal/404.tpl", []);
	}
}
else
{

}
