build ui
setUpMenuWithProcess: operationProcess
	composer view
		addMenu: 'Save'
		callback: [ (RTCanvasExporter canvas: composer view canvas)
				withoutFixedShapes;
				whole;
				scale: 5;
				oversizedBy: 20 @ 20;
				format: #png;
				fileName:
					((TRPlatform current
						dialogRequest: 'Please enter file name'
						initialAnswer: 'export.png') ifNil: [ ^ nil ]);
				export ].
	composer view addMenu: 'Pause' callback: [ operationProcess suspend ].
	composer view addMenu: 'Resume' callback: [ operationProcess resume ].
		"composer view
		addMenu: 'Stop'
		callback: [ operationProcess terminate.
			operationProcess := operationBlock newProcess ]."