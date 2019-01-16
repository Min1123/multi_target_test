all:	rust java c ada

rust:	mtt.rs
	rustc -O -o mtt_rust mtt.rs
	strip -s mtt_rust

java:	Mtt.java
	javac Mtt.java

c:	mtt.c
	gcc -O3 -o mtt_c mtt.c
	strip -s mtt_c

ada:	mtt.adb
	rm -f mtt.ali
	gnatmake -o mtt_ada -O3 mtt.adb
	strip -s mtt_ada

clean:
	rm -f mtt_rust Mtt.class mtt_c mtt_ada mtt.ali mtt.o

test:	all
	time ./mtt_rust
	bash -c "echo"
	time ./mtt_c
	bash -c "echo"
	time java Mtt
	bash -c "echo"
	time ./mtt_ada
	bash -c "echo"
	time python3 mtt.py
	bash -c "echo"
	time python2 mtt.py
	bash -c "echo"
	time ruby mtt.rb
	bash -c "echo"

dependencies_rhel:
	sudo yum install java-1.8.0-openjdk-devel rust python34

dependencies_fedora:
	sudo dnf install java-9-openjdk-devel rust python3
	sudo update-alternatives --set java /usr/lib/jvm/java-9-openjdk-*/bin/java
	sudo update-alternatives --set javac /usr/lib/jvm/java-9-openjdk-*/bin/javac


