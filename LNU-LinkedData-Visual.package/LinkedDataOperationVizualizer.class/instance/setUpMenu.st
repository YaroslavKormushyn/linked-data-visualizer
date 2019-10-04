initialization
setUpMenu
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
	composer view addMenu: 'Pause' callback: [ process suspend ].
	composer view
		addMenu: 'Resume'
		callback: [  process resume ].
		"composer view addMenu: 'Reset' callback: [ process terminate -> should reset the view and reinit the process and links]"