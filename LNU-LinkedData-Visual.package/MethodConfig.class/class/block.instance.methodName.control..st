as yet unclassified
block: aCommandBlock instance: anInstance methodName: methodName control: control

	^ self new
		block: aCommandBlock;
		instance: anInstance;
		control: control;
		methodName: methodName