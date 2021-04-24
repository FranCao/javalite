ts=$(date +%s%N)
./BuildAndRun.sh tests/performance/test-Int-Arithmetic.jl
echo Int-Arithmetic Test take: $((($(date +%s%N) - $ts)/1000000)) ms

ts=$(date +%s%N)
./BuildAndRun.sh tests/performance/test-Double-Arithmetic.jl
echo Float-Arithmetic Test take: $((($(date +%s%N) - $ts)/1000000)) ms

ts=$(date +%s%N)
./BuildAndRun.sh tests/performance/test-If-Condition.jl
echo If-Condition Test take: $((($(date +%s%N) - $ts)/1000000)) ms

ts=$(date +%s%N)
./BuildAndRun.sh tests/performance/test-Array-Access.jl
echo Array-Access Test take: $((($(date +%s%N) - $ts)/1000000)) ms

ts=$(date +%s%N)
./BuildAndRun.sh tests/performance/test-Class-Field-Access.jl
echo Class-Field-Access Test take: $((($(date +%s%N) - $ts)/1000000)) ms
