# name: @ghostrick/fish-theme
# ---------------
# Based on idan. Display the following bits on the left:
# - Virtualenv name (if applicable, see https://github.com/adambrenecki/virtualfish)
# - Current directory name
# - Git branch and dirty state (if inside a git repo)

function _git_branch_name
  echo (command git symbolic-ref HEAD 2> /dev/null | sed -e 's|^refs/heads/||')
end

function _git_is_dirty
  echo (command git status -s --ignore-submodules=dirty 2> /dev/null)
end

function fish_prompt
  set fish_greeting 'What\'s up, bro? Ꮚˊ•ﻌ•ˋᏊ '

  # Colors
  set -l red (set_color red)
  set -l green (set_color green)
  set -l normal (set_color normal)

  set -l redbold (set_color -o red)
  set -l greenbold (set_color --bold green)
  set -l whitebold (set_color -o white)

  set fish_color_normal white
  set fish_color_command green
  set fish_color_error red
  set fish_color_quote yellow
  set fish_color_param white
  set fish_color_search_match 888
  set fish_color_autosuggestion 888

  # Directory
  set -l cwd $whitebold(pwd | sed "s:^$HOME:~:")

  echo -e ''

  echo -n -s $cwd $normal

  # Git status
  if [ (_git_branch_name) ]
    set -l git_branch (_git_branch_name)

    if [ (_git_is_dirty) ]
      set git_info $greenbold 'git:' $git_branch "🌧️" $normal
    else
      set git_info $greenbold 'git:' $git_branch $normal
    end
    echo -n -s ' ' $git_info $normal
  end

  # If the last command was an error
  set -l last_status $status
  set -l prompt_color $redbold
  if test $last_status = 0
    set prompt_color $greenbold
  end


  echo -e ''
  echo -e -n -s $prompt_color '💧 ' $normal

end
