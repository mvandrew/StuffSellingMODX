<?php
/**
 * @var StuffSelling
 */
$stuffselling = $modx->getService(
	"stuffselling",
	"StuffSelling",
	$modx->getOption(
		"stuffselling.core_path",
		null,
		$modx->getOption("core_path") . "components/stuffselling/"
	) . "model/stuffselling/",
	$scriptProperties
);

if ( !($stuffselling instanceof StuffSelling) )
	return "";

$stuffselling->display_elements();
return "<script>window.ssAssetsUrl = '" . $stuffselling->config['assetsUrl'] . "';</script>";