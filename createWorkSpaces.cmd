rem "C:\Program Files\Git\bin\git.exe" clone http://jurgenhintze:8ungbaby@github.com/Pearlchain/Pearlchain.git
"C:\Program Files\Git\bin\git.exe" remote add central http://jurgenhintze:8ungbaby@github.com/Pearlchain/Pearlchain.git
rem "C:\Program Files\Git\bin\git.exe" clone http://jurgenhintze:8ungbaby@github.com/Pearlchain/Canon.git
"C:\Program Files\Git\bin\git.exe" remote add central http://jurgenhintze:8ungbaby@github.com/Pearlchain/Canon.git
cd pearlchain
"C:\Program Files\Git\bin\git.exe" checkout 4.0.14-CAN-DEV
cd ..
cd Canon
"C:\Program Files\Git\bin\git.exe" checkout CAN-DEV
cd ..
