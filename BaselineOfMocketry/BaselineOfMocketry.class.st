Class {
	#name : #BaselineOfMocketry,
	#superclass : #BaselineOf,
	#category : 'BaselineOfMocketry'
}

{ #category : #baselines }
BaselineOfMocketry >> baseline: spec [
	<baseline>
	
	spec for: #common do: [
		spec 
			baseline: 'StateSpecs' with: [spec repository: 'github://dionisiydk/StateSpecs:dev'];
			project: 'StateSpecsCore' copyFrom: 'StateSpecs' with: [
		 	    spec	loads: #('Core' 'GhostSupport')];
			project: 'StateSpecsTests' copyFrom: 'StateSpecs' with: [
		 	    spec	loads: #('Tests' 'GhostSupportTests' )];	
				
			baseline: 'Ghost' with: [
		 	    spec repository: 'github://pharo-ide/Ghost:dev'];
			project: 'GhostCore' copyFrom: 'Ghost' with: [
		 	    spec	loads: #('ObjectGhost' 'GTSupport' 'ObjectMutation')];
			project: 'GhostTests' copyFrom: 'Ghost' with: [
		 	    spec	loads: #('ObjectGhostTests' 'ClassGhostTests' 'ObjectMutationTests')];
			package: 'Mocketry-Specs' with: [ spec requires: #('StateSpecsCore')];
			package: 'Mocketry-Domain' with: [ spec requires: #('Mocketry-Specs' 'GhostCore')];
			package: 'Mocketry-Help' with: [ spec requires: #('Mocketry-Domain')];
			package: 'Mocketry-Specs-Tests' with: [ 
				spec requires: #('Mocketry-Specs' 'StateSpecsTests') ];
			package: 'Mocketry-Domain-Tests' with: [ spec requires: #('Mocketry-Specs' 'GhostTests') ].
		spec
			group: 'default' with: #('Core' 'Tests');
			group: 'Core' with: #('Mocketry-Specs' 'Mocketry-Domain');
			group: 'Tests' with: #('Mocketry-Specs-Tests' 'Mocketry-Domain-Tests' 'Mocketry-Help')].

]
