echo -e "\n---\n" > tmp
echo -e "### Computer Modelling in Chemical Technology: Scilab worked examples\n" >> tmp
echo -e "#### Module 5. Thermal effects\n" >> tmp	 
echo "[Example 5.1](#example-51) | [Example 5.2](#example-52) | [Example 5.3](#example-53) | [Example 5.4](#example-54)" >> tmp
echo -e "\n---\n" >> tmp

echo -e "\n##### Example 5.1\n" >> tmp
echo '```scilab' >> tmp
cat ex5.1.sce >> tmp
echo '```' >> tmp


echo -e "\n##### Example 5.2\n" >> tmp
echo '```scilab' >> tmp
cat ex5.2.sce >> tmp
echo '```' >> tmp

echo -e "\n##### Example 5.3\n" >> tmp
echo '```scilab' >> tmp
cat ex5.3.sce >> tmp
echo '```' >> tmp


echo -e "\n##### Example 5.4\n" >> tmp
echo '```scilab' >> tmp
cat ex5.4.sce >> tmp
echo '```' >> tmp

cat tmp > README.md
rm tmp
