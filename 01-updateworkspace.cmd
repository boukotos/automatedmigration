cd pearlchain
"C:\Program Files\Git\bin\git.exe" reset --hard
"C:\Program Files\Git\bin\git.exe" checkout 4.0.14-CAN-DEV
"C:\Program Files\Git\bin\git.exe" fetch central
"C:\Program Files\Git\bin\git.exe" pull --rebase central 4.0.14-CAN-DEV
cd ..
cd canon
"C:\Program Files\Git\bin\git.exe" reset --hard
"C:\Program Files\Git\bin\git.exe" checkout CAN-DEV
"C:\Program Files\Git\bin\git.exe" fetch central
"C:\Program Files\Git\bin\git.exe" pull --rebase central CAN-DEV
cd ..
