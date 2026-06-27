#!/usr/bin/env bash

if [ $# -lt 4 ]; then
    echo "Usage: convert <amount> <from_unit> to <to_unit>" | rofi -dmenu -p "♠ Converter" -theme-str 'listview { enabled: false; }'
    exit 1
fi

amount="$1"
# Keep original case for the physical unit engine
from_raw="$2"
to_raw="$4"

# Create uppercase versions strictly for the currency checker
from_currency=$(echo "$2" | tr '[:lower:]' '[:upper:]')
to_currency=$(echo "$4" | tr '[:lower:]' '[:upper:]')

# Display a quick overlay while the script resolves the data
echo "🎲 Rolling for values..." | rofi -dmenu -p "converter" -theme-str 'listview { lines: 1; }' &
LOADING_PID=$!

output=""

# --- SECTION 1: LIVE CURRENCY CONVERSION ---
# Check if it's a 3-letter string, but EXCLUDE known unit shortcuts like KMH, KPH, MPH
if [[ "$from_currency" =~ ^[A-Z]{3}$ ]] && [[ "$to_currency" =~ ^[A-Z]{3}$ ]] && \
   [[ "$from_currency" != "KMH" && "$to_currency" != "KMH" ]] && \
   [[ "$from_currency" != "KPH" && "$to_currency" != "KPH" ]] && \
   [[ "$from_currency" != "MPH" && "$to_currency" != "MPH" ]]; then
    api_response=$(curl -s "https://api.frankfurter.dev/v1/latest?amount=${amount}&from=${from_currency}&to=${to_currency}")
    rate=$(echo "$api_response" | jq -r ".rates.${to_currency}" 2>/dev/null)
    
    if [ "$rate" != "null" ] && [ -n "$rate" ]; then
        output="${amount} ${from_currency} = ${rate} ${to_currency} (Live Rate)"
    else
        output="Error: Failed to fetch live currency or invalid symbol."
    fi

# --- SECTION 2: PHYSICAL UNIT CONVERSION (GNU UNITS) ---
else
    # Normalize temperature syntax (GNU units expects 'tempC' or 'tempF' for absolute values)
    if [[ "$from_raw" =~ ^[cC]$ || "$from_raw" == "celsius" ]]; then from_raw="tempC"; fi
    if [[ "$from_raw" =~ ^[fF]$ || "$from_raw" == "fahrenheit" ]]; then from_raw="tempF"; fi
    if [[ "$to_raw" =~ ^[cC]$ || "$to_raw" == "celsius" ]]; then to_raw="tempC"; fi
    if [[ "$to_raw" =~ ^[fF]$ || "$to_raw" == "fahrenheit" ]]; then to_raw="tempF"; fi

    # Run the offline units engine using the raw user inputs
    calc=$(units --terse "$amount $from_raw" "$to_raw" 2>/dev/null)

    if [ -n "$calc" ]; then
        # Clean up the output text labels if temperatures were converted
        display_from=$(echo "$from_raw" | sed 's/temp//')
        display_to=$(echo "$to_raw" | sed 's/temp//')
        
        # Trim any unnecessary whitespaces or newlines from the calculation
        calc_clean=$(echo "$calc" | tr -d '\n')
        output="${amount} ${display_from} = ${calc_clean} ${display_to}"
    else
        output="Error: Could not convert '${from_raw}' to '${to_raw}'. Check spelling/case!"
    fi
fi

# Dismiss loading indicator 
kill $LOADING_PID 2>/dev/null

# Render the result card
echo "" | rofi -dmenu \
    -p "♠ Conversion" \
    -filter "${amount} $2 to $4" \
    -mesg "${output}" \
    -theme-str 'listview { enabled: false; }'
