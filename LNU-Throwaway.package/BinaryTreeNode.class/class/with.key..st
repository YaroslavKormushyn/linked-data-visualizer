instance creation
with: val key: k
	| el |
	el := self new.
	el value: val.
	el key: k.
	^ el