alias python="python3"
alias pip="pip3"
alias scl="screen -list"
alias scr="screen -r"
alias scs="screen -S"

function fpush()
{
    git add -A && git commit -m "$1" && git push
}

# dont activate me!!!!
# function ls()
# {
#     while :
#     do
#         sl -alF
#     done
# }
