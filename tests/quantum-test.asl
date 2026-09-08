(module asl-quantum/tests/quantum-test
  :d "Unit test suite for Quantum DSL: circuit construction, gate application, and OpenQASM 3.0 generation."
  :x [test-bell-circuit
      test-ghz-circuit
      test-openqasm-header
      run-tests]
  :i [(quantum :a q)
      (circuit :a circ)
      (emit-qasm :a qasm)])

(df test-bell-circuit [] -> Bool
  :d "Verifies Bell pair circuit has 2 qubits and 2 classical bits."
  (let [(bell (q/build-bell-pair))]
    (assert (= (.-num-qubits bell) 2) "Bell pair circuit must have 2 qubits")
    (assert (= (.-num-clbits bell) 2) "Bell pair circuit must have 2 clbits")
    true))

(df test-ghz-circuit [] -> Bool
  :d "Verifies GHZ state circuit has 3 qubits."
  (let [(ghz (q/build-ghz-state))]
    (assert (= (.-num-qubits ghz) 3) "GHZ circuit must have 3 qubits")
    true))

(df test-openqasm-header [] -> Bool
  :d "Verifies synthesized OpenQASM contains version header and register declarations."
  (let [(bell (q/build-bell-pair))
        (code (qasm/emit-openqasm bell))]
    (assert (string-contains? code "OPENQASM 3.0;") "OpenQASM must contain OPENQASM 3.0;")
    (assert (string-contains? code "qubit[2] q;") "OpenQASM must declare qubit[2] q;")
    true))

(df run-tests [] -> Bool
  :d "Runs all quantum unit tests."
  (do
    (assert (test-bell-circuit) "test-bell-circuit must pass")
    (assert (test-ghz-circuit) "test-ghz-circuit must pass")
    (assert (test-openqasm-header) "test-openqasm-header must pass")
    true))
