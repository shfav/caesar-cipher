#!/bin/bash


echo "Caesar Cipher Program"
echo "1. Encrypt a message"
echo "2. Decrypt a message"
read -p "Enter your choice (1 or 2): " choice
read -p "Input shift/key: " shift_
case $choice in
	1)
		read -p "Input your plain text: " plain_text
		encrypted=$(bash encrypt.sh "$plain_text" $shift_)
		echo "Result: $encrypted"
	;;
	2)
		read -p "Input your encrypted text: " encrypted_text
		decrypted=$(bash decrypt.sh "$encrypted_text" $shift_)
		echo "Result: $decrypted"
	;;
esac
