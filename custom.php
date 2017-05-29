<?php

include_once "div.php";

div::addCustomModifier("camel:", function ($value) {
    $result = '';
    $parts = explode("_", trim($value));

    foreach ($parts as $part)
        $result .= ucfirst(trim($part));

    return $result;
});