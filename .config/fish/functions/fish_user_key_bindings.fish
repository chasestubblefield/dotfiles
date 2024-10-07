function fish_user_key_bindings
  bind --user \ck kill-whole-line # CTRL-K
  bind --user \e\[91\;5u backward-bigword # CTRL-[
  bind --user \e\[93\;5u forward-bigword # CTRL-]
  bind --user \e\[127\;5u backward-kill-bigword # CTRL-BACKSPACE
end
