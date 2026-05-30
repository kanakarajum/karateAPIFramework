Feature: Hello world

Scenario: Print hello world
	
	* print 'Hello world'
	* print 'hi i am kanaka'
	
Scenario: example declare variables
	* def a = 10
	* def b = 20
	* print 'Total value is :: ' + (a+b)
	
	
Scenario: lets try calculator
	* def a = 100
	* def b = 20
	* print 'multiplication: '+ (a*b)