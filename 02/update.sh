echo -e "\n---\n" > tmp
echo -e "### Computer Modelling in Chemical Technology: Scilab worked examples\n" >> tmp
echo -e "#### Module 2. Mass balance\n" >> tmp	 
echo "[Example 2.1](#example-21)" >> tmp
echo "[Example 2.2](#example-22)" >> tmp
echo "[Example 2.3](#example-23)" >> tmp
echo "[Example 2.4](#example-21)" >> tmp
echo -e "\n---\n" >> tmp


echo -e "\n##### Example 2.1\n" >> tmp
echo '```scilab' >> tmp
cat ex2.1.sce >> tmp
echo '```' >> tmp


cat tmp > README.md
rm tmp
