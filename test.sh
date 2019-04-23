# write test file
in=$(cat templates/${TESTKEYCAMEL}Test.txt)
in2=$(cat answers/$TESTKEY.js)
sep='//LEETCODE_MVP_ANSWER'
echo "${in//$sep/$in2}" > src/tests/${TESTKEYCAMEL}Test.java

# build and run
mvn package >> /dev/null
java -cp .:target/*:target/dependency/* tests.${TESTKEYCAMEL}Test