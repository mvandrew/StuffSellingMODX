<?php
/**
 * Percent discount value calculation
 */
$price = $modx->getOption('price', $scriptProperties, '0');
$price_old = $modx->getOption('price_old', $scriptProperties, '0');

$discount_res = 0;

if ($price > 0 && $price_old > 0) {
	$discount_res = 100 - round($price * 100 / $price_old, 0);
}

return $discount_res;