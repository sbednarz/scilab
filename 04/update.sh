echo -e "\n---\n" > tmp
echo -e "### Computer Modelling in Chemical Technology: Scilab worked examples\n" >> tmp
echo -e "#### Module 4. Chemical Kinetics\n" >> tmp	 
echo "[Example 4.2](#example-42) | " >> tmp
echo -e "\n---\n" >> tmp


echo -e "\n##### Example 4.2\n" >> tmp
echo '```scilab' >> tmp
cat ex4.2.sce >> tmp
echo '```' >> tmp


cat tmp > README.md
rm tmp
