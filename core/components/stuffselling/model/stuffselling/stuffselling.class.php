<?php

class StuffSelling {
	/**
	 * @var modX
	 */
	public $modx = null;
	public $config = array();

	function __construct(modX &$modx, array $config = array()) {

		$this->modx = & $modx;

		// Base Path
		$basePath = $this->modx->getOption(
			"stuffselling.core_path",
			$config,
			$this->modx->getOption("core_path") . "components/stuffselling/"
		);

		// Assets URL
		$assetsUrl = $this->modx->getOption(
			"stuffselling.assets_url",
			$config,
			$this->modx->getOption("assets_url") . "components/stuffselling/"
		);

		// Filling Configuration Parameters
		$this->config = array_merge(
			array(
				"basePath"          => $basePath,
				"corePath"          => $basePath,
				"modelPath"         => $basePath . "model/",
				"processorsPath"    => $basePath . "processors/",
				"templatesPath"     => $basePath . "templatesPath/",
				"chunksPath"        => $basePath . "elements/chunks/",
				"jsUrl"             => $assetsUrl . "javascripts/",
				"cssUrl"            => $assetsUrl . "css/",
				"assetsUrl"         => $assetsUrl,
				"connectorUrl"      => $assetsUrl . "connector.php",
			),
			$config
		);

	} // __construct


	/**
	 * Process client request
	 *
	 * @return void
	 */
	public function process_request() {

	} // process_request


	/**
	 * Display on page elements
	 *
	 * @return string
	 */
	public function display_elements() {

		// Adding Styles
		$this->modx->regClientCSS( $this->config['cssUrl'] . 'popup.css' );

		// Adding Scripts
		$this->modx->regClientScript( $this->config['jsUrl'] . 'device.min.js' );
		$this->modx->regClientScript( $this->config['jsUrl'] . 'cpa.min.js' );
		$this->modx->regClientScript( $this->config['jsUrl'] . 'm1.min.js' );
		$this->modx->regClientScript( $this->config['jsUrl'] . 'stuffselling.min.js' );

		$popup = $this->modx->getChunk('ssPopupSection');

		return $popup;

	} // display_elements
}