#!/usr/bin/bash

echo "Welcome to the basic calculator!" | tee -a operation_history.txt

re='^[-]?[0-9]*[.]?[0-9]+[ ]?[-\/*+^][ ]?[-]?[0-9]*[.]?[0-9]+$'

while true; do
      
      echo "Enter an arithmetic operation or type 'quit' to quit:" | tee -a operation_history.txt
      
      read eq
      input=$eq
      echo "$input" >> operation_history.txt
      
      if [ "$input" = "quit" ]; then
        echo "Goodbye!" | tee -a operation_history.txt
        break;
      fi

      if [[ $input =~ $re ]]; then
         answer=$(bc <<< "scale=2;$input")
         echo $answer | tee -a operation_history.txt
      else
         echo "Operation check failed!" | tee -a operation_history.txt
	 
      fi
done
    
