echo -e "\n---\n" > tmp
echo -e "### Computer Modelling in Chemical Technology: Scilab worked examples\n" >> tmp
echo -e "#### Module 6. Ideal reactors\n" >> tmp	 
echo "[Example 6.1](#example-61) | [Example 6.2](#example-62) | [Example 6.3](#example-63)" >> tmp
echo -e "\n---\n" >> tmp

echo -e "\n##### Example 6.1\n" >> tmp
echo '```scilab' >> tmp
cat ex6.1.sce >> tmp
echo '```' >> tmp


echo -e "\n##### Example 6.2\n" >> tmp
echo '```scilab' >> tmp
cat ex6.2.sce >> tmp
echo '```' >> tmp

echo -e "\n##### Example 6.3\n" >> tmp
echo '```scilab' >> tmp
cat ex6.3.sce >> tmp
echo '```' >> tmp


cat tmp > README.md
rm tmp
