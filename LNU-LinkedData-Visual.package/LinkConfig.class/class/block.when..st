as yet unclassified
block: aBlock when: controlAndWhen
	"simplify instance creation - controlAndWhen is a collection of {control when}
	without instance it's an empty template of a link, which should have instance eventually"

	^ self new
		block: aBlock
		control: controlAndWhen first
		when: controlAndWhen second