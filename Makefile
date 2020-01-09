all:	rust java c cpp ada go c_sharp

rust:	mtt.rs
	rustc -O -o mtt_rust mtt.rs
	strip -s mtt_rust

java:	Mtt.java
	javac Mtt.java

c:	mtt.c
	gcc -O3 -o mtt_c mtt.c
	strip -s mtt_c

cpp:	mtt.cpp
	g++ -O3 -o mtt_cpp mtt.cpp
	strip -s mtt_cpp

ada:	mtt.adb
	rm -f mtt.ali
	gnatmake -o mtt_ada -O3 mtt.adb
	strip -s mtt_ada

go:	mtt.go
	go build -o mtt_go mtt.go
	strip -s mtt_go

c_sharp: Mtt.cs
	mcs Mtt.cs

zig:	mtt.zig
	zig build-exe mtt.zig --release-small --strip --name mtt_zig

clean:
	rm -f mtt_rust Mtt.class mtt_c mtt_ada mtt.ali mtt.o mtt_go mtt_cpp Mtt.exe mtt_zig

test_compiled:	all
	time ./mtt_rust
	time ./mtt_c
	time ./mtt_cpp
	time java Mtt
	time ./mtt_ada
	time ./mtt_go
	time mono Mtt.exe
	time ./mtt_zig

test_interpreted:
	time python3 mtt.py
	time python2 mtt.py
	time ruby mtt.rb
	time lua mtt.lua
	time perl mtt.pl
	time perl6 mtt.pl6

test_jit:
	time luajit mtt.lua
	time pypy3 mtt.py

test:	test_compiled test_interpreted test_jit


dependencies_rhel:
	sudo yum install java-1.8.0-openjdk-devel rust python34

dependencies_fedora:
	sudo dnf install java-9-openjdk-devel rust python3
	sudo update-alternatives --set java /usr/lib/jvm/java-9-openjdk-*/bin/java
	sudo update-alternatives --set javac /usr/lib/jvm/java-9-openjdk-*/bin/javac


