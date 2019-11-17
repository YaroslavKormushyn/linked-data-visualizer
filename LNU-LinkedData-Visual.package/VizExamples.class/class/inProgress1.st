as yet unclassified
inProgress1
|statements blockNode yourNode mltempblock kt1 kt2|
statements := (KeyedTree>>#merge:) ast statements first arguments. "gives you all nodes that are statements of the method"
blockNode := statements first. "look into the statements and find the index x of the block node"
yourNode := blockNode statements first.
yourNode := (KeyedTree>>#merge:) ast statements first arguments first arguments first.
mltempblock := MetaLink new.
	mltempblock metaObject: [ :ctx :args | self halt. Transcript show: (ctx tempNamed: #subtree) asString; show: args; cr. ].
	mltempblock arguments: #(context arguments).
	mltempblock selector: #value:value:.
	mltempblock control: #before.
	
kt1 := (KeyedTree new
	at: 1 put: 'One';
	at: 2 put: 'Two';
	at: 'Tree' put: (KeyedTree new
					at: $a put: 'Tree-A';
					at: $b put: 'Tree-B';
					yourself);
	yourself).
	
kt2 := (KeyedTree new
	at: 3 put: 'Three';
	at: 'Tree' put: (KeyedTree new
					at: $a put: 'Tree-C';
					yourself);
	yourself).
kt1 link: mltempblock toAST: yourNode.
	kt1 merge: kt2