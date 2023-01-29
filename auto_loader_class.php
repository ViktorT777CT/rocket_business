<?php
    /*spl_autoload_register(function($class) {
        $class_array = explode('/', str_replace('\\', '/', $class));
        $last_name = ucfirst(array_pop($class_array));
        $class_array[] = $last_name;

        $class = implode('/', $class_array);

        $filename = str_replace('\\', '/', lcfirst($class)) . '.php';
        require_once($filename);
    });*/

require './vendor/autoload.php';

    spl_autoload_register(function($class) {
        $filename = str_replace('\\', '/', $class) . '.php';
        require($filename);
    });
