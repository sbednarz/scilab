echo -e "\n---\n" > tmp
echo -e "### Computer Modelling in Chemical Technology: Scilab worked examples\n" >> tmp
echo -e "#### Module 4. Chemical Kinetics\n" >> tmp	 
echo "[Example 4.2](#example-42) | [Example 4.4](#example-44) | [Example 4.5](#example-45) " >> tmp
echo -e "\n---\n" >> tmp


echo -e "\n##### Example 4.2\n" >> tmp
echo '```scilab' >> tmp
cat ex4.2.sce >> tmp
echo '```' >> tmp

echo -e "\n##### Example 4.4\n" >> tmp
echo '```scilab' >> tmp
cat ex4.4.sce >> tmp
echo '```' >> tmp

echo -e "\n##### Example 4.5\n" >> tmp
echo '```scilab' >> tmp
cat ex4.5.sce >> tmp
echo '```' >> tmp



cat tmp > README.md
rm tmp
