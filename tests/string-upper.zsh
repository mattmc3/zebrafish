0=${(%):-%N}
@echo "=== ${0:t:r} ==="

source ${0:a:h:h}/zebrafish.zsh

cmd='string upper'
result=$(string upper)
@test "'$cmd' has exit code 1" $? -eq 1
@test "'$cmd' prints nothing" "$result" = ""

cmd='string upper abc'
result=$(string upper abc)
@test "'$cmd' has exit code 0" $? -eq 0
@test "'$cmd' prints ABC" $result = "ABC"

cmd='string upper A Ab Abc'
result=($(string upper A Ab Abc))
@test "'$cmd' has exit code 0" $? -eq 0
@test "'$cmd' prints 3 elements" ${#result} -eq 3
@test "'$cmd' prints A for A" ${result[1]} = "A"
@test "'$cmd' prints AB for Ab" ${result[2]} = "AB"
@test "'$cmd' prints ABC for Abc" ${result[3]} = "ABC"

cmd="string upper '' ''"
nl=$'\n'
result=$(string upper '' ''; ret=$?; echo .; exit "$ret"); ret=$?
@test "'$cmd' has exit code 1" $ret -eq 1
@test "'$cmd' prints empty for value 1" ${result[1]} = "$nl"
@test "'$cmd' prints empty for value 2" ${result[2]} = "$nl"
