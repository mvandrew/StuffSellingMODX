<?php
$stuffselling = $modx->getService(
	"stuffselling",
	"StuffSelling",
	$modx->getOption(
		"stuffselling.core_path",
		null,
		$modx->getOption("core_path") . "components/stuffselling"
	) . "model/components",
	$scriptProperties
);

if ( !($stuffselling instanceof StuffSelling) )
	return "";