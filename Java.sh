#!/bin/bash

# تابع برای تولید یک عدد رندوم در محدوده مشخص
getRandomInRange() {
  echo $(( RANDOM % ($2 - $1 + 1) + $1 ))
}

# تولید آدرس IPv4
generateIPv4() {
  ipv4Ranges=(
    "45.137.68."
    "45.137.76."
    "45.137.92."
    "45.137.140."
    "45.137.168."
    "45.137.172."
    "45.137.192."
    "45.137.200."
    "45.137.244."
    "45.138.40."
    "45.138.48."
    "45.138.56."
    "45.138.60."
    "45.138.116."
    "45.138.172."
    "45.138.204."
  )
  
  selectedRange=${ipv4Ranges[$(getRandomInRange 0 ${#ipv4Ranges[@]})]}
  fourthOctet=$(getRandomInRange 1 255) # جلوگیری از انتخاب 0 برای اکتت چهارم
  
  echo "${selectedRange}${fourthOctet}"
}

# تولید آدرس IPv6
generateIPv6() {
  hexCharacters="0123456789abcdef"
  getRandomHexPart() {
    part=""
    for ((i=0; i<$1; i++)); do
      part="$part${hexCharacters:$((RANDOM % 16)):1}"
    done
    echo $part
  }

  part1=$(getRandomHexPart 2)  # تولید 2 کاراکتر برای "**"
  part2=$(getRandomHexPart 4)  # تولید 4 کاراکتر برای "****"
  part3=$(getRandomHexPart 4)  # تولید 4 کاراکتر برای دومین "****"
  
  echo "2803:f800:${part1}::${part2}:${part3}"
}

# تابع برای نمایش آدرس IPv4
displayIPv4() {
  ip=$(generateIPv4)
  echo "IPv4 Address: $ip"
  echo "10.202.10.10 (Radar)"
  echo "78.157.42.100 (Electro)"
  echo "8.8.8.8 (Google Public)"
}

# تابع برای نمایش آدرس IPv6
displayIPv6() {
  ip1=$(generateIPv6)
  ip2=$(generateIPv6)
  echo "IPv6 Address 1: $ip1"
  echo "IPv6 Address 2: $ip2"
  echo "Made by: HELLBoY_deal"
}

# تولید آدرس‌ها
displayIPv4  # تولید آدرس IPv4
displayIPv6  # تولید آدرس IPv6
