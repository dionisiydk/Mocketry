baselines
baseline: spec
	<baseline>
	
	spec for: #common do: [
		spec 
			baseline: 'StateSpecs' with: [
		 	    spec repository: 'github://dionisiydk/StateSpecs:v2.4.x'];
			baseline: 'Ghost' with: [
		 	    spec repository: 'github://pharo-ide/Ghost:v3.1.x'];
			project: 'GhostCore' copyFrom: 'Ghost' with: [
		 	    spec	loads: #('ObjectGhost' 'GTSupport' 'StateSpecsSupport' 'ObjectMutation')];
			project: 'GhostTests' copyFrom: 'Ghost' with: [
		 	    spec	loads: #('ObjectGhostTests' 'StateSpecsSupport' 'ClassGhostTests' 'ObjectMutationTests')];
			package: 'Mocketry-Specs' with: [ spec requires: #('StateSpecs')];
			package: 'Mocketry-Domain' with: [ spec requires: #('Mocketry-Specs' 'GhostCore')];
			package: 'Mocketry-Help' with: [ spec requires: #('Mocketry-Domain')];
			package: 'Mocketry-Specs-Tests' with: [ spec requires: #('Mocketry-Specs') ];
			package: 'Mocketry-Domain-Tests' with: [ spec requires: #('Mocketry-Specs' 'GhostTests') ].
		spec
			group: 'default' with: #('Core' 'Tests');
			group: 'Core' with: #('Mocketry-Specs' 'Mocketry-Domain');
			group: 'Tests' with: #('Mocketry-Specs-Tests' 'Mocketry-Domain-Tests' 'Mocketry-Help')].
