<?php
$price = $modx->getOption('price', $scriptProperties, '0');
$decimals = $modx->getOption('decimals', $scriptProperties, '0');

return number_format($price, $decimals, ',', '&nbsp;');