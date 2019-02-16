cat 0201_mass_balance.md > tmp
echo '```scilab' >> tmp
cat 0201_mass_balance.sce >> tmp
echo '```' >> tmp
cat tmp > README.md



rm tmp
