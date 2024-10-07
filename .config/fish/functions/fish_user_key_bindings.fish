function fish_user_key_bindings
  # CTRL-K to delete whole line
  bind --user \ck kill-whole-line # CTRL-K

  # CTRL-[ and CTRL-] to move by whitespace-delimited words
  bind --user \e\[91\;5u backward-bigword
  bind --user \e\[93\;5u forward-bigword

  # CTRL-BACKSPACE to delete whitespace-delimited word
  bind --user \e\[127\;5u backward-kill-bigword

  # CTRL-ENTER to accept and execute
  bind --user \e\[13\;5u accept-autosuggestion execute
end
