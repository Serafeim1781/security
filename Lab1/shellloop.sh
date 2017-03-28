#!/bin/bash

a=0
while [$a -ge 0]
do
	echo $a
	./stack
	a= 'expr $a + 1'
done
