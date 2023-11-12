% Connect to your Arduino board (replace 'COM3' with the actual COM port)
a = arduino('COM3');

% Define the pins connected to the sorting gates
quarterPin = 'D2'; % Replace with the actual pin numbers (e.g., 'D2' for digital pin 2)
dimePin = 'D3';
nickelPin = 'D4';
pennyPin = 'D5';
junkPin = 'D6'; % Used for unidentified coins

while true
    % Simulate the coin type identified by Python (replace with actual type)
    coinType = 'penny';  % Get the coin type from Python 

    % Control the pins based on the identified coin type
    switch coinType
        case 'quarter'
            fprintf('Identified a quarter. Sorting...\n');
            % Activate quarter sorting 
            writeDigitalPin(a, quarterPin, 1); % 1 for HIGH
        case 'dime'
            fprintf('Identified a dime. Sorting...\n');
            % Activate dime sorting 
            writeDigitalPin(a, dimePin, 1); 
        case 'nickel'
            fprintf('Identified a nickel. Sorting...\n');
            % Activate nickel sorting 
            writeDigitalPin(a, nickelPin, 1);
        case 'penny'
            fprintf('Identified a penny. Sorting...\n');
            % Activate the penny sorting mechanism
            writeDigitalPin(a, pennyPin, 1); % 1 for HIGH
        otherwise
            fprintf('Coin not recognized. Sorting as junk...\n');
            % Activate junk sorting 
            writeDigitalPin(a, junkPin, 1); % 1 for HIGH
    end

    % Set a delay for the sorting process TBD
    pause(1);

    % Deactivate all sorting mechanisms
    writeDigitalPin(a, quarterPin, 0); % 0 for LOW
    writeDigitalPin(a, dimePin, 0);
    writeDigitalPin(a, nickelPin, 0);
    writeDigitalPin(a, pennyPin, 0);
    writeDigitalPin(a, junkPin, 0);
end

%#include <i2cmaster.h>
%#include <AFMotor.h>
%// Connect a stepper motor with 48 steps per revolution (7.5 degree)
%// to motor port #1 and #2 (M1 and M2, M3 and M4)
%int resolution = 96;
%AF_Stepper motory(resolution, 2);
%AF_Stepper motorx(resolution, 1);
%int x = 0; // position
%int y = 0;
int reset = 0;
%int mid = resolution / 2;
%void setup(){
%Serial.begin(9600);
%Serial.println("Setup...");
%i2c_init(); //Initialise the i2c bus
%PORTC = (1 << PORTC4) | (1 << PORTC5); //enable pullups
%motorx.setSpeed(60); // Motor 1 50 rpm
%motory.setSpeed(60); // Motor 2 50 rpm
%delay(5000); // 5 second delay to allow for capturing
%}
%void loop(){
%if ((x == (0)) && (y == (resolution))) {
%if (reset == 0){
%motory.step(resolution, BACKWARD, DOUBLE); // Move to bottom left
%reset = 1;
%}
%Serial.end();
%}
%int dev = 0x5A<<1;
%int data_low = 0;
%int data_high = 0;
%int pec = 0;
%i2c_start_wait(dev+I2C_WRITE);
%i2c_write(0x07);
%// read
%i2c_rep_start(dev+I2C_READ);
%data_low = i2c_readAck(); //Read 1 byte and then send ack
%data_high = i2c_readAck(); //Read 1 byte and then send ack
%Serial.print(y);
%delay(10); // wait a 10 millisecond before printing again
%if ((x < (resolution-1)) && (y < resolution)){
%motorx.step(1, FORWARD, DOUBLE); // +x direction
%x = x+1;
%}
%else if (x == (resolution-1)){
%motory.step(1, FORWARD, DOUBLE); // +y direction
%y = y+1;
%delay(1);
%motorx.step(resolution, BACKWARD, DOUBLE);
%x = 0;
%}
%}
