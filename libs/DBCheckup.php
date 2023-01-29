<?php

namespace libs;

use Envms\FluentPDO\Exception;

/**
 * Class DBCheckup
 * Класс для работы с чекапами
 */
class DBCheckup
{
    /**
     * Получает Чек апы с БД
     * @return array|bool
     * @throws \Envms\FluentPDO\Exception
     */
    public function getItems()
    {
        return DB::$fluent
            ->from('b_check_up')
            ->fetchAll();
    }

    /**
     * Получает список преимуществ для чек апа
     * @param int $check_up_id
     * @return array|bool
     * @throws Exception
     */
    public function getAdvantagesByCheckUpId(int $check_up_id)
    {
        return DB::$fluent
            ->from('b_check_up_advantages')
            ->select('name', true)
            ->where(['check_up_id' => $check_up_id])
            ->fetchAll();
    }
}
