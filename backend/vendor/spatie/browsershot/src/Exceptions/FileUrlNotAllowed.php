<?php

namespace Spatie\Browsershot\Exceptions;

use Exception;

class FileUrlNotAllowed extends Exception
{
    public static function make(): static
    {
        return new static('An URL is not allow to start with file:// or file:/');
    }
}
