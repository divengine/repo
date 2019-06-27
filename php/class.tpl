{ignore}<?php{/ignore}
{= scope: "public" =}
{= type: "" =}
class {$name} ?$extends {$extends} $extends?
{
    [$properties]
    {$scope} ${$_key} ?$default = {$default} $default?;
    @empty@
    [/$properties]

    [$properties]
    public function get{camel:_key}() {
        return $this->{$_key};
    }
    @empty@
    [/$properties]

    ?$methods
    [$methods]
    {$scope} {$type} function {$_key}(?$params [$params] ${$name} ?$default = {$default} $default? !$_is_last, $_is_last! @empty@ [/$params] $params?)
    {

    }
    @empty@
    [/$methods]
    $methods?
}