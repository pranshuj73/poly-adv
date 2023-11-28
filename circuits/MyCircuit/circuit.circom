pragma circom 2.0.0;

/*This circuit template checks that c is the multiplication of a and b.*/  

template MyCircuit () {  
   // inputs
   signal input a;
   signal input b;

   // intermediates
   signal x;
   signal y;

   // final output
   signal output q;

   // component gates required for the circuit
   component andGate = AND();
   component orGate = OR();
   component notGate = NOT();

   // circuit implementation
   andGate.a <== a;
   andGate.b <== b;
   x <== andGate.out;

   notGate.in <== b;
   y <== notGate.out;

   orGate.a <== x;
   orGate.b <== y;

   q <== orGate.out;
}

template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a*b;
}

template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a*b;
}

template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}

component main = MyCircuit();