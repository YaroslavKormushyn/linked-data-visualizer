as yet unclassified
block: aBlock instance: anInstance when: controlAndWhen
"simplify instance creation - controlAndWhen is a collection of {control when}"
	^ self new block: aBlock control: controlAndWhen first instance: anInstance when: controlAndWhen second