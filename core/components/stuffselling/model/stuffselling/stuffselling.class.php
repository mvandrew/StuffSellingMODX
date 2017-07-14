<?php

class StuffSelling {
	/**
	 * @var modX
	 */
	public $modx;
	public $config;

	function xxconstruct(modX &$modx, array $config = array()) {

		$this->modx = &$modx;

		// Base Path
		$basePath = $this->modx->getOption(
			"stuffselling.core_path",
			$config,
			$this->modx->getOption("core_path") . "components/stuffselling"
		);

		// Assets URL
		$assetsUrl = $this->modx->getOption(
			"stuffselling.assets_url",
			$config,
			$this->modx->getOption("assets_url") . "components/stuffselling"
		);

		// Filling Configuration Parameters
		$this->config = array_merge(
			array(
				"basePath" => $basePath,
				"corePath" => $basePath,
				"modelPath" => $basePath . "model/",
				"processorsPath" => $basePath . "processors/",
				"templatesPath" => $basePath . "templatesPath/",
				"chunksPath" => $basePath . "elements/chunks/",
				"jsUrl" => $assetsUrl . "js/",
				"cssUrl" => $assetsUrl . "css/",
				"assetsUrl" => $assetsUrl,
				"connectorUrl" => $assetsUrl . "connector.php",
			),
			$config
		);

	}
}