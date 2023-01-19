# ! /usr/bin/expect -f

j=10
for ((i = 1; i <= j; i++)); do
    echo "start pushing git $i"
    spawn git push
    set timeout 30
    expect "Everything up-to-date" 
    {
        echo "pushing ok" 
        break
    }
    
done
