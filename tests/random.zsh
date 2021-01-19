0=${(%):-%N}
@echo "=== ${0:t:r} ==="

source ${0:a:h:h}/zebrafish.zsh

r=$(random)
@test "random number >= 0" $r -ge 0
@test "random number <= 32767" $r -le 32767
