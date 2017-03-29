#! /bin/awk -f
BEGIN{
    printf "API                                     COUNT\n"
    printf "---------------------------------------------\n"
}

{
    key = $6$7
    if(key ~ /.*\/[^?]*$/){
    } else{
	gsub(/\?.*/, "", key)
    }

    if(key ~ /.*\/[0-9]*.*/){
        gsub(/[\/][0-9]+/, "/0", key)
    }

    a[key]++
}

END{
    tcount = 0
    for (i in a){ 
        print i " " a[i]  > "032x.txt"
        tcount += a[i]
        printf "%-16s %8d\n", i, a[i]
    }
    printf "---------------------------------------------\n"
    printf "  TOTAL:%d \n", length(a)
    printf "  COUNT:%d \n", tcount
}
