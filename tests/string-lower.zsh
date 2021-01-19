0=${(%):-%N}
@echo "=== ${0:t:r} ==="

source ${0:a:h:h}/zebrafish.zsh

cmd='string lower'
result=$(string lower)
@test "'$cmd' has exit code 1" $? -eq 1
@test "'$cmd' prints nothing" "$result" = ""

cmd='string lower abc'
result=$(string lower ABC)
@test "'$cmd' has exit code 0" $? -eq 0
@test "'$cmd' prints abc" $result = "abc"

cmd='string lower A Ab Abc'
result=($(string lower A Ab Abc))
@test "'$cmd' has exit code 0" $? -eq 0
@test "'$cmd' prints 3 elements" ${#result} -eq 3
@test "'$cmd' prints a for A" ${result[1]} = "a"
@test "'$cmd' prints ab for Ab" ${result[2]} = "ab"
@test "'$cmd' prints abc for Abc" ${result[3]} = "abc"

cmd="string lower '' ''"
nl=$'\n'
result=$(string lower '' ''; ret=$?; echo .; exit "$ret"); ret=$?
@test "'$cmd' has exit code 1" $ret -eq 1
@test "'$cmd' prints empty for value 1" ${result[1]} = "$nl"
@test "'$cmd' prints empty for value 2" ${result[2]} = "$nl"
