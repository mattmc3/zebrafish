0=${(%):-%N}
@echo "=== ${0:t:r} ==="

source ${0:a:h:h}/zebrafish.zsh

result=$(string length)
@test "'string length' has exit code 1" $? -eq 1
@test "'string length' prints nothing" "$result" = ""

result=$(string length abc)
@test "'string length abc' has exit code 0" $? -eq 0
@test "'string length abc' prints 3" $result -eq 3

result=($(string length a ab abc))
@test "'string length a ab abc' has exit code 0" $? -eq 0
@test "'string length a ab abc' prints 3 elements" ${#result} -eq 3
@test "'string length a ab abc' prints length 1 for a" ${result[1]} -eq 1
@test "'string length a ab abc' prints length 2 for ab" ${result[2]} -eq 2
@test "'string length a ab abc' prints length 3 for abc" ${result[3]} -eq 3

cmd='string length "" ""'
result=($(string length "" ""))
@test "'$cmd' has exit code 1" $? -eq 1
@test "'$cmd' prints 2 elements" ${#result} -eq 2
@test "'$cmd' prints lengths 0 0" "${result}" = "0 0"

cmd='string length abc " " "" wxyz'
result=($(string length abc " " "" wxyz))
@test "'$cmd' has exit code 0" $? -eq 0
@test "'$cmd' prints 4 elements" ${#result} -eq 4
@test "'$cmd' prints lengths 3 1 0 4" "${result}" = "3 1 0 4"
