#
# ~/.bashrc
#


# If not running interactively, don't do anything
#[[ $- != *i* ]] && return
case $- in
  *i*) ;;
    *) return;;
esac

# don't put duplicate linses or lines starting with space in the history
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if ncessary,
#		update the values of LINES and COLUMS
shopt -s checkwinsize

#export PULSE_LATENCY_MSEC=60
export EDITOR=nano

export PATH=$HOME/bin:$PATH

# include .bashrc_aliases if it exists
BASHRC_CONF=($HOME/.bashrc_aliases $HOME/.bashrc_prompt)
for i in ${BASHRC_CONF[@]}
do
    if [ -f $i ]; then
        source $i
				# echo $i
    fi
done

unset color_prompt force_color_prompt
