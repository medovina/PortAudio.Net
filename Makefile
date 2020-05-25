# Build PortAudio.NET on Mono.

LIB = build/PortAudio.Net.dll

TEST_APP = build/TestApp.exe

all: $(LIB) $(TEST_APP)

$(LIB): PortAudio.Net/*.cs
	mkdir -p build
	csc /unsafe -target:library $^ -out:$@

TEST_SOURCES = PortAudio.Net.TestApp/*.cs

$(TEST_APP): $(TEST_SOURCES) $(LIB)
	csc $(TEST_SOURCES) /r:System.Numerics.dll /r:$(LIB) -out:$@
