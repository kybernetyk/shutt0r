/*
	shutt0r.pde

	this is a sketch I'm using for time lapse photography with my
	canon EOS 50D. 

	get a N3 connector, a 2N2222 transistor and wire it up:
		n3 white wire [ground] -> arduino ground
		n3 red wire [shutter] -> 2N2222 collector 
		arduino ground -> 2N2222 emitter 
		arduino pin7 -> 2N2222 base

	I'll draw a schematic when I have time.

	LICENSE: GPL3
	(c) Leon Szpilewski 2011, http://jsz.github.com
*/

#define SHUTTER_PIN 7

void setup()
{
  pinMode(SHUTTER_PIN, OUTPUT);
  digitalWrite(SHUTTER_PIN, LOW);

	Serial.begin(9600); 
  Serial.println("shutt0r ready.");
}

//press shutter -> wait for t ms -> release shutter
void trigger(int t)
{
  Serial.println("pressing shutter ...");
  digitalWrite(SHUTTER_PIN, HIGH);
  delay(t);
  digitalWrite(SHUTTER_PIN, LOW);
  Serial.println("releasing shutter ...");         
}

void loop()
{
  trigger(100);
  delay(5000);
}

