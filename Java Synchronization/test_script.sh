#!/usr/bin/bash

echo "Unsynchronized"

time timeout 3600 java UnsafeMemory Unsynchronized 1 100000000 5
time timeout 3600 java UnsafeMemory Unsynchronized 1 100000000 100
time timeout 3600 java UnsafeMemory Unsynchronized 1 100000000 300

time timeout 3600 java UnsafeMemory Unsynchronized 8 100000000 5
time timeout 3600 java UnsafeMemory Unsynchronized 8 100000000 100
time timeout 3600 java UnsafeMemory Unsynchronized 8 100000000 300

time timeout 3600 java UnsafeMemory Unsynchronized 16 100000000 5
time timeout 3600 java UnsafeMemory Unsynchronized 16 100000000 100
time timeout 3600 java UnsafeMemory Unsynchronized 16 100000000 300

time timeout 3600 java UnsafeMemory Unsynchronized 40 100000000 5
time timeout 3600 java UnsafeMemory Unsynchronized 40 100000000 100
time timeout 3600 java UnsafeMemory Unsynchronized 40 100000000 300

echo "Synchronized"

time timeout 3600 java UnsafeMemory Synchronized 1 100000000 5
time timeout 3600 java UnsafeMemory Synchronized 1 100000000 100
time timeout 3600 java UnsafeMemory Synchronized 1 100000000 300

time timeout 3600 java UnsafeMemory Synchronized 8 100000000 5
time timeout 3600 java UnsafeMemory Synchronized 8 100000000 100
time timeout 3600 java UnsafeMemory Synchronized 8 100000000 300

time timeout 3600 java UnsafeMemory Synchronized 16 100000000 5
time timeout 3600 java UnsafeMemory Synchronized 16 100000000 100
time timeout 3600 java UnsafeMemory Synchronized 16 100000000 300

time timeout 3600 java UnsafeMemory Synchronized 40 100000000 5
time timeout 3600 java UnsafeMemory Synchronized 40 100000000 100
time timeout 3600 java UnsafeMemory Synchronized 40 100000000 300

echo "AcmeSafe"

time timeout 3600 java UnsafeMemory AcmeSafe 1 100000000 5
time timeout 3600 java UnsafeMemory AcmeSafe 1 100000000 100
time timeout 3600 java UnsafeMemory AcmeSafe 1 100000000 300

time timeout 3600 java UnsafeMemory AcmeSafe 8 100000000 5
time timeout 3600 java UnsafeMemory AcmeSafe 8 100000000 100
time timeout 3600 java UnsafeMemory AcmeSafe 8 100000000 300

time timeout 3600 java UnsafeMemory AcmeSafe 16 100000000 5
time timeout 3600 java UnsafeMemory AcmeSafe 16 100000000 100
time timeout 3600 java UnsafeMemory AcmeSafe 16 100000000 300

time timeout 3600 java UnsafeMemory AcmeSafe 40 100000000 5
time timeout 3600 java UnsafeMemory AcmeSafe 40 100000000 100
time timeout 3600 java UnsafeMemory AcmeSafe 40 100000000 300
