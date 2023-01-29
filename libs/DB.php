<?php

namespace libs;
use Envms\FluentPDO\Query;

require 'Constant.php';

/**
 * Class DB
 * Класс подключения к БД
 */
class DB
{
    public static $fluent = null;
    protected static $_instance = null;

    private function __clone() {}
    private function __wakeup() {}

    public static function getInstance(): DB
    {
        if (self::$_instance === null) { // если экземпляр данного класса не создан
            self::$_instance = new self();  // создаем экземпляр данного класса
        }
        return self::$_instance; // возвращаем экземпляр данного класса
    }

    function __construct()
    {
        $host = 'localhost';
        $db = DB_NAME;
        $user = DB_USER;
        $pass = DB_PASSWORD;
        $charset = 'utf8';
        $dsn = "mysql:host=$host;dbname=$db;charset=$charset";

        try {
            $pdo = new \PDO($dsn, $user, $pass);
            self::$fluent = new Query($pdo);
        } catch (PDOException $e) {
            die('Подключение не удалось: ' . $e->getMessage());
        }
    }
}
