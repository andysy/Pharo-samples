"
""OK""

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	cells:		<Object>


    Implementation Points
"
Class {
	#name : #LOGame,
	#superclass : #BorderedMorph,
	#instVars : [
		'cells'
	],
	#category : #'PBE-LightsOut'
}

{ #category : #initialization }
LOGame >> initialize [
	| sampleCell width height n |
	super initialize.
	n := self cellsPerSide .
	sampleCell := LOCell new.
	width:=sampleCell width.
	height:=sampleCell height.
	self bounds:(5@5 extent:(width*n)@(height*n)+(2*self borderWidth)).
	cells:=Array2D new:n tabulate:[:i :j | self newCellAt:i at:j]
]

{ #category : #accessing }
LOGame >> newCellAt: i at: j [
"Create a cell for position (i,j) and add it to my onscreen representation
 at the appropriate screen position. Answer the new cell."
	| c origin |
	c := LOCell new.
	origin := self innerBounds origin.
	self addMorph: c.
	c position: ((i-1) * c width) @ ((j-1)* c height) + origin.
	c mouseAction: [  self toggleNeighboursOfCellAt: i at: j ].
	^ c
]

{ #category : #accessing }
LOGame >> toggleNeighboursOfCellAt: i at: j [

	i > 1 
		ifTrue: [ (cells at:i-1 at:j) toggleState ].
		
	i < self cellsPerSide 
		ifTrue: [ (cells at:i+1 at:j) toggleState ].
		
	j > 1 
		ifTrue: [ (cells at:i at:j-1) toggleState ].
		
	j < self cellsPerSide 
		ifTrue: [ (cells at:i at:j+1) toggleState ]				
]
