{ignore}<?php{/ignore}
{= scope: "public" =}
{= type: "" =}
class {$name} ?$extends {$extends} $extends?
{
    [$properties]
    {$scope} ${$name} ?$default = {$default} $default?
    @empty@
    [/$properties]

    [$methods]
        {$scope} {$type} function {$_key}([$params] ${$name} ?$default = {$default} $default? !$_is_last, $_is_last! @empty@ [/$params])
        {

        }
    [/$methods]
}