COMPILE_BINS := gcc g++ javac rustc gnatmake go mcs zig

gcc := $(shell command -v gcc 2> /dev/null)
g++ := $(shell command -v g++ 2> /dev/null)
javac := $(shell command -v javac 2> /dev/null)
rustc := $(shell command -v rustc 2> /dev/null)
gnatmake := $(shell command -v gnatmake 2> /dev/null)
go := $(shell command -v go 2> /dev/null)
mcs := $(shell command -v mcs 2> /dev/null)
zig := $(shell command -v zig 2> /dev/null)

python3 := $(shell command -v python3 2> /dev/null) 
python2 := $(shell command -v python2 2> /dev/null)
lua := $(shell command -v lua 2> /dev/null)
perl := $(shell command -v perl 2> /dev/null)
perl6 := $(shell command -v perl6 2> /dev/null)

luajit  := $(shell command -v luajit 2> /dev/null)
pypy3 := $(shell command -v pypy3 2> /dev/null)


all:	mtt_rust Mtt.class mtt_c mtt_cpp mtt_ada mtt_go Mtt.exe mtt_zig

mtt_rust:	mtt.rs
ifdef rustc
	rustc -O -o mtt_rust mtt.rs
	strip -s mtt_rust
endif

Mtt.class:	Mtt.java
ifdef javac
	javac Mtt.java
endif

mtt_c:	mtt.c
ifdef gcc
	gcc -O3 -o mtt_c mtt.c
	strip -s mtt_c
endif

mtt_cpp:	mtt.cpp
ifdef g++
	g++ -O3 -o mtt_cpp mtt.cpp
	strip -s mtt_cpp
endif

mtt_ada:	mtt.adb
ifdef gnatmake
	rm -f mtt.ali
	gnatmake -o mtt_ada -O3 mtt.adb
	strip -s mtt_ada
endif

mtt_go:	mtt.go
ifdef go
	go build -o mtt_go mtt.go
	strip -s mtt_go
endif

Mtt.exe:	Mtt.cs
ifdef mcs
	mcs Mtt.cs
endif

mtt_zig:	mtt.zig
ifdef zig
	zig build-exe mtt.zig --name mtt_zig
	strip -s mtt_zig
endif

clean:
	rm -f mtt_rust Mtt.class mtt_c mtt_ada mtt.ali mtt.o mtt_go mtt_cpp Mtt.exe mtt_zig

test_compiled:	all
ifdef rustc
	time ./mtt_rust
	@echo ""
endif
ifdef gcc
	time ./mtt_c
	@echo ""
endif
ifdef g++
	time ./mtt_cpp
	@echo ""
endif
ifdef javac
	time java Mtt
	@echo ""
endif
ifdef gnatmake
	time ./mtt_ada
	@echo ""
endif
ifdef go
	time ./mtt_go
	@echo ""
endif
ifdef mcs
	time mono Mtt.exe
	@echo ""
endif
ifdef zig
	time ./mtt_zig
	@echo ""
endif

test_interpreted:
ifdef python3
	time python3 mtt.py
	@echo ""
endif
ifdef python2
	time python2 mtt.py
	@echo ""
endif
ifdef ruby
	time ruby mtt.rb
	@echo ""
endif
ifdef lua
	time lua mtt.lua
	@echo ""
endif
ifdef perl
	time perl mtt.pl
	@echo ""
endif
ifdef perl6
	time perl6 mtt.pl6
	@echo ""
endif

test_jit:
ifdef luajit
	time luajit mtt.lua
	@echo ""
endif
ifdef pypy3
	time pypy3 mtt.py
	@echo ""
endif

test:	test_compiled test_interpreted test_jit


dependencies_rhel:
	sudo yum install java-1.8.0-openjdk-devel rust python34

dependencies_fedora:
	sudo dnf install java-9-openjdk-devel rust python3
	sudo update-alternatives --set java /usr/lib/jvm/java-9-openjdk-*/bin/java
	sudo update-alternatives --set javac /usr/lib/jvm/java-9-openjdk-*/bin/javac


