<?php

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);

error_reporting(E_ALL);

/*error_reporting(E_ERROR);
ini_set('log_errors', 'On');
ini_set('error_log', __DIR__ . '/logs/php_errors.log');*/

require 'auto_loader_class.php';

use libs\DBCheckup;
\libs\DB::getInstance();

$model = new DBCheckup();

$items = $model->getItems();

array_walk($items, function (& $item) use ($model) {
    $item['advantages'] = $model->getAdvantagesByCheckUpId((int)$item['id']);
});

?>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>


<?php foreach ($items as $item): ?>
    <div class="card" style="width: 18rem;">
        <img src="<?= $item['image'] ?>" class="card-img-top" alt="...">
        <div class="card-body">
            <h4><?= $item['title'] ?></h4>
            <p class="card-text"><?= $item['description'] ?></p>
            <ul>
                <?php foreach ($item['advantages'] as $advantage): ?>
                    <li><?= $advantage['name'] ?></li>
                <?php endforeach; ?>
            </ul>
            <?php if (!empty($item['discount'])): ?>
                <div class="d-flex">
                    <span class="text-muted"><?= $item['discount'] ?></span>
                    <span><strike><?= $item['price'] ?></strike></span>
                </div>
            <?php else: ?>
                <span class="text-muted"><?= $item['price'] ?></span>
            <?php endif; ?>
        </div>
    </div>
<?php endforeach; ?>

</body>
</html>
