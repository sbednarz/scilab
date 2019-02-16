echo -e "\n---\n" > tmp
echo -e "### Computer Modelling in Chemical Technology: Scilab worked examples\n" >> tmp
echo -e "#### Module 1. Scilab Introduction\n" >> tmp	 
echo "[Example 1.1 Intro](#example-11-intro) | " >> tmp
echo "[Example 1.2 Functions](#example-12-functions) | " >> tmp
echo "[Example 1.3 Reporting](#example-13-reporting) | " >> tmp
echo "[Example 1.4 Ploting](#example-14-ploting) | " >> tmp
echo "[Example 1.5 Loops](#example-15-loops)" >> tmp
echo -e "\n---\n" >> tmp


echo -e "\n##### Example 1.1 Intro\n" >> tmp
echo '```scilab' >> tmp
cat intro.sce >> tmp
echo '```' >> tmp


echo -e "\n##### Example 1.2 Functions\n" >> tmp
echo '```scilab' >> tmp
cat functions.sce >> tmp
echo '```' >> tmp


echo -e "\n##### Example 1.3 Reporting\n" >> tmp
echo '```scilab' >> tmp
cat reporting.sce >> tmp
echo '```' >> tmp


echo -e "\n##### Example 1.4 Ploting\n" >> tmp
echo '```scilab' >> tmp
cat ploting.sce >> tmp
echo '```' >> tmp


echo -e "\n##### Example 1.5 Loops\n" >> tmp
echo '```scilab' >> tmp
cat loops.sce >> tmp
echo '```' >> tmp


cat tmp > README.md
rm tmp
