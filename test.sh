# write test file
cat answers/$TESTKEY.js
in=$(cat templates/${TESTKEYCAMEL}Test.txt)
in2=$(cat answers/$TESTKEY.js)
sep='//LEETCODE_MVP_ANSWER'
echo "${in//$sep/$in2}" > src/tests/${TESTKEYCAMEL}Test.java
# build and run
mvn package dependency:copy-dependencies -o --legacy-local-repository
java -cp .:target/*:target/dependency/* tests.${TESTKEYCAMEL}Test