
# Signature generation
# RSA 1kb
start_time=$(date +%s.%3N)
for ((i=0;i<$1;i++))
do
    gpg --output temp -u RSA_2048_sign_test --clearsign ../1kb_message
    rm temp
done
echo "RSA 1kb DONE"
end_time=$(date +%s.%3N)
rsa_1kb_time_taken=$(echo "scale=4; $end_time - $start_time" | bc -l)
rsa_1kb_average=$(echo "scale=4;$rsa_1kb_time_taken / $1" | bc -l)

# RSA 1MB
start_time=$(date +%s.%3N)
for ((i=0;i<$1;i++))
do
    gpg --output temp -u RSA_2048_sign_test --clearsign ../1MB_message
    rm temp
done
echo "RSA 1mb DONE"
end_time=$(date +%s.%3N)
rsa_1mb_time_taken=$(echo "scale=4; $end_time - $start_time" | bc -l)
rsa_1mb_average=$(echo "scale=4;$rsa_1mb_time_taken / $1" | bc -l)


# DSA 1kb
start_time=$(date +%s.%3N)
for ((i=0;i<$1;i++))
do
    gpg --output temp -u DSA_2048_sign_test --clearsign ../1kb_message
    rm temp
done
echo "DSA 1kb DONE"
end_time=$(date +%s.%3N)
dsa_1kb_time_taken=$(echo "scale=4; $end_time - $start_time" | bc -l)
dsa_1kb_average=$(echo "scale=4;$dsa_1kb_time_taken / $1" | bc -l)

# DSA 1mb
start_time=$(date +%s.%3N)
for ((i=0;i<$1;i++))
do
    gpg --output temp -u DSA_2048_sign_test --clearsign ../1MB_message
    rm temp
done
echo "DSA 1mb DONE"
end_time=$(date +%s.%3N)
dsa_1mb_time_taken=$(echo "scale=4; $end_time - $start_time" | bc -l)
dsa_1mb_average=$(echo "scale=4;$dsa_1mb_time_taken / $1" | bc -l)


# Signature verification
# RSA 1KB
gpg --output temp -u RSA_2048_sign_test --clearsign ../1kb_message
start_time=$(date +%s.%3N)
for ((i=0;i<$2;i++))
do
    gpg --verify temp |& :
done
echo "RSA 1kb verification DONE"
end_time=$(date +%s.%3N)
rm temp
rsa_1kb_time_taken_verification=$(echo "scale=3; $end_time - $start_time" | bc -l)
rsa_1kb_average_verification=$(echo "scale=4;$rsa_1kb_time_taken_verification / $2" | bc -l)

# RSA 1MB
gpg --output temp -u RSA_2048_sign_test --clearsign ../1MB_message
start_time=$(date +%s.%3N)
for ((i=0;i<$2;i++))
do
    gpg --verify temp |& :
done
echo "RSA 1mb verification DONE"
end_time=$(date +%s.%3N)
rm temp
rsa_1mb_time_taken_verification=$(echo "scale=3; $end_time - $start_time" | bc -l)
rsa_1mb_average_verification=$(echo "scale=4;$rsa_1mb_time_taken_verification / $2" | bc -l)

# DSA 1KB
gpg --output temp -u DSA_2048_sign_test --clearsign ../1kb_message
start_time=$(date +%s.%3N)
for ((i=0;i<$2;i++))
do
    gpg --verify temp |& :
done
echo "DSA 1kb verification DONE"
end_time=$(date +%s.%3N)
rm temp
dsa_1kb_time_taken_verification=$(echo "scale=3; $end_time - $start_time" | bc -l)
dsa_1kb_average_verification=$(echo "scale=4;$dsa_1kb_time_taken_verification / $2" | bc -l)

# DSA 1MB
gpg --output temp -u DSA_2048_sign_test --clearsign ../1MB_message
start_time=$(date +%s.%3N)
for ((i=0;i<$2;i++))
do
    gpg --verify temp |& :
done
echo "DSA 1mb verification DONE"
end_time=$(date +%s.%3N)
rm temp
dsa_1mb_time_taken_verification=$(echo "scale=3; $end_time - $start_time" | bc -l)
dsa_1mb_average_verification=$(echo "scale=4;$dsa_1mb_time_taken_verification / $2" | bc -l)


# Printing
echo
echo "Results from signature generation:"
echo "  Iterations: $1"
echo "  RSA 1KB"
echo "      Total time: $rsa_1kb_time_taken (s)"
echo "      Average: 0$rsa_1kb_average (s)"
echo ""
echo "  RSA 1MB"
echo "      Total time: $rsa_1mb_time_taken (s)"
echo "      Average: 0$rsa_1mb_average (s)"
echo ""
echo "  DSA 1KB"
echo "      Total time: $dsa_1kb_time_taken (s)"
echo "      Average: 0$dsa_1kb_average (s)"
echo ""
echo "  DSA 1MB"
echo "      Total time: $dsa_1mb_time_taken (s)"
echo "      Average: 0$dsa_1mb_average (s)"
echo ""
echo
echo "Results from signature verification:"
echo "  Iterations: $2"
echo "  RSA 1KB"
echo "      Total time: $rsa_1kb_time_taken_verification (s)"
echo "      Average: 0$rsa_1kb_average_verification (s)"
echo ""
echo "  RSA 1MB"
echo "      Total time: $rsa_1mb_time_taken_verification (s)"
echo "      Average: 0$rsa_1mb_average_verification (s)"
echo ""
echo "  DSA 1KB"
echo "      Total time: $dsa_1kb_time_taken_verification (s)"
echo "      Average: 0$dsa_1kb_average_verification (s)"
echo ""
echo "  DSA 1MB"
echo "      Total time: $dsa_1mb_time_taken_verification (s)"
echo "      Average: 0$dsa_1mb_average_verification (s)"
echo ""