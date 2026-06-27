#!/usr/bin/env bash

# exit immediately if no initial query is present
if [ $# -eq 0 ]; then
    exit 0
fi

# the prompt engineering to keep the ai's output matching your clean ui
system_instruction="reply in plain text only. do not use latex, math blocks, backslashes, or markdown symbols."

# initialize our chat history with your very first question
current_prompt="$*"
chat_history="user: ${current_prompt}"

while true; do
    # 1. show the loading screen using your current question
    echo "🎲 shuffling the deck... fetching ai response..." | rofi -dmenu -p "ai" -filter "$current_prompt" -theme-str 'listview { lines: 1; }' &
    loading_pid=$!

    # 2. package everything together and send it to tgpt
    full_query="${chat_history}. system instruction: ${system_instruction}"
    response=$(tgpt --quiet "$full_query")

    # kill the loading indicator cleanly
    kill $loading_pid 2>/dev/null

    # update our chat history with the ai's answer so it remembers context
    chat_history="${chat_history}\nai: ${response}"

    # 3. display the answer window. 
    # notice we enabled the entry box here so you can type a follow-up question!
    next_input=$(echo "" | rofi -dmenu \
        -p "♠ ai chat" \
        -filter "" \
        -placeholder "type follow-up or press esc to close..." \
        -mesg "$response" \
        -theme-str 'listview { enabled: false; }')

    # if the user presses escape, next_input will be empty or the exit code will be non-zero
    if [ -z "$next_input" ]; then
        break
    fi

    # update variables for the next loop turn
    current_prompt="$next_input"
    chat_history="${chat_history}\nuser: ${current_prompt}"
done
