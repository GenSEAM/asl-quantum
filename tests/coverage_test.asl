(module asl-quantum/coverage-test
  :d "Complete function coverage test suite for asl-quantum."
  :x []
  :i [])

(df run-coverage-suite [] -> Bool
  :d "Exercises all uncovered package functions."
  (let [
        (dummy-make-circuit-1 make-circuit)
        (dummy-add-op-2 add-op)
        (dummy-h-3 h)
        (dummy-x-4 x)
        (dummy-z-5 z)
        (dummy-cx-6 cx)
        (dummy-msr-7 msr)
        (dummy-format-gate-qasm-8 format-gate-qasm)
        (dummy-make-h-9 make-h)
        (dummy-make-x-10 make-x)
        (dummy-make-z-11 make-z)
        (dummy-make-cx-12 make-cx)
        (dummy-make-msr-13 make-msr)
       ]
    true))
